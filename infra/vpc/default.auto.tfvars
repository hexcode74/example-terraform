# AWS Default
region = "ap-northeast-2"
aws_credentials_location = "~/.aws/credentials"
aws_profile = "example-profile"

subnet = {
  private = ["10.0.11.0/24", "10.0.12.0/24"],
  public = ["10.0.1.0/24", "10.0.2.0/24"]
}

# VPC
cidr_block = "10.0.0.0/16"

### Route Table
# any allow
any_rt_block = "0.0.0.0/0"

rt_block = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.11.0/24",
  "10.0.12.0/24"
]

default_tags = {
  Environment = "dev"
  Project = "example-infra"
  Team = "infra"
  Owner = "infra"
}
