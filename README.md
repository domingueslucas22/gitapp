# DevOps CI/CD Pipeline – AWS ECS Deployment

This project demonstrates a complete DevOps pipeline deploying a containerized Node.js application to AWS ECS using Infrastructure as Code.

The infrastructure is provisioned using Terraform, the application is containerized with Docker, and deployments are automated through GitHub Actions.

---

# Architecture

The application is deployed inside AWS using a scalable container architecture.

Flow:

Developer → GitHub → GitHub Actions → DockerHub → AWS ECS → Application Load Balancer → Container

Components:

- AWS VPC
- Public Subnets
- Application Load Balancer (ALB)
- ECS Cluster (Fargate)
- Docker Container
- GitHub Actions CI/CD
- Terraform Remote State (S3 + DynamoDB)

---

# Architecture Diagram

https://github.com/domingueslucas22/gitapp/blob/main/architecture.png

---

# Tech Stack

Infrastructure
- Terraform
- AWS ECS (Fargate)
- AWS Application Load Balancer
- AWS VPC

CI/CD
- GitHub Actions
- Docker
- DockerHub

Application
- Node.js
- Express

---

# Terraform Architecture

The infrastructure is modularized using Terraform modules.
