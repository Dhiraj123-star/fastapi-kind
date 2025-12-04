
# 🚀 FastAPI + Docker + KIND + Kubernetes (Development Setup)

A lightweight **FastAPI microservice** packaged with **Docker** and deployed locally using a **KIND (Kubernetes-in-Docker)** cluster.
This project provides a modular, extensible foundation that now includes **Ingress routing** and **local TLS/SSL termination** for secure development.

---

## ✅ Features

### **1. FastAPI Application**

* Minimal FastAPI service with a dedicated **`/health`** probe endpoint.
* Clean structure ready for modular API expansion.
* Built-in interactive documentation via Swagger UI.

---

### **2. Dockerized Service**

* Production-oriented Dockerfile.
* `.dockerignore` for optimized build context.
* No external registry required—images load directly into KIND.

---

### **3. KIND Kubernetes Cluster**

* Local cluster managed through KIND.
* Custom cluster config with port mappings.
* Makefile-driven cluster lifecycle automation.

---

### **4. Kubernetes Deployment**

* Deployment manifest includes:

  * `imagePullPolicy: Never` (for local image usage)
  * CPU & memory requests/limits
  * Liveness & readiness probes using `/health`
* Service manifest exposes the application using `NodePort`.

---

### **5. ConfigMap-Driven Environment Management**

* Centralized configuration through Kubernetes **ConfigMap**.
* Environment variables injected into the FastAPI container.
* Clear separation between app logic and environment values.

---

### **6. Ingress + NGINX Routing**

* NGINX Ingress Controller for clean HTTP routing.
* Host-based routing using:
  **`fastapi.local`**
* Eliminates the need for manual port access on NodePort.

---

### **7. TLS/SSL with Self-Signed Certificates**

* Secure HTTPS enabled using a **self-signed TLS certificate**.
* Certificate stored locally and injected via Kubernetes TLS secret.
* Ingress upgraded to terminate TLS using:

  * `secretName: fastapi-tls`
  * Valid for `https://fastapi.local/`
* Allows testing of secure communication locally.

---

### **8. Makefile Automation**

One-command workflows to manage:

* Cluster creation & deletion
* Docker image build & KIND load
* Kubernetes apply/delete
* Ingress & TLS secret deployment

This greatly simplifies the local Kubernetes developer experience.

---

## 📦 Project Structure

```
fastapi-kind/
├── app/
│   └── main.py
├── certs/
│   ├── tls.crt      # self-signed SSL certificate
│   └── tls.key
├── Dockerfile
├── .dockerignore
├── k8s/
│   ├── configmap.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml   # now includes TLS
├── kind-cluster.yaml
├── Makefile
└── requirements.txt
```

---

## 🔮 Intended Evolution

This project is structured to grow into a full production-grade microservice setup.
Potential enhancements:

* cert-manager for automated TLS
* Horizontal Pod Autoscaling (HPA)
* Kubernetes Secrets for secure credentials
* Logging, monitoring, and tracing (Prometheus, Grafana, OpenTelemetry)
* Helm chart packaging
* Multi-environment deployment (dev/stage/prod)

---

