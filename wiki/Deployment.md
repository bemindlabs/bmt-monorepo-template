# Deployment

Deployment guides for various platforms.

## Deployment Options

| Platform        | Use Case           | Complexity |
| --------------- | ------------------ | ---------- |
| Docker Compose  | Local/Development  | Low        |
| Kubernetes      | Staging/Production | Medium     |
| Firebase        | Static Hosting     | Low        |
| Cloud Providers | Production         | High       |

## Docker Compose

### Development Deployment

```bash
# Start all services
cd infra/docker
docker compose up -d

# View logs
docker compose logs -f

# Stop services
docker compose down
```

### Production Deployment

```bash
# Build production image
docker compose -f docker-compose.yml -f docker-compose.prod.yml build

# Start production
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

### Docker Commands

| Command                  | Description      |
| ------------------------ | ---------------- |
| `docker compose up -d`   | Start containers |
| `docker compose down`    | Stop containers  |
| `docker compose logs -f` | View logs        |
| `docker compose ps`      | List containers  |
| `docker compose build`   | Rebuild images   |

## Kubernetes (Minikube)

### Prerequisites

```bash
# Start Minikube
minikube start

# Enable ingress
minikube addons enable ingress
```

### Deploy to Development

```bash
# Apply development overlay
kubectl apply -k infra/k8s/overlays/development

# Check deployment
kubectl get pods -n monorepo

# Get service URL
minikube service web -n monorepo --url
```

### Deploy to Staging

```bash
kubectl apply -k infra/k8s/overlays/staging
```

### Deploy to Production

```bash
kubectl apply -k infra/k8s/overlays/production
```

### Kubernetes Commands

| Command                            | Description       |
| ---------------------------------- | ----------------- |
| `kubectl get pods -n monorepo`     | List pods         |
| `kubectl logs <pod> -n monorepo`   | View logs         |
| `kubectl describe pod <pod>`       | Pod details       |
| `kubectl delete -k infra/k8s/base` | Delete deployment |

### Scaling

```bash
# Scale deployment
kubectl scale deployment web --replicas=3 -n monorepo

# Autoscaling
kubectl autoscale deployment web --min=1 --max=5 --cpu-percent=80 -n monorepo
```

## Firebase Hosting

### Prerequisites

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login
```

### Deploy

```bash
# Build application
pnpm build

# Deploy to Firebase
cd infra/firebase
firebase deploy --only hosting
```

### Deploy Firestore Rules

```bash
firebase deploy --only firestore:rules
```

### Deploy Everything

```bash
firebase deploy
```

### Firebase Commands

| Command                            | Description      |
| ---------------------------------- | ---------------- |
| `firebase deploy`                  | Deploy all       |
| `firebase deploy --only hosting`   | Deploy hosting   |
| `firebase deploy --only firestore` | Deploy Firestore |
| `firebase serve`                   | Local testing    |

## CI/CD with GitHub Actions

### Automatic Deployments

Deployments are automated via GitHub Actions:

| Branch      | Environment | Trigger |
| ----------- | ----------- | ------- |
| `main`      | Production  | Push    |
| `develop`   | Staging     | Push    |
| `feature/*` | Preview     | PR      |

### Manual Deployment

```bash
# Create release tag
git tag v1.0.0
git push origin v1.0.0
```

This triggers the release workflow which:

1. Runs tests
2. Builds packages
3. Creates GitHub Release
4. Deploys to production

## Cloud Provider Deployment

### AWS (ECS/EKS)

```bash
# Build and push to ECR
aws ecr get-login-password | docker login --username AWS --password-stdin <account>.dkr.ecr.<region>.amazonaws.com

docker build -t monorepo-web .
docker tag monorepo-web:latest <account>.dkr.ecr.<region>.amazonaws.com/monorepo-web:latest
docker push <account>.dkr.ecr.<region>.amazonaws.com/monorepo-web:latest
```

### Google Cloud (Cloud Run)

```bash
# Build and deploy
gcloud builds submit --tag gcr.io/<project>/monorepo-web
gcloud run deploy monorepo-web --image gcr.io/<project>/monorepo-web --platform managed
```

### Azure (Container Apps)

```bash
# Build and push to ACR
az acr build --registry <registry> --image monorepo-web .

# Deploy to Container Apps
az containerapp create --name monorepo-web --resource-group <rg> --image <registry>.azurecr.io/monorepo-web
```

## Environment Configuration

### Production Environment Variables

```env
NODE_ENV=production
PORT=3000
LOG_LEVEL=info

# Database
DATABASE_URL=postgresql://user:pass@host:5432/db

# AI Providers
ANTHROPIC_API_KEY=sk-ant-...

# Firebase
FIREBASE_PROJECT_ID=your-project
```

### Secrets Management

| Platform   | Solution                 |
| ---------- | ------------------------ |
| Kubernetes | Secrets + Sealed Secrets |
| Docker     | Docker Secrets           |
| Firebase   | Environment Config       |
| AWS        | Secrets Manager          |
| GCP        | Secret Manager           |

## Rollback Procedures

### Kubernetes

```bash
# View history
kubectl rollout history deployment/web -n monorepo

# Rollback to previous
kubectl rollout undo deployment/web -n monorepo

# Rollback to specific revision
kubectl rollout undo deployment/web --to-revision=2 -n monorepo
```

### Docker

```bash
# Use previous image tag
docker compose up -d --no-deps web:previous-tag
```

### Firebase

```bash
# List releases
firebase hosting:channel:list

# Rollback (redeploy previous version)
firebase hosting:clone <site>:<channel> <site>:live
```

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)**
