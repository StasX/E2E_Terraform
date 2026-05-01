# Reference to VPC
data "aws_vpc" "vpc" {
  id = var.vpc_id
}


# Get subnets
data "aws_subnets" "subnets" {
  # Get all subnets in vpc  
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }

  # Filter subnets by availability zone
  filter {
    name   = "availability-zone"
    values = [var.availability_zone]
  }
}
