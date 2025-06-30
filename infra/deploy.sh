#!/bin/bash

# 배포 스크립트 - 분리된 네임스페이스 버전
set -e

echo "🚀 Starting deployment process..."

# 1. 네임스페이스 생성
echo "📂 Creating namespaces..."
kubectl apply -f k8s/common/namespace.yaml

# 2. Secrets 생성 (이미 존재하면 스킵)
echo "🔐 Creating secrets..."
# ML-Backend Secret
kubectl get secret ml-backend-secret -n ml-backend &>/dev/null || \
kubectl create secret generic ml-backend-secret \
  --from-literal=db-username=admin \
  --from-literal=db-password=changeme \
  -n ml-backend

# Backend Secret
kubectl get secret backend-secret -n backend &>/dev/null || \
kubectl create secret generic backend-secret \
  --from-literal=db-username=admin \
  --from-literal=db-password=changeme \
  -n backend

# 3. ML-Backend 배포
echo "🤖 Deploying ML-Backend..."
kubectl apply -f k8s/ml-backend/configmap.yaml
kubectl apply -f k8s/ml-backend/service.yaml
kubectl apply -f k8s/ml-backend/deployment.yaml

# 4. Backend 배포
echo "🌐 Deploying Backend..."
kubectl apply -f k8s/backend/configmap.yaml
kubectl apply -f k8s/backend/service.yaml
kubectl apply -f k8s/backend/deployment.yaml

# 5. Ingress 배포
echo "🔗 Deploying Ingress..."
kubectl apply -f k8s/backend/ingress.yaml

# 6. 네임스페이스 간 통신 설정
echo "🔄 Setting up cross-namespace communication..."
kubectl apply -f k8s/common/cross-namespace-services.yaml

# 7. 배포 상태 확인
echo "✅ Checking deployment status..."
echo "Waiting for ML-Backend..."
kubectl rollout status deployment/ml-backend -n ml-backend --timeout=300s

echo "Waiting for Backend..."
kubectl rollout status deployment/backend -n backend --timeout=300s

echo "🎉 Deployment completed successfully!"

# 8. 상태 출력
echo ""
echo "📊 ML-Backend Status:"
kubectl get all -n ml-backend
echo ""
echo "📊 Backend Status:"
kubectl get all -n backend
echo ""
echo "📊 Ingress Status:"
kubectl get ingress -n backend

# 9. 유용한 정보 출력
echo ""
echo "🔍 Useful commands:"
echo "  - ML-Backend logs: kubectl logs -f deployment/ml-backend -n ml-backend"
echo "  - Backend logs: kubectl logs -f deployment/backend -n backend"
echo "  - Port forward ML-Backend: kubectl port-forward -n ml-backend svc/ml-backend 8000:80"
echo "  - Port forward Backend: kubectl port-forward -n backend svc/backend 8080:80"