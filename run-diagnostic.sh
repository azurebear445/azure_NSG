#!/bin/bash

# =============================================================================
# COMPREHENSIVE DIAGNOSTIC SCRIPT - RUN THIS ALL AT ONCE
# =============================================================================
# Copy everything below and paste into your terminal

echo "========================================================================="
echo "TERRAFORM NSG MODULE DIAGNOSTIC"
echo "========================================================================="
echo ""

# Save current directory
ORIGINAL_DIR=$(pwd)

echo "=== 1. CURRENT LOCATION ==="
pwd
echo ""

echo "=== 2. CHECKING MODULE ROOT ==="
cd terraform-azurerm-network_security_group 2>/dev/null || cd ../terraform-azurerm-network_security_group 2>/dev/null || cd ../../terraform-azurerm-network_security_group 2>/dev/null || echo "ERROR: Cannot find module root!"
MODULE_ROOT=$(pwd)
echo "Module root: $MODULE_ROOT"
echo ""

echo "=== 3. CHECKING MODULE FILES EXIST ==="
echo "locals.tf:"; ls -lh locals.tf 2>&1 | tail -1
echo "main.tf:"; ls -lh main.tf 2>&1 | tail -1
echo "enterprise-servicenow.tf:"; ls -lh enterprise-servicenow.tf 2>&1 | tail -1
echo ""

echo "=== 4. CHECKING locals.tf PRIORITIES ==="
echo "Looking for priority lines (should be 1500, 2000, 2500):"
grep -n "priority.*=" locals.tf | grep -E "(1500|2000|2500|100.*idx)"
echo ""

echo "=== 5. CHECKING locals.tf HAS ENTERPRISE MERGE ==="
echo "First 15 lines (should show all_enterprise_rules merge):"
head -15 locals.tf
echo ""

echo "=== 6. CHECKING main.tf HAS BOTH RESOURCES ==="
echo "NSG rule resources found:"
grep -n 'resource "azurerm_network_security_rule"' main.tf
echo ""

echo "=== 7. CHECKING enterprise-servicenow.tf FOR CORRUPTED DATA ==="
echo "Checking for /.44 pattern (should be empty):"
grep "/.44" enterprise-servicenow.tf
if [ $? -eq 0 ]; then
    echo "❌ FOUND CORRUPTED CIDR! You have the OLD file!"
else
    echo "✅ No corrupted CIDRs found"
fi
echo ""

echo "=== 8. NAVIGATING TO TEST DIRECTORY ==="
cd examples/nsg || cd test || echo "ERROR: Cannot find test directory!"
TEST_DIR=$(pwd)
echo "Test directory: $TEST_DIR"
echo ""

echo "=== 9. CHECKING TEST CONFIGURATION ==="
echo "Module source in test:"
grep "source.*=" main.tf 2>/dev/null | head -1
echo ""
echo "Location in test:"
grep "location.*=" main.tf 2>/dev/null | head -3
echo ""

echo "=== 10. CHECKING FOR CACHED FILES ==="
echo ".terraform directory:"
if [ -d ".terraform" ]; then
    echo "❌ .terraform EXISTS (should be deleted!)"
    ls -la .terraform/
else
    echo "✅ .terraform does NOT exist (good)"
fi
echo ""

echo "=== 11. CLEANING TERRAFORM CACHE ==="
echo "Removing .terraform and state files..."
rm -rf .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup
echo "✅ Cleaned"
echo ""

echo "=== 12. TERRAFORM INIT ==="
terraform init
echo ""

echo "=== 13. RUNNING TERRAFORM PLAN ==="
echo "Running plan and capturing output..."
terraform plan -no-color > /tmp/tf_plan_output.txt 2>&1
PLAN_EXIT=$?
echo "Plan exit code: $PLAN_EXIT"
echo ""

echo "=== 14. ANALYZING PLAN OUTPUT ==="
echo ""
echo "A. Plan summary:"
grep "Plan:" /tmp/tf_plan_output.txt
echo ""

echo "B. First 20 priority assignments in plan:"
grep "priority.*=" /tmp/tf_plan_output.txt | head -20
echo ""

echo "C. Enterprise rules count:"
ENTERPRISE_COUNT=$(grep "enterprise_rules\[" /tmp/tf_plan_output.txt | wc -l)
echo "   $ENTERPRISE_COUNT enterprise rules"
echo ""

echo "D. User rules count:"
USER_COUNT=$(grep '\.rules\[' /tmp/tf_plan_output.txt | grep -v enterprise | wc -l)
echo "   $USER_COUNT user rules"
echo ""

echo "E. Any errors?"
if grep -q "Error:" /tmp/tf_plan_output.txt; then
    echo "   ❌ ERRORS FOUND:"
    grep "Error:" /tmp/tf_plan_output.txt | head -10
else
    echo "   ✅ No errors found"
fi
echo ""

echo "F. Any conflicts?"
if grep -q "SecurityRuleConflict" /tmp/tf_plan_output.txt; then
    echo "   ❌ CONFLICTS FOUND:"
    grep "SecurityRuleConflict" /tmp/tf_plan_output.txt | head -5
else
    echo "   ✅ No conflicts found"
fi
echo ""

echo "=== 15. CHECKING SPECIFIC RULE PRIORITIES ==="
echo "Enterprise rule priorities (should be 100-159):"
grep -A 20 'enterprise_rules\["udp-138' /tmp/tf_plan_output.txt | grep "priority" | head -3
echo ""
echo "User rule priorities (should be 1500+):"
grep -A 20 '\.rules\["443-tcp' /tmp/tf_plan_output.txt | grep "priority" | head -3
echo ""

echo "========================================================================="
echo "DIAGNOSTIC COMPLETE"
echo "========================================================================="
echo ""
echo "Full plan output saved to: /tmp/tf_plan_output.txt"
echo "You can view it with: cat /tmp/tf_plan_output.txt"
echo ""
echo "Return to original directory:"
cd "$ORIGINAL_DIR"
pwd
