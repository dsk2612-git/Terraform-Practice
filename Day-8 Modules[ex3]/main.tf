module "dev" {
  source = "../Day-8 Modules[ex\uf03a2]"
  ami_id = "ami-0b7207e48d1b6c06f"
  instance_type = "t2.micro"
  key_name = "democp"
}