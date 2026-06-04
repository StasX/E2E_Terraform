# Access variables
variable "AWS_ACCESS_KEY" {
  type      = string
  sensitive = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  type      = string
  sensitive = true
}

variable "AWS_REGION" {
  type      = string
  sensitive = true
}


# Infrastructure variables
variable "vpc_id" {
  type    = string
  default = "vpc-02cb949d2612494f5"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "ami" {
  type    = string
  default = "ami-098e39bafa7e7303d"
}


# Key pair variables
variable "key_name" {
  type    = string
  default = "builder-key"
}
