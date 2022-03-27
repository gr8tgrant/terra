resource "aws_s3_bucket" "kevin_project_bucket" {
    bucket = "kevin-academy-686520628199-tfstates"

    lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name = "kevin-academy-686520628199-tfstates"
        Environment = "Test"
    }
}

resource "aws_s3_bucket_versioning" "kevin_my_bucket" {
  bucket = aws_s3_bucket.kevin_project_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
