# GCP DevOps Production Project

## Overview

This project demonstrates the deployment of a production-style three-tier application on Google Cloud Platform using Infrastructure as Code, containerization, Kubernetes, and CI/CD.

## Technologies

- Google Cloud Platform (GCP)
- Terraform
- Docker
- Kubernetes (GKE)
- Jenkins
- Cloud SQL
- Cloud Storage
- Pub/Sub
- Secret Manager
- Cloud Monitoring
- Cloud Logging

## Project Status

- [x] Environment Setup
- [x] Terraform Foundation
- [ ] Networking
- [ ] Storage
- [ ] Database
- [ ] GKE
- [ ] Docker
- [ ] Kubernetes
- [ ] Jenkins CI/CD
- [ ] Monitoring

## Infrastructure
Terraform provisions

✔ VPC
✔ Subnets
✔ Cloud NAT
✔ Cloud Router
✔ Firewall Rules
✔ GKE Cluster
✔ Node Pool
✔ Cloud SQL
✔ Cloud Storage
✔ Artifact Registry
✔ Pub/Sub
✔ Secret Manager

## Kubernetes
Deployments

Backend
Frontend

Services

ClusterIP
LoadBalancer

ConfigMaps

Secrets

Horizontal Pod Autoscaler

Liveness Probe

Readiness Probe

## Monitoring & Alerting

Google Cloud Monitoring is configured using Terraform.

### Features

- Email notification channel
- Alert policy for GKE CPU utilization
- Infrastructure as Code (Terraform)
- Automatic alert generation when the threshold is exceeded

## CI/CD
GitHub

↓

Jenkins

↓

Docker Build

↓

Artifact Registry

↓

Deploy to GKE

↓

Rolling Update


## architecture diagram


                   👩‍💻 Developer
                         │
                         ▼
                  GitHub Repository
                         │
               (Webhook / Poll SCM)
                         │
                         ▼
              Jenkins CI/CD (GCE VM)
                         │
          ┌──────────────┴──────────────┐
          ▼                             ▼
 Docker Build Backend          Docker Build Frontend
          │                             │
          └──────────────┬──────────────┘
                         ▼
                Artifact Registry
                         │
                  kubectl set image
                         │
                         ▼
        ┌─────────────────────────────────┐
        │ Google Kubernetes Engine (GKE)  │
        │                                 │
        │ Frontend LoadBalancer Service   │
        │          │                      │
        │ Frontend Pods                   │
        │          │                      │
        │ Backend ClusterIP Service       │
        │          │                      │
        │ Backend Pods                    │
        │   │    │    │                   │
        │   │    │    └── Cloud Storage   │
        │   │    └────── Pub/Sub          │
        │   └────────── Cloud SQL         │
        │                                │
        │ ConfigMap + Secret             │
        │ HPA                            │
        │ Health Checks                  │
        └─────────────────────────────────┘
                         │
                         ▼
          Cloud Monitoring & Alerting