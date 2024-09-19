# Terraform Variables with multiple `.tfVars` files

### To deploy in the `Dev` Environment

- Run `Terraform plan` to see preview the resources to be created

```sh
terraform plan -var-file="./variables/dev.tfvars"
```

- Run `Terraform apply` to create the resources to be created

```sh
terraform apply -var-file="./variables/dev.tfvars"
```
---

### To deploy in the `Prod` Environment

- Run `Terraform plan` to see preview the resources to be created

```sh
terraform plan -var-file="./variables/prod.tfvars"
```

- Run `Terraform apply` to create the resources to be created

```sh
terraform apply -var-file="./variables/prod.tfvars"
```

### To deploy in the `Test` Environment

- Run `Terraform plan` to see preview the resources to be created

```sh
terraform plan -var-file="./variables/test.tfvars"
```
---

- Run `Terraform apply` to create the resources to be created

```sh
terraform apply -var-file="./variables/test.tfvars"
```
---
