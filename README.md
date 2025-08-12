# Azure Infrastructure with Terraform

This project provides a robust and modular solution for deploying a foundational Azure infrastructure for containerized applications using Terraform. It's designed to be secure, scalable, and easy to manage, making it an ideal starting point for any cloud-native application on Azure.

## Key Features

✨ **Modular and Reusable:** The infrastructure is broken down into reusable modules for each service (AKS, ACR, Key Vault, PostgreSQL), allowing for easy customization and extension. You can easily swap out or modify modules to fit your specific needs.

✨ **Secure by Design:** Utilizes Azure Key Vault for secret management, and all resources are configured with security best practices in mind. Network security groups and private endpoints can be easily added to further enhance security.

✨ **Two-Stage Deployment:** A clear separation between core infrastructure (IaaS/PaaS) and Kubernetes deployments (in-cluster resources). This separation of concerns allows for independent management and updates, providing greater flexibility and control.

## Services Deployed

*   **Azure Kubernetes Service (AKS):** A managed Kubernetes cluster for orchestrating containerized applications.
*   **Azure Container Registry (ACR):** A private registry for storing and managing container images.
*   **Azure Key Vault:** For securely storing and managing secrets, such as database credentials.
*   **Azure PostgreSQL Flexible Server:** A managed PostgreSQL database service.

## Prerequisites

*   [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
*   [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
*   An Azure account with the necessary permissions to create resources.

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/your-repo-name.git
    cd your-repo-name
    ```

2.  **Configure your environment:**
    Create a `dev.tfvars` file based on the provided `dev.tfvars.example` and populate it with your desired variable values.

3.  **Deploy the core infrastructure:**
    ```bash
    # From the root directory
    terraform init
    terraform plan -var-file="dev.tfvars"
    terraform apply -var-file="dev.tfvars" -auto-approve
    ```

4.  **Deploy Kubernetes resources:**
    ```bash
    # From the kubernetes-deployments directory
    cd kubernetes-deployments
    terraform init
    terraform plan -var-file="dev.tfvars"
    terraform apply -var-file="dev.tfvars" -auto-approve
    ```

## Modules

This project is composed of several modules, each responsible for a specific part of the infrastructure:

*   **`acr`:** Provisions the Azure Container Registry.
*   **`aks`:** Provisions the Azure Kubernetes Service cluster.
*   **`keyvault`:** Provisions the Azure Key Vault.
*   **`postgres`:** Provisions the Azure PostgreSQL Flexible Server.
*   **`ingress-controller`:** Deploys the Nginx Ingress Controller to the AKS cluster.
