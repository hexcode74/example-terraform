variable "region" {
  default     = "ap-northeast-2"
  description = "region"
}

variable "aws_credentials_location" {
  description = "location of aws credential"
}

variable "aws_profile" {
  description = "location of aws profile in aws credential"
}

variable "cluster_name" {
  type = string
  description = "eks cluster name"
}

variable "default_tags" {
  type        = map
  description = "default tag (enviroment,project,team,owner)"
}
