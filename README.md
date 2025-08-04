# Azure Infrastructure with Terraform

This project deploys a foundational Azure infrastructure for containerized applications using Terraform.

## Services Deployed

*   **Azure Kubernetes Service (AKS):** A managed Kubernetes cluster for orchestrating containerized applications.
*   **Azure Container Registry (ACR):** A private registry for storing and managing container images.
*   **Azure Key Vault:** For securely storing and managing secrets, such as database credentials.
*   **Azure PostgreSQL Flexible Server:** A managed PostgreSQL database service.

## Configuration

This Terraform project uses `dev.tfvars` for configuration. You will need to create this file and populate it with your desired variable values before deploying the infrastructure. An example file (`dev.tfvars.example`) is provided to show the required structure.

## Two-Stage Deployment

This project uses a two-stage deployment process:

1.  **Core Infrastructure (Root Folder):** The first stage, run from the root directory, provisions the core Azure services (AKS, ACR, Key Vault, PostgreSQL).

    ```bash
    # From the root directory
    terraform plan -var-file="dev.tfvars"
    terraform apply -var-file="dev.tfvars" -auto-approve
    ```

2.  **Kubernetes Deployments (`kubernetes-deployments` folder):** The second stage, run from the `kubernetes-deployments` directory, deploys Kubernetes-native resources into the cluster created in the first stage. This includes setting up the Nginx Ingress Controller.

    ```bash
    # From the kubernetes-deployments directory
    cd kubernetes-deployments
    terraform plan -var-file="dev.tfvars"
    terraform apply -var-file="dev.tfvars" -auto-approve
    ```