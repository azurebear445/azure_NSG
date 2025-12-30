# CRITICAL DIAGNOSTIC - Run This Exact Script

## 🔍 **Run these commands and share ALL output:**

```bash
cd terraform-azurerm-network_security_group

echo "=== 1. CHECK MODULE FILES ==="
echo ""
echo "A. locals.tf priorities:"
grep -n "priority.*=" locals.tf | grep -E "(1500|2000|2500)"
echo ""

echo "B. enterprise-servicenow.tf exists and size:"
ls -lh enterprise-servicenow.tf
echo ""

echo "C. main.tf has both resources:"
grep 'resource "azurerm_network_security_rule"' main.tf
echo ""

echo "=== 2. CHECK LOCALS.TF CONTENT ==="
echo ""
echo "Lines 1-20 (should have enterprise merge):"
head -20 locals.tf
echo ""

echo "Lines 136-180 (should have user rule priorities):"
sed -n '136,180p' locals.tf
echo ""

echo "=== 3. CHECK EXAMPLE CONFIGURATION ==="
cd examples/nsg
echo ""

echo "A. Module source:"
grep "source.*=" main.tf
echo ""

echo "B. Location being used:"
grep 'location.*=' main.tf | head -3
echo ""

echo "=== 4. TERRAFORM STATE ==="
echo ""
echo "Check if .terraform exists (should NOT after rm -rf):"
ls -la .terraform/ 2>&1
echo ""

echo "=== 5. RUN TERRAFORM CONSOLE TEST ==="
echo ""
echo "Testing priority calculation..."
terraform console << 'TFEOF'
# This will fail if module not initialized, that's OK
TFEOF
echo ""

echo "=== 6. CHECK IF YOU'RE IN RIGHT DIRECTORY ==="
pwd
ls -la ../../ | grep -E "(main.tf|locals.tf|enterprise)"
```

---

## 📋 **After Running Above, Also Run This:**

```bash
cd terraform-azurerm-network_security_group/examples/nsg

# Initialize fresh
terraform init

# Get plan output to file
terraform plan -no-color > /tmp/plan_output.txt 2>&1

# Check priorities in plan
echo "=== PRIORITIES IN PLAN ==="
grep "priority.*=" /tmp/plan_output.txt | head -30

# Count enterprise vs user rules
echo ""
echo "=== RULE COUNTS ==="
echo "Enterprise rules:"
grep "enterprise_rules\[" /tmp/plan_output.txt | wc -l

echo "User rules:"
grep '\.rules\[' /tmp/plan_output.txt | wc -l
```

---

## 🎯 **Share All This Output!**

This will show us EXACTLY what's wrong!
