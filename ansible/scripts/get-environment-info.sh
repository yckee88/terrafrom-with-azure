#!/bin/bash
# Get environment access information

ENVIRONMENT=${1:-develop}

echo "🔍 Environment: $ENVIRONMENT"
echo "📊 Monitoring Dashboard Access:"
echo ""

# Get ingress information
kubectl get ingress -n monitoring -o custom-columns=NAME:.metadata.name,HOSTS:.spec.rules[0].host,ADDRESS:.status.loadBalancer.ingress[0].ip

echo ""
echo "🔑 Login Credentials:"
echo "Username: admin"
echo "Password: $(kubectl get secret -n monitoring prometheus-stack-grafana -o jsonpath="{.data.admin-password}" | base64 -d)"

echo ""
echo "🌐 Quick Access URLs:"
GRAFANA_IP=$(kubectl get ingress -n monitoring prometheus-stack-grafana -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
PROMETHEUS_IP=$(kubectl get ingress -n monitoring prometheus-stack-kube-prom-prometheus -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo "Grafana:    http://grafana.${GRAFANA_IP}.nip.io"
echo "Prometheus: http://prometheus.${PROMETHEUS_IP}.nip.io"
