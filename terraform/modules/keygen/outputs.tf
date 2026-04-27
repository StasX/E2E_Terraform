# Output the necessary details
output "ssh_private_key_path" {
  description = "Path to the generated private SSH key"
  sensitive   = true
  value       = local_file.private_key.filename
}

output "ssh_key_name" {
  description = "Name of the AWS SSH key pair"
  value       = aws_key_pair.instance_key.key_name
}
