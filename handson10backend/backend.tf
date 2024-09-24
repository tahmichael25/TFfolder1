# Below is Backend block

terraform {
  backend "s3" {
    bucket = "elroitfstate"
    key = "terraform/terraform.tfstate"
    region = "us-west-2"
    profile = "default"
    dynamodb_table = "elroitfstatelock"
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