# Infrastructure

Infrastructure configurations for Docker, Kubernetes, and Firebase deployment.

## Quick Start

| Platform       | Command                                                |
| -------------- | ------------------------------------------------------ |
| Docker Compose | `docker-compose -f infra/docker/docker-compose.yml up` |
| Minikube       | `kubectl apply -k infra/k8s/overlays/development`      |
| Firebase       | `cd infra/firebase && firebase deploy`                 |

## Directory Structure

```
infra/
├── docker/                     # Docker configurations
│   ├── Dockerfile              # Production multi-stage build
│   ├── Dockerfile.dev          # Development with hot reload
│   └── docker-compose.yml      # Local development stack
├── k8s/                        # Kubernetes with Kustomize
│   ├── base/                   # Base configurations
│   │   ├── namespace.yaml
│   │   ├── configmap.yaml
│   │   ├── secret.yaml
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   ├── ingress.yaml
│   │   └── kustomization.yaml
│   ├── overlays/               # Environment overlays
│   │   ├── development/
│   │   ├── staging/
│   │   └── production/
│   └── README.md               # Minikube setup guide
└── firebase/                   # Firebase Hosting & Firestore
    ├── firebase.json           # Firebase configuration
    ├── .firebaserc             # Project aliases
    ├── firestore.rules         # Firestore security rules
    ├── firestore.indexes.json  # Firestore indexes
    ├── storage.rules           # Storage security rules
    └── README.md               # Firebase setup guide
```

## Docker

### Development

```bash
# Start development stack (web + redis + postgres)
docker-compose -f infra/docker/docker-compose.yml up

# Access services
# Web: http://localhost:3000
# Redis: localhost:6379
# PostgreSQL: localhost:5432
```

### Production Build

```bash
# Build production image
docker build -f infra/docker/Dockerfile -t monorepo/web:latest .

# Run production container
docker run -p 3000:3000 monorepo/web:latest
```

## Kubernetes (Minikube)

### Setup

```bash
# Start minikube
minikube start --driver=docker
minikube addons enable ingress

# Use minikube's Docker
eval $(minikube docker-env)

# Build image
docker build -f infra/docker/Dockerfile -t monorepo/web:latest .
```

### Deploy

```bash
# Development
kubectl apply -k infra/k8s/overlays/development

# Staging
kubectl apply -k infra/k8s/overlays/staging

# Production
kubectl apply -k infra/k8s/overlays/production
```

### Access

```bash
# NodePort
minikube service web-dev-nodeport -n monorepo-dev --url

# Port forward
kubectl port-forward -n monorepo-dev svc/web-dev 3000:80
```

See [k8s/README.md](k8s/README.md) for detailed Minikube guide.

## Firebase

### Setup

```bash
# Install CLI
npm install -g firebase-tools

# Login
firebase login

# Select project
cd infra/firebase
firebase use default
```

### Local Development

```bash
# Start emulators
firebase emulators:start

# Emulator UI: http://localhost:4000
# Hosting: http://localhost:5000
# Firestore: http://localhost:8080
```

### Deploy

```bash
# Deploy all services
firebase deploy

# Deploy hosting only
firebase deploy --only hosting

# Deploy rules only
firebase deploy --only firestore:rules,storage
```

See [firebase/README.md](firebase/README.md) for detailed Firebase guide.

## Environment Variables

Copy `.env.example` to `.env` and configure:

```bash
cp .env.example .env
```

| Variable            | Description                                  |
| ------------------- | -------------------------------------------- |
| `NODE_ENV`          | Environment (development/staging/production) |
| `DATABASE_URL`      | PostgreSQL connection string                 |
| `REDIS_URL`         | Redis connection string                      |
| `ANTHROPIC_API_KEY` | Claude API key                               |
| `OPENAI_API_KEY`    | OpenAI API key                               |

---

**Developed by [BEMIND TECHNOLOGY CO., LTD.](https://www.bemind.tech/)** | [info@bemind.tech](mailto:info@bemind.tech)
