
# 🚀 FastAPI + Docker + KIND + Kubernetes (Development Setup)

A lightweight **FastAPI microservice** packaged with **Docker** and deployed locally using a **KIND (Kubernetes-in-Docker)** cluster.
This project provides a clean, modular foundation to gradually evolve into a production-grade microservice architecture.

---

## ✅ Features

### **1. FastAPI Application**

* Minimal FastAPI service with a dedicated **`/health`** endpoint.
* Clean structure ready for modular API expansion.
* Interactive API documentation available via Swagger UI.

### **2. Dockerized Service**

* Production-ready Docker image structure.
* Build-optimized configuration using `.dockerignore`.
* Fully local workflow with no external image registry required.

### **3. KIND Kubernetes Cluster**

* Local Kubernetes cluster created and managed through KIND.
* Custom cluster configuration with port mappings for seamless local development.
* Local Docker images automatically loaded into the cluster.

### **4. Kubernetes Deployment**

* Deployment manifest featuring:

  * `imagePullPolicy: Never` for local image usage
  * CPU & memory resource requests/limits
  * Liveness and readiness probes using the `/health` endpoint
* Service manifest exposing the FastAPI pod internally and externally.

### **5. ConfigMap-Driven Environment Management**

* Centralized configuration using Kubernetes **ConfigMap**.
* Environment variables injected directly into the FastAPI container.
* Clean separation between application code and environment-specific values.

### **6. Makefile Automation**

* Makefile included for:

  * Cluster creation & deletion
  * Image building & loading
  * Kubernetes deployment & cleanup
* Enables a one-command workflow for all local K8s operations.

---

## 📦 Project Structure

```
fastapi-kind/
├── app/
│   └── main.py
├── Dockerfile
├── .dockerignore
├── k8s/
│   ├── configmap.yaml
│   ├── deployment.yaml
│   └── service.yaml
├── kind-cluster.yaml
├── Makefile
└── requirements.txt
```

---

## 🚀 Intended Evolution

This repository is designed to grow gradually into a full microservice setup with enhancements like:

* Ingress + NGINX + TLS termination
* Horizontal Pod Autoscaling (HPA)
* Kubernetes Secrets for secure configuration
* Logging & metrics (Prometheus, Grafana)
* Helm chart packaging
* Multi-environment deployment structure

