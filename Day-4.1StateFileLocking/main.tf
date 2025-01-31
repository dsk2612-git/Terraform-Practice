resource "aws_instance" "name" {
    ami = "ami-0b7207e48d1b6c06f"
    instance_type = "t2.micro"
    key_name = "demo"
    tags = {
      Name = "day"
    }
  
}