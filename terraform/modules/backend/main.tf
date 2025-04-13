provider "aws" {
  region = "us-east-1"
}

# resource "random_id" "bucket_suffix" {
#   byte_length = 8
# }

resource "aws_s3_bucket" "tfstatefile" {
  bucket = "hcl-terraform-ecs-state-s3-bucket"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "dynamodb" {
  name = "hcl-dynamo-db-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockId"
  attribute {
    name = "LockId"
    type = "S"
  }
}