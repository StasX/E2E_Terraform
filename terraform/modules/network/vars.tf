variable "vpc_id" {
    type    = string
    validation {
      condition = can(regex("vpc-[0-9a-f]{17}", var.vpc_id))
      error_message = "Invalid vpc_id format. It should match the pattern 'vpc-xxxxxxxxxxxxxxxxx' where x is a hexadecimal character."
    }
}