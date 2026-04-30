module "keygen" {
  source = "./modules/keygen"
  key_path = "${path.module}/builder_key.pem"
  key_name = "builder-key"
}

module "network" {
  source = "./modules/network"
  vpc_id = var.vpc_id
}