resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


# Save the private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/${var.key_name}.pem"
  file_permission = "0600"
}


# Create an AWS key pair using the public key
resource "aws_key_pair" "instance_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh_key.public_key_openssh
}


module "network" {
  source            = "./modules/network"
  vpc_id            = var.vpc_id
  availability_zone = var.availability_zone
}
