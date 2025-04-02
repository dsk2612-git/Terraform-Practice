provider "aws" {
  
}

resource "aws_instance" "name" {
  ami = "ami-0b7207e48d1b6c06f"
  key_name = "democp"
  instance_type = "t2.micro"
  tags = {
    Name = "opentofu"
  }
}