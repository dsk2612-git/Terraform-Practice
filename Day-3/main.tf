resource "aws_instance" "dev" {
  ami = "ami-0b7207e48d1b6c06f"
  instance_type = "t2.micro"
  key_name = "demo"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Day-3"
  }
}