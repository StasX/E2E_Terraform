# Reference to VPC
data "aws_vpc" "vpc" {
  id = var.vpc_id
}


data "aws_subnets" "subnets" {
  
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "availability-zone"
    values = [var.availability_zone]
  }
}
