# default.auto.tfvars 에 쓸 변수 정의 파일

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

variable "cidr_block" {
  type        = string
  description = "vpc cidr block"
}

variable "default_tags" {
  type        = map
  description = "default tag (enviroment,project,team,owner)"
}

variable "subnet" {
  type        = map
  description = "subnet list"
}

variable "any_rt_block" {
  type        = string
  description = "any route table block"
}

variable "rt_block" {
  type        = list
  description = "user route table block"
}
