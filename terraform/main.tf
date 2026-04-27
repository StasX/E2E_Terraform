module "keygen" {
  source = "./modules/keygen"
  key_path = "${path.module}/builder_key.pem"
  key_name = "builder-key"
}

module "infra" {
  source = "./modules/infra"
  vpc_id = var.vpc_id
}