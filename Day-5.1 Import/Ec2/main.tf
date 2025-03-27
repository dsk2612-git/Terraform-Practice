resource "aws_instance" "name" {
  ami = "ami-0c50b6f7dc3701ddd"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform import"
  }
}

# resource "aws_lambda_function" "name" {
  
# }