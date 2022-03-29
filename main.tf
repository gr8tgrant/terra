resource "aws_s3_bucket" "kevin_project_bucket" {
    bucket = "kevin-academy-terraform-store-state-s3"

    lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name = "kevin-academy-terraform-store-state-s3"
        Environment = "Test"
    }
}

resource "aws_s3_bucket_versioning" "kevin_my_bucket" {
  bucket = aws_s3_bucket.kevin_project_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}
