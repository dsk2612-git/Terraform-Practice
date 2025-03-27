provider "ams" { 
}

module "test" {
  source = "https://github.com/dsk2612-git/Terraform-Practice/Day-8%20Modules%5Bex%EF%80%BA2%5D"
  ami_id = "ami-0b7207e48d1b6c06f"
  instance_type = "t2.micro"
  key_name = "democp"
}