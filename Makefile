# -----------------------------------------
# FastAPI + KIND + Kubernetes Makefile
# -----------------------------------------

CLUSTER_NAME=fastapi-cluster
IMAGE_NAME=fastapi-kind:latest

# -------- Docker Commands --------

build:
	docker build -t $(IMAGE_NAME) .

# -------- KIND Cluster Commands --------

cluster-create:
	kind create cluster --name $(CLUSTER_NAME) --config kind-cluster.yaml

cluster-delete:
	kind delete cluster --name $(CLUSTER_NAME)

cluster-start:
	docker start $(CLUSTER_NAME)-control-plane

cluster-stop:
	docker stop $(CLUSTER_NAME)-control-plane

# Load local Docker image into KIND nodes
load-image:
	kind load docker-image $(IMAGE_NAME) --name $(CLUSTER_NAME)

# -------- Kubernetes Commands --------

deploy:
	kubectl apply -f k8s/

delete:
	kubectl delete -f k8s/ || true

restart:
	kubectl rollout restart deployment fastapi-app

pods:
	kubectl get pods

services:
	kubectl get svc

logs:
	kubectl logs -l app=fastapi

# Forward FastAPI to localhost:8000
port-forward:
	kubectl port-forward svc/fastapi-service 8000:8000
