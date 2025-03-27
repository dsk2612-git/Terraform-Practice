provider "aws" { 
}

module "test" {
  source = "github.com/CloudTechDevOps/terraform0730am/day-8-module-ex2"
  ami_id = "ami-0b7207e48d1b6c06f"
  instance_type = "t2.micro"
  key_name = "democp"
}