# Terraform CI/CD GitHub Pipeline

Purpose of this Repository is to showcase using a CI/CD pipeline via GitHub to push code to an AWS account. This will be a simple CI/CD pipeline create 1 VPC with three subnets, route tables, and etc.

## 8 Fundamental Components of CI/CD

Regardless of whether you use GitHub, GitLab, Jenkins, or AWS CodePipeline, the fundamental architectural components of CI/CD remain the same.

| Component | Purpose | Examples |
| :--- | :--- | :--- |
| **1. Source Code Repository** | Store and version-control code | GitHub, GitLab, CodeCommit, Bitbucket |
| **2. Pipeline Engine** | Orchestrate the automation process | GitHub Actions, CodePipeline, Jenkins, GitLab CI/CD |
| **3. Authentication** | Establish the pipeline's identity | OIDC, IAM federation, service accounts |
| **4. Authorization** | Determine what the pipeline can access or modify | IAM roles, IAM policies, RBAC |
| **5. Execution Environment** | Provide compute resources to execute commands | GitHub Runners, CodeBuild, Jenkins Agents |
| **6. Pipeline Configuration** | Define triggers, stages, commands, and dependencies | YAML, Jenkinsfile, buildspec.yml |
| **7. Storage and State Management** | Store build artifacts, packages, or infrastructure state as needed | Amazon S3, Amazon ECR, Artifactory |
| **8. Deployment Target** | Identify where the code or infrastructure will be deployed | AWS, Azure, GCP, Kubernetes, On-premises |

> **Architectural Takeaway:** Learn the architecture, not just the product. The technologies may change, but the fundamental requirements remain the same.

## Five questions every cloud architect should ask

1. Where does the code live?
2. What executes the code?
3. How does it authenticate, and what is it authorized to do?
4. Where is the code being deployed?
5. How do we control, secure, monitor and recover the deployment?

## Job Roles

### Engineering vs. Architecture

| Cloud Engineer | Cloud Architect |
| :--- | :--- |
| Create the repository | Select the platform |
| Configure the runner | Design the trust model |
| Write the YAML | Define security boundaries |
| Configure the IAM role | Establish governance |
| Execute the pipeline | Design recovery strategies |

> **Engineering:** How do we build and implement the solution?
>
> **Architecture:** How do we design a secure, scalable, reliable, and sustainable solution?

Understanding both perspectives is essential to becoming a successful Cloud Architect.