# Architecture Decisions

## AD-001: Custom VPC Instead of Default VPC

**Decision**
Use a custom VPC instead of the default VPC.

**Reason**
- Full control over networking.
- Production best practice.
- Allows custom IP ranges, firewall rules and subnet design.
- Avoids unnecessary default firewall rules.

---

## AD-002: Separate Public and Private Subnets

**Decision**
Create separate public and private subnets.

**Reason**
- Public subnet is reserved for internet-facing resources.
- Private subnet hosts backend infrastructure such as GKE nodes and Cloud SQL.
- Reduces attack surface.
- Follows the principle of network segmentation.

---

## AD-003: Enable Private Google Access

**Decision**
Enable Private Google Access on the private subnet.

**Reason**
Resources without public IP addresses can securely access Google services such as:
- Artifact Registry
- Cloud Storage
- Secret Manager

without exposing themselves to the public Internet.

---

## AD-004: Use Cloud Router and Cloud NAT

**Decision**
Use Cloud Router and Cloud NAT for private workloads.

**Reason**
Private GKE nodes should not have public IP addresses.

Cloud NAT provides outbound Internet access for:
- Pulling Docker images
- Installing packages
- Accessing external services

without allowing inbound Internet access.

---

## AD-005: Store Docker Images in Artifact Registry

**Decision**
Use Artifact Registry instead of Docker Hub.

**Reason**
- Native GCP integration.
- IAM-based access control.
- Better security.
- Regional repository for lower latency.
- Recommended replacement for Container Registry.

---

## AD-006: Store Documents in Cloud Storage

**Decision**
Employee documents will be stored in Cloud Storage instead of Cloud SQL.

**Reason**
Cloud Storage is designed for unstructured files such as PDFs and images.

Cloud SQL stores only metadata and file paths.

---

## AD-007: Backend Owns Data Access

**Decision**
Frontend never communicates directly with Cloud SQL or Cloud Storage.

**Reason**
Application flow:

Frontend
→ Backend API
→ Cloud SQL / Cloud Storage

This protects credentials, centralizes business logic and improves security.

## Decision 08

Cloud SQL uses a Private IP.

Reason:
- Prevent direct internet access.
- Only backend services inside the VPC can connect.
- Reduces attack surface.


## AD-008: Cloud SQL Uses Private Service Access

**Decision**

Cloud SQL is deployed with a Private IP using Private Service Access.

**Reason**

Cloud SQL is a Google-managed service and does not reside directly inside our VPC subnets.

Private Service Access creates a private connection between our VPC and Google's managed network, allowing backend workloads to securely access the database without exposing it to the public Internet.

There are actually two VPCs:
Your VPC
Google's managed VPC
So Google internally uses VPC Network Peering between them.
This special form of peering is called Private Service Access (PSA).

Cloud SQL is not your VM.
Google owns it.
You don't get SSH access.
You don't manage the operating system.
You don't even know which VM it's running on.
Therefore you cannot just place it inside your subnet.
Google exposes it through a private endpoint, and the connectivity is provided via Private Service Access.