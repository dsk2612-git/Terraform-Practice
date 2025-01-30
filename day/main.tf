# resource "aws_s3_bucket" "example" {
#   bucket = "dsk2612-ppq"
  
# }

# resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
#   name = "terraform-state-lock-dynamo"
#   hash_key = "LockID"
#   read_capacity = 20
#   write_capacity = 20
 
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

resource "aws_instance" "name" {
  ami = "ami-0b7207e48d1b6c06f"
  instance_type = "t2.micro"
  key_name = "demo"
  tags = {
    Name = "Day-1.0"
  }
}