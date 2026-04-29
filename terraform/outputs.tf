
output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.builder.public_ip
}

output "key_path" {
  description = "Path to the generated private SSH key"
  value       = module.keygen.private_key_path
}

output "sec_group_id" {
  description = "Security group ID"
  value       = aws_security_group.sg.id
}
