#!/bin/bash
# Deploy monitoring - minimal version

ENVIRONMENT=${1:-develop}
ENV_FILE="environments/${ENVIRONMENT}.yml"

if [[ ! -f "$ENV_FILE" ]]; then
    echo "❌ Environment file $ENV_FILE not found!"
    echo "Available environments: develop, staging, production"
    exit 1
fi

echo "🚀 Deploying monitoring to $ENVIRONMENT environment..."

# Use the exact working command format
ansible-playbook -i inventory/terraform_inventory.py \
  playbooks/deploy-monitoring.yml \
  -e "@$ENV_FILE" \
  -v

if [[ $? -eq 0 ]]; then
    echo "✅ Monitoring deployed successfully!"
else
    echo "❌ Deployment failed!"
    exit 1
fi
