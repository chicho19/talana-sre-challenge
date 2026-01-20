# Talana SRE Challenge – GKE Deployment

## 📌 Overview

This project demonstrates the creation of a complete cloud infrastructure and application deployment using **Terraform**, **Google Kubernetes Engine (GKE)**, and **Kubernetes** best practices.

The solution provisions a custom VPC, a GKE cluster, deploys an NGINX-based application, and exposes it publicly via a Kubernetes `LoadBalancer` Service.

---

## 🏗️ Architecture

* **Cloud Provider:** Google Cloud Platform (GCP)
* **Infrastructure as Code:** Terraform
* **Container Orchestration:** Google Kubernetes Engine (GKE)
* **Networking:**

  * Custom VPC
  * Subnet in `us-central1`
  * Public LoadBalancer
* **Application:** NGINX (demo web application)

```
Internet
   |
[GCP LoadBalancer]
   |
[Kubernetes Service - LoadBalancer]
   |
[NGINX Pods]
   |
[GKE Node Pool]
```

---

## 📂 Project Structure

```
.
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── vpc.tf
│   ├── terraform.tfvars
│   └── .terraform.lock.hcl
├── k8s/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   └── service.yaml
└── README.md
```

---

## ⚙️ Prerequisites

* Google Cloud account
* GCP project with billing enabled
* Installed tools:

  * Terraform >= 1.x
  * Google Cloud SDK (`gcloud`)
  * kubectl
* GCP APIs enabled:

  * Compute Engine
  * Kubernetes Engine

---

## 🚀 Infrastructure Deployment (Terraform)

```bash
cd terraform
terraform init
terraform validate
terraform plan
terraform apply
```

This will provision:

* VPC and Subnet
* GKE Cluster
* Node Pool

---

## ☸️ Kubernetes Configuration

### 1. Get cluster credentials

```bash
gcloud auth login
gcloud config set project <PROJECT_ID>

gcloud container clusters get-credentials talana-gke \
  --region us-central1
```

### 2. Deploy Kubernetes resources

```bash
cd k8s
kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

---

## 🌍 Accessing the Application

Get the external IP:

```bash
kubectl get svc -n talana
```

Example:

```text
EXTERNAL-IP: 34.121.102.22
```

Open in browser or test with:

```bash
curl http://<EXTERNAL-IP>
```

You should see the **Welcome to nginx!** page.

---

## 🔍 Validation Commands

```bash
kubectl get nodes
kubectl get pods -n talana
kubectl get svc -n talana
kubectl get endpoints -n talana
```

---

## 🧹 Cleanup

To avoid unnecessary costs:

```bash
cd terraform
terraform destroy
```

---

## 🧠 Design Decisions

* **Terraform** ensures reproducible infrastructure.
* **Separate node pool** allows future scaling and isolation.
* **LoadBalancer Service** chosen for simplicity and direct public exposure.
* **NGINX** used as a lightweight, reliable test application.
* Regional GKE cluster improves availability.

---

## ✅ Result

✔ Fully automated infrastructure
✔ Publicly accessible application
✔ Clean, modular, and production-aligned setup

---

## 👤 Author

**Gilberto Castro**
SRE / DevOps Challenge Submission
