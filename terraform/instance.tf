resource "aws_instance" "builder" {
  ami = "ami-098e39bafa7e7303d"
  instance_type               = "t3.medium"
  availability_zone           = var.region
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = module.network.subnet_ids[0]
  key_name                    = module.keygen.key_name
  associate_public_ip_address = true
  tags = {
    "Name"    = "builder"
    "Created" = "Terraform"
  }
  depends_on = [module.infra.subnet_ids, aws_security_group.sg, module.keygen.key_name]
}