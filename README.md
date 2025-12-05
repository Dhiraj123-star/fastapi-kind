
# 🚀 FastAPI + Docker + KIND + Kubernetes + Helm (Development Setup)

A lightweight, modular **FastAPI microservice** packaged with **Docker**, deployed on a local **KIND (Kubernetes-in-Docker)** cluster, and now fully managed using a **Helm chart**.
This project also includes **Ingress routing**, **TLS/SSL termination**, and **ConfigMap-driven environment configuration**.

---

## ✅ Features

### **1. FastAPI Application**

* Minimal FastAPI service with:

  * `/health` endpoint for probes
  * `/info` endpoint reading values from ConfigMap
* Modular and production-friendly project layout
* Built-in interactive Swagger documentation (`/docs`)

---

### **2. Dockerized Service**

* Production-ready Dockerfile
* `.dockerignore` to reduce build context
* No external registry required—images loaded directly into KIND via:

  ```bash
  kind load docker-image fastapi-kind:latest --name fastapi-cluster
  ```

---

### **3. KIND Kubernetes Cluster**

* Custom `kind-cluster.yaml` for local environment
* Ingress support enabled at the node level
* Makefile automates:

  * Cluster creation/deletion
  * Deployment
  * Loading Docker images

---

### **4. Kubernetes Deployment (via Helm)**

Deployment is fully controlled through the **Helm chart**:

* `imagePullPolicy: Never` — ensures KIND uses locally loaded images
* Liveness & Readiness probes using `/health`
* Configurable replica count
* Environment variables injected via ConfigMap
* Complete override via `values.yaml`

---

### **5. ConfigMap Environment Management**

FastAPI environment variables (`APP_ENV`, `APP_NAME`, `APP_VERSION`) now work end-to-end thanks to:

* `configmap.yaml` defining all environment keys
* `deployment.yaml` injecting ConfigMap into the pod via:

  ```yaml
  envFrom:
    - configMapRef:
        name: fastapi-config
  ```
* `/info` endpoint now returns real values from the cluster

---

### **6. Ingress + NGINX Routing**

* NGINX Ingress Controller manages internal routing
* Host-based routing:

  ```
  https://fastapi.local/
  ```
* Fully integrated through Helm’s `ingress.yaml`

---

### **7. TLS/SSL for Local HTTPS**

* Local self-signed certificate stored in:

  ```
  certs/tls.crt
  certs/tls.key
  ```
* Kubernetes TLS secret created via:

  ```bash
  kubectl create secret tls fastapi-tls \
    --key certs/tls.key \
    --cert certs/tls.crt
  ```
* Ingress terminates SSL using:

  ```yaml
  tls:
    - hosts:
        - fastapi.local
      secretName: fastapi-tls
  ```

---

### **8. Helm Chart Support**

The project now includes a full Helm chart:

```
fastapi-chart/
├── Chart.yaml
├── values.yaml
└── templates/
    ├── configmap.yaml
    ├── deployment.yaml
    ├── ingress.yaml
    ├── service.yaml
```

Install or upgrade using:

```bash
helm upgrade --install fastapi fastapi-chart/
```

---

### **9. Makefile Automation**

Simplifies workflows:

```bash
make cluster     # Create KIND cluster
make build       # Build Docker image
make load        # Load image into KIND
make deploy      # Install Helm chart
make delete      # Delete cluster
```

---

## 📦 Project Structure

```
fastapi-kind/
├── app/
│   └── main.py
├── certs/
│   ├── tls.crt
│   └── tls.key
├── Dockerfile
├── .dockerignore
├── fastapi-chart/            # NEW — Helm chart
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
│       ├── configmap.yaml
│       ├── deployment.yaml
│       ├── ingress.yaml
│       ├── service.yaml
├── kind-cluster.yaml
├── Makefile
└── requirements.txt
```

---

## 🔮 Intended Evolution

Future enhancements may include:

* cert-manager for automated TLS
* Horizontal Pod Autoscaling (HPA)
* Secrets for sensitive env variables
* Advanced observability (Grafana, Prometheus, Loki, OpenTelemetry)
* GitHub Actions CI/CD
* Staging & production environments
* Multi-service architecture with Helm umbrella charts

---