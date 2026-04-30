# Reference to VPC
data "aws_vpc" "vpc" {
  id = var.vpc_id
}

# Get all subnets in VPC
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}
