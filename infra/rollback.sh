#!/bin/bash

# 롤백 스크립트
set -e

SERVICE=$1

if [ -z "$SERVICE" ]; then
    echo "Usage: ./rollback.sh [ml-backend|backend|all]"
    exit 1
fi

echo "🔄 Starting rollback process..."

case $SERVICE in
    ml-backend)
        echo "Rolling back ML-Backend..."
        kubectl rollout undo deployment/ml-backend -n ml-backend
        kubectl rollout status deployment/ml-backend -n ml-backend
        ;;
    backend)
        echo "Rolling back Backend..."
        kubectl rollout undo deployment/backend -n backend
        kubectl rollout status deployment/backend -n backend
        ;;
    all)
        echo "Rolling back all services..."
        kubectl rollout undo deployment/ml-backend -n ml-backend
        kubectl rollout undo deployment/backend -n backend
        kubectl rollout status deployment/ml-backend -n ml-backend
        kubectl rollout status deployment/backend -n backend
        ;;
    *)
        echo "Unknown service: $SERVICE"
        exit 1
        ;;
esac

echo "✅ Rollback completed!"

# 현재 상태 확인
echo ""
echo "Current deployment status:"
echo "ML-Backend:"
kubectl get deployment -n ml-backend
echo ""
echo "Backend:"
kubectl get deployment -n backend