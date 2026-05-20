resource "aws_s3_bucket" "terraform_state" {
  bucket = "ot-dev-terraform-state"

  tags = {
    Name        = "Terraform-state-bucket"
    Application = "Terraform"
    Owner       = "Suraj"
    CostCenter  = "OT-MICRO-2026"
  }

}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LOCKID"
  attribute {
    name = "LOCKID"
    type = "S"
  }
  tags = {
    Name        = "Terraform-Lock-Table"
    Environment = "dev"
    Application = "Terraform"
    Owner       = "Suraj"
    CostCenter  = "OT-MICRO-2026"
  }

}