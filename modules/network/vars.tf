variable "vpc_id" {
  type = string
  validation {
    condition     = can(regex("vpc-[0-9a-f]{17}", var.vpc_id))
    error_message = "Invalid vpc_id format. It should match the pattern 'vpc-xxxxxxxxxxxxxxxxx' where x is a hexadecimal character."
  }
}

variable "availability_zone" {
  type      = string
  sensitive = true
  validation {
    condition     = can(regex("^[a-z]{2}-[a-z-]+-[0-9]+[a-z]?$", var.availability_zone))
    error_message = "Invalid availability_zone. Must match xx-xxxx-x format, optionally followed by a letter."
  }
}
