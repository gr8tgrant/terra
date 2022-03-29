terraform {
  backend "s3" {
    bucket = "kevin-academy-terraform-store-state-s3"
    key    = "terraform.tfstates"
    dynamodb_table = "terraform-lock"

  }
}
