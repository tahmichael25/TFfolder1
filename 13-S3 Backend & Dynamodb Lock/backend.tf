# Below is Backend block

terraform {
  backend "s3" {
    bucket = ""
    key = ""
    region = ""
    profile = ""
    dynamodb_table = ""
  }
}


/*
terraform {
  backend "s3" {
    bucket = "jjtech-terraform-state-bucket"
    key = "terraform/terraform.tfstate"
    region = "us-west-2"
    profile = "testing-env"
    dynamodb_table = "jjtech-testing-table"
  }
}
*/