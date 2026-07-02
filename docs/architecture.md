# GCP DevOps Project Architecture

## Region
asia-south1

## Zone
asia-south1-a

Phase 1  → Networking
Phase 2  → Storage + Database + Managed Services
Phase 3  → Compute Engine VM (Jenkins)
Phase 4  → GKE
Phase 5  → Application
Phase 6  → Docker
Phase 7  → Deploy to GKE
Phase 8  → Jenkins CI/CD
Phase 9  → Monitoring & Alerting

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