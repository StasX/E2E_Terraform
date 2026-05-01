resource "aws_instance" "builder" {
  ami                         = var.ami
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = module.network.subnet_ids[0]
  key_name                    = aws_key_pair.instance_key.key_name
  associate_public_ip_address = true
  tags = {
    "Name"    = "builder"
    "Created" = "Terraform"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(local_file.private_key.filename)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello'"
    ]
  }
  depends_on = [module.network.subnet_ids, aws_security_group.sg, aws_key_pair.instance_key]
}
