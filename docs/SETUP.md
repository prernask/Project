# Setup Quickstart

Prerequisites:
- AWS account + IAM permissions
- AWS CLI configured
- kubectl installed
- eksctl or terraform for EKS
- Docker installed
- Jenkins server reachable (or use local Jenkins)
- Ansible installed on control host

High-level steps:
1. Create EKS cluster (use terraform/eksctl).
2. Configure kubeconfig locally and on ansible control host.
3. Create Docker Hub repos: yourhub/frontend and yourhub/backend.
4. Configure Jenkins credentials: docker credentials and SSH key for ansible host.
5. Update `jenkins/Jenkinsfile` with your Docker repo and ansible host.
6. Run Jenkins pipeline or build images manually and push.
7. Ansible will deploy Kubernetes manifests to the cluster.

