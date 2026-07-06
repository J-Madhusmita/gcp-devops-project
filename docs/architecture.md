# GCP DevOps Project Architecture

# Project Progress

## Phase 1 - Environment
- [x] Git
- [x] Docker
- [x] Terraform
- [x] Google Cloud SDK

## Phase 2 - Networking
- [x] Custom VPC
- [x] Public Subnet
- [x] Private Subnet
- [x] Firewall Rules
- [x] Cloud Router
- [x] Cloud NAT

## Phase 3 - Platform
- [x] Artifact Registry
- [x] Cloud Storage
- [ ] Secret Manager
- [ ] Pub/Sub
- [ ] Cloud SQL

## Phase 4 - Compute
- [ ] GKE
- [ ] Jenkins VM

## Phase 5 - Application
- [ ] React Frontend
- [ ] Node Backend
- [ ] Docker
- [ ] Kubernetes

## Phase 6 - CI/CD
- [ ] Jenkins Pipeline

## Phase 7 - Monitoring
- [ ] Cloud Monitoring
- [ ] Alert Policies


Phase 1  → Networking
Phase 2  → Storage + Database + Managed Services
Phase 3  → Compute Engine VM (Jenkins)
Phase 4  → GKE
Phase 5  → Application
Phase 6  → Docker
Phase 7  → Deploy to GKE
Phase 8  → Jenkins CI/CD
Phase 9  → Monitoring & Alerting

## Region
asia-south1

## Zone
asia-south1-a

## Network

### VPC
- gcp-devops-vpc
- CIDR: 10.0.0.0/16

### Public Subnet
- public-subnet
- 10.0.1.0/24

### Private Subnet
- private-subnet
- 10.0.2.0/24
- Private Google Access Enabled

Phase 1 - Networking
✔ Custom VPC
✔ Public Subnet
✔ Private Subnet
✔ Firewall Rules
✔ Cloud Router
✔ Cloud NAT

## Platform

phase 2 -  Platform
✔ Artifact Registry

                        Internet
                             │
                    HTTPS Load Balancer
                             │
                        GKE Ingress
                             │
              ┌──────────────┴──────────────┐
              │                             │
         React Frontend               Node Backend
                                            │
                    ┌───────────────┬───────────────┬──────────────┐
                    │               │               │
                    ▼               ▼               ▼
             Cloud Storage      Cloud SQL       Pub/Sub
                    │               ▲
                    │               │
             Signed URLs      Private Service Access
                    │               │
              IAM Policies   Google Producer VPC

Jenkins VM
     │
     ▼
Artifact Registry
     │
     ▼
GKE Cluster

## Backend 

server.js → Starts the application.
app.js → Configures Express and middleware.
routes/ → Defines API endpoints.
controllers/ → Handles HTTP requests and responses.
services/ → Contains business logic and interactions with GCP services.
models/ → Represents database entities.

## Express
What?
A web framework for Node.js.
Why?
Node.js only provides HTTP modules.
Express makes routing, middleware and APIs easier.
Where used?
Backend REST APIs.
Node.js already has an HTTP module.
Example
const http = require("http");
We could build APIs using only Node.js. 
But look how much code it needs.
Express makes all of that simple.