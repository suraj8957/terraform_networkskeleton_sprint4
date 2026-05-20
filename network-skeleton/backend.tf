terraform {
  backend "s3" {
    bucket         = "ot-dev-terraform-state"
    key            = "network/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"

  }
}