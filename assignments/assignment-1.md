# Create a 2-Tier Architecture on AWS using Terraform

## Objective

To deploy a scalable and secure 2-tier architecture on AWS for a company called `CustomThreads`, utilizing Terraform for infrastructure as code. The architecture will consist of a web/application server tier and a database tier.

## Requirements
### Web/Application Tier
- Create a VPC, subnets, internet gateway, and route tables to ensure a complete infrastructure setup
- Deploy EC2 instances running a web server (Apache).
- Use an Elastic Load Balancer (ELB) to distribute traffic across instances.

### Database Tier:
- Deploy an Amazon RDS instance (MySQL) for the database.
- Ensure proper security group settings for database access.

## Concepts to Cover:
- *Variables using tfVars*: Define variables for the number of application servers, instance types, etc.
- *Counts*: Use the count parameter to create multiple instances based on the variable.
- *Lists and Maps*: Utilize lists for availability zones and maps for instance types.
- *Conditional Expressions*: Implement conditions to set configurations based on environment (e.g., production vs. development).
- *Local Variables*: Create local variables to simplify resource naming and configuration.

## Deliverables:
Terraform Configuration Files:
- `main.tf`: Main configuration file.
- `variables.tf`: Define all necessary variables.
- `terraform.tfvars`: Provide values for the variables.
- `outputs.tf`: Define outputs for important resources (e.g., ELB DNS, RDS endpoint).

### Folder Structure

```sh
/customthreads-aws-infrastructure
  ├── main.tf
  ├── variables.tf
  ├── values.tfvars
  └── outputs.tf
```
---

## Submission:
- Submit the entire project directory as a ZIP file containing the Terraform configuration files and any necessary documentation.

- This task will help you apply your knowledge of Terraform while addressing the requirements for CustomThreads' 2-tier architecture on AWS. Good luck!