terraform {
  required_version = "~> 1.1.7"
}

provider "aws" {
  region    = var.region
  profile   = var.aws_profile
}
