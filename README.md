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

## Enterprise CI/CD Security Boundaries

Think of enterprise CI/CD security as a series of security boundaries.
Each layer provides an additional level of protection, creating a
defense-in-depth security model.

| Security Layer | Enterprise Control |
|---|---|
| **Repository Access** | Private repositories where appropriate, SSO, MFA, limited collaborators |
| **Branch Protection** | Pull requests, required reviews, CODEOWNERS, protected branches |
| **Workflow Security** | Restrict third-party actions, pin trusted actions to commit SHAs, limit token permissions |
| **AWS Authentication** | OIDC with restricted trust-policy subjects and audiences |
| **AWS Authorization** | Least-privilege IAM roles, permission boundaries, SCPs |
| **Deployment Approval** | Protected GitHub Environments and required reviewers |
| **Network Security** | Private runners, controlled egress, private service endpoints where supported |
| **Monitoring** | GitHub audit logs, CloudTrail, IAM Access Analyzer, GuardDuty |
| **Separation of Duties** | Different AWS roles and accounts for development, testing, and production |

### Private Networking vs. Identity-Based Security

Private networking is one layer of security, not a substitute for
identity and authorization.

A GitHub-hosted runner can securely deploy to AWS using OIDC without
a permanent private network connection.

For workloads requiring private connectivity, enterprises can use
self-hosted runners inside controlled networks, with appropriate
isolation and outbound access restrictions.

> [!IMPORTANT]
> A private network does not automatically make a CI/CD pipeline secure.
> Authentication, authorization, governance, monitoring, and network
> security must work together to establish a defense-in-depth architecture.

### Key Architecture Takeaway

The objective is not simply to build a pipeline that deploys
infrastructure successfully. The objective is to design a pipeline
that deploys infrastructure securely, consistently, and within
established enterprise governance boundaries.

## Additional CI/CD Hands-On Projects

Now that you understand the fundamental components of CI/CD,
challenge yourself by building additional automation pipelines.

The goal is to understand how CI/CD can automate infrastructure
deployments, application deployments, security checks, and
operational tasks.

### Beginner Projects

| Project | Description | Technologies |
|---|---|---|
| Static Website Deployment | Automatically deploy an HTML website to an S3 bucket when code is pushed to GitHub | GitHub Actions, S3, IAM, OIDC |
| Python Application Testing | Automatically execute Python unit tests before merging code | GitHub Actions, Python, Pytest |
| Terraform Validation | Automatically check Terraform formatting and configuration syntax | GitHub Actions, Terraform |
| CloudFormation Deployment | Automatically deploy an AWS CloudFormation stack | GitHub Actions, CloudFormation, OIDC |
| AWS Lambda Deployment | Automatically deploy updated Python code to a Lambda function | GitHub Actions, Lambda, AWS CLI |
| Infrastructure Documentation | Automatically generate Terraform documentation when infrastructure code changes | GitHub Actions, terraform-docs |

