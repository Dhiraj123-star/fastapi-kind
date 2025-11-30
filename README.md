
# 🚀 FastAPI + Docker + KIND + Kubernetes (Development Setup)

A lightweight **FastAPI microservice** fully containerized with **Docker** and deployed locally using a **KIND (Kubernetes-in-Docker)** cluster.
This project is built as a simple, clean starter template that can be extended into a production-grade system.

---

## ✅ **Features**

### **1. FastAPI Application**

* Minimal FastAPI app with a single health/test endpoint.
* Ready to expand into modular API architecture.
* Auto-generated Swagger UI (`/docs`).

### **2. Dockerized Application**

* Simple `Dockerfile` for building application image.
* `.dockerignore` added for cleaner builds.
* Supports efficient iterative development.

### **3. KIND Kubernetes Cluster**

* Local Kubernetes cluster created using KIND.
* Custom `kind-cluster.yaml` with port mappings.
* Image loading supported directly from local Docker (no need for Docker Hub).

### **4. Kubernetes Manifests (`k8s/`)**

* `deployment.yaml` with:

  * Pod template for FastAPI container
  * `imagePullPolicy: Never` for local images
  * Configurable replica count
* `service.yaml` exposing the FastAPI app through a NodePort.

---

## 📦 **Project Structure**

```
fastapi-kind/
├── app/
│   └── main.py
├── Dockerfile
├── .dockerignore
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
├── kind-cluster.yaml
└── requirements.txt
```

---

## 🚀 **How to Run**

### **1. Build Docker image**

```bash
docker build -t fastapi-kind:latest .
```

### **2. Create KIND cluster**

```bash
kind create cluster --name fastapi-cluster --config kind-cluster.yaml
```

### **3. Load the image into KIND**

```bash
kind load docker-image fastapi-kind:latest --name fastapi-cluster
```

### **4. Deploy to Kubernetes**

```bash
kubectl apply -f k8s/
```

### **5. Access the API**

If `kind-cluster.yaml` maps host port 8000 → NodePort:

```
http://localhost:8000
```

Swagger UI:

```
http://localhost:8000/docs
```

---

## 🛠 Next Steps (Future Enhancements)

You can extend this project with:

* Liveness & Readiness probes
* Autoscaling (HPA)
* ConfigMaps & Secrets
* Ingress + NGINX + TLS
* Logging & Monitoring
* Helm chart packaging

---
