terraform {
  backend "s3" {
    bucket                      = "terraform-states-example123"
    key                         = "infra/vpc/terraform.tfstate"
    region                      = "ap-northeast-2"
    dynamodb_table              = "example-terraform-state-lock"
    acl                         = "bucket-owner-full-control"
    encrypt                     = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    profile                     = "example-profile"
  }
}
