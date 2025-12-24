# Kubernetes with Minikube

Local Kubernetes development using Minikube.

## Prerequisites

- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Docker](https://www.docker.com/)

## Quick Start

### 1. Start Minikube

```bash
# Start minikube with Docker driver
minikube start --driver=docker

# Enable required addons
minikube addons enable ingress
minikube addons enable metrics-server
```

### 2. Build Docker Image

```bash
# Use minikube's Docker daemon
eval $(minikube docker-env)

# Build the image
docker build -f infra/docker/Dockerfile -t monorepo/web:latest .
```

### 3. Deploy to Minikube

```bash
# Deploy development environment
kubectl apply -k infra/k8s/overlays/development

# Check deployment status
kubectl get pods -n monorepo-dev
kubectl get services -n monorepo-dev
```

### 4. Access the Application

```bash
# Get the service URL
minikube service web-dev-nodeport -n monorepo-dev --url

# Or use port-forward
kubectl port-forward -n monorepo-dev svc/web-dev 3000:80
```

### 5. Access via Ingress

```bash
# Add to /etc/hosts
echo "$(minikube ip) monorepo.local" | sudo tee -a /etc/hosts

# Open in browser
open http://monorepo.local
```

## Environments

| Environment | Namespace        | Replicas | Command                                 |
| ----------- | ---------------- | -------- | --------------------------------------- |
| Development | monorepo-dev     | 1        | `kubectl apply -k overlays/development` |
| Staging     | monorepo-staging | 2        | `kubectl apply -k overlays/staging`     |
| Production  | monorepo-prod    | 3        | `kubectl apply -k overlays/production`  |

## Common Commands

```bash
# View all resources
kubectl get all -n monorepo-dev

# View logs
kubectl logs -n monorepo-dev -l app.kubernetes.io/name=web -f

# Shell into pod
kubectl exec -it -n monorepo-dev deployment/web-dev -- /bin/sh

# Delete deployment
kubectl delete -k infra/k8s/overlays/development

# Restart deployment
kubectl rollout restart -n monorepo-dev deployment/web-dev

# View resource usage
kubectl top pods -n monorepo-dev
```

## Troubleshooting

### Pod not starting

```bash
# Check pod events
kubectl describe pod -n monorepo-dev -l app.kubernetes.io/name=web

# Check logs
kubectl logs -n monorepo-dev -l app.kubernetes.io/name=web --previous
```

### Ingress not working

```bash
# Check ingress status
kubectl get ingress -n monorepo-dev

# Check nginx controller
kubectl logs -n ingress-nginx -l app.kubernetes.io/component=controller
```

### Clean up

```bash
# Stop minikube
minikube stop

# Delete cluster
minikube delete
```

## Directory Structure

```
k8s/
├── base/                   # Base configurations
│   ├── namespace.yaml      # Namespace definition
│   ├── configmap.yaml      # Application config
│   ├── secret.yaml         # Secrets (use external secrets in prod)
│   ├── deployment.yaml     # Deployment spec
│   ├── service.yaml        # Service definitions
│   ├── ingress.yaml        # Ingress rules
│   └── kustomization.yaml  # Kustomize base
└── overlays/               # Environment-specific overlays
    ├── development/
    ├── staging/
    └── production/
```
