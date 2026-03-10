terraform {
  backend "s3" {
    bucket         = "lucas-devops-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}