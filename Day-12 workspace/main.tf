provider "aws" {
#   profile = "gsf"
# region = "us-east-1"
}

resource "aws_instance" "test" {
    ami = "ami-0b7207e48d1b6c06f"
    key_name = "democp"
    instance_type = "t2.micro"
    tags = {
      Name = "dev"
    }
}