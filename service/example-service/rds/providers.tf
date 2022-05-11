terraform {
  required_version = "~> 1.1.7"
}

provider "aws" {
  region                  = var.region
#  shared_credentials_file = var.aws_credentials_location
  profile                 = var.aws_profile
}
