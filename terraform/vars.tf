# access variables
variable "AWS_ACCESS_KEY" {
  type      = string
  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type      = string
  sensitive = true
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_id" {
  type = string
  default = "vpc-01edce99b85a99ff2"
}

variable "key_name"{
  type = string
  default = "builder-key"
}
