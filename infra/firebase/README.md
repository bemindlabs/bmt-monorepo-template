# Firebase Configuration

Firebase Hosting and Firestore configuration for the monorepo.

## Prerequisites

- [Firebase CLI](https://firebase.google.com/docs/cli)
- Firebase project created

## Setup

### 1. Install Firebase CLI

```bash
npm install -g firebase-tools
```

### 2. Login to Firebase

```bash
firebase login
```

### 3. Initialize Project

Update `.firebaserc` with your project IDs:

```json
{
  "projects": {
    "default": "your-project-id",
    "development": "your-project-id-dev",
    "production": "your-project-id-prod"
  }
}
```

### 4. Select Project

```bash
# Use default project
firebase use default

# Or switch to specific environment
firebase use development
firebase use production
```

## Local Development

### Start Emulators

```bash
cd infra/firebase
firebase emulators:start
```

Emulator URLs:

- Hosting: http://localhost:5000
- Firestore: http://localhost:8080
- Storage: http://localhost:9199
- Emulator UI: http://localhost:4000

### Build and Preview

```bash
# Build the web app
pnpm build --filter=@monorepo/web

# Preview with hosting emulator
cd infra/firebase
firebase hosting:channel:deploy preview --expires 7d
```

## Deployment

### Deploy Everything

```bash
cd infra/firebase
firebase deploy
```

### Deploy Specific Services

```bash
# Hosting only
firebase deploy --only hosting

# Firestore rules only
firebase deploy --only firestore:rules

# Firestore indexes only
firebase deploy --only firestore:indexes

# Storage rules only
firebase deploy --only storage
```

### Deploy to Different Environments

```bash
# Deploy to development
firebase use development
firebase deploy

# Deploy to production
firebase use production
firebase deploy
```

## Configuration Files

| File                     | Description                  |
| ------------------------ | ---------------------------- |
| `firebase.json`          | Main Firebase configuration  |
| `.firebaserc`            | Project aliases and targets  |
| `firestore.rules`        | Firestore security rules     |
| `firestore.indexes.json` | Firestore composite indexes  |
| `storage.rules`          | Cloud Storage security rules |

## Security Rules

### Firestore Rules

- Default deny all access
- Users can read/update their own profile
- Public collection readable by all
- Admin-only write access to public content

### Storage Rules

- Default deny all access
- Public assets readable by all
- Users can upload images (max 10MB) to their own folder
- Admin-only write to public folder

## Best Practices

1. **Never expose API keys in client code** - Use Firebase config from environment
2. **Test rules locally** - Use emulators before deploying
3. **Use environment-specific projects** - Separate dev/staging/prod
4. **Monitor usage** - Set up budget alerts in Firebase console
5. **Review security rules** - Audit rules regularly

## Troubleshooting

### Emulator Issues

```bash
# Kill processes on emulator ports
lsof -ti:5000,8080,9199,4000 | xargs kill -9

# Clear emulator data
rm -rf ~/.firebase/emulator-data
```

### Deployment Issues

```bash
# Check current project
firebase projects:list

# Verify configuration
firebase apps:list

# Debug deploy
firebase deploy --debug
```

## Directory Structure

```
firebase/
├── firebase.json           # Firebase configuration
├── .firebaserc             # Project aliases
├── firestore.rules         # Firestore security rules
├── firestore.indexes.json  # Firestore indexes
├── storage.rules           # Storage security rules
└── README.md               # This file
```
