# Terraform CI/CD GitHub Pipeline

Purpose of this Repository is to showcase using a CI/CD pipeline via GitHub to push code to an AWS account. This will be a simple CI/CD pipeline create 1 VPC with three subnets, route tables, and etc.

## Requirements for any CI/CD Pipeline

8 fundamental components of CI/CD
Component	Purpose	Examples
1. Source code repository	Store and version-control code	GitHub, GitLab, CodeCommit, Bitbucket
2. Pipeline engine	Orchestrate the automation process	GitHub Actions, CodePipeline, Jenkins, GitLab CI/CD
3. Authentication	Establish the pipeline's identity	OIDC, IAM federation, service accounts
4. Authorization	Determine what the pipeline can access or modify	IAM roles, IAM policies, RBAC
5. Execution environment	Provide compute resources to execute commands	GitHub runners, CodeBuild, Jenkins agents
6. Pipeline configuration	Define triggers, stages, commands and dependencies	YAML, Jenkinsfile, buildspec.yml
7. Storage and state management	Store build artifacts, packages or infrastructure state as needed	S3, ECR, Artifactory
8. Deployment target	Identify where the code or infrastructure will be deployed	AWS, Azure, GCP, Kubernetes, on-premises