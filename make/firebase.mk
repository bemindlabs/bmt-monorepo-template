# ==============================================================================
# Firebase
# ==============================================================================

FIREBASE_DIR := infra/firebase

firebase-login: ## Login to Firebase
	cd $(FIREBASE_DIR) && firebase login

firebase-init: ## Initialize Firebase project
	cd $(FIREBASE_DIR) && firebase init

firebase-deploy: ## Deploy to Firebase Hosting
	pnpm --filter @monorepo/web build
	cd $(FIREBASE_DIR) && firebase deploy --only hosting

firebase-deploy-rules: ## Deploy Firestore rules only
	cd $(FIREBASE_DIR) && firebase deploy --only firestore:rules

firebase-deploy-all: ## Deploy all Firebase services
	pnpm --filter @monorepo/web build
	cd $(FIREBASE_DIR) && firebase deploy

firebase-emulators: ## Start Firebase emulators
	cd $(FIREBASE_DIR) && firebase emulators:start

firebase-serve: ## Serve Firebase locally
	cd $(FIREBASE_DIR) && firebase serve
