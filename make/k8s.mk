# ==============================================================================
# Kubernetes (Minikube)
# ==============================================================================

k8s-start: ## Start Minikube cluster
	minikube start --driver=docker

k8s-stop: ## Stop Minikube cluster
	minikube stop

k8s-delete: ## Delete Minikube cluster
	minikube delete

k8s-dashboard: ## Open Kubernetes dashboard
	minikube dashboard

k8s-deploy-dev: ## Deploy to development environment
	kubectl apply -k infra/k8s/overlays/development

k8s-deploy-staging: ## Deploy to staging environment
	kubectl apply -k infra/k8s/overlays/staging

k8s-deploy-prod: ## Deploy to production environment
	kubectl apply -k infra/k8s/overlays/production

k8s-status: ## Show Kubernetes resources status
	kubectl get all -n monorepo

k8s-logs: ## View Kubernetes pod logs
	kubectl logs -f -l app=web -n monorepo

k8s-port-forward: ## Port forward web service to localhost:3000
	kubectl port-forward svc/web 3000:80 -n monorepo

k8s-destroy: ## Delete all Kubernetes resources
	kubectl delete -k infra/k8s/base
