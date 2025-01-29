#creating s3 bucket and dynamo DB for state backend storgae and applying the lock mechanisam for statefile

# resource "aws_s3_bucket" "example" {
#   bucket = "dsk2612-pp"
  
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

resource "aws_instance" "dev" {
  ami = "ami-0b7207e48d1b6c06f"
  instance_type = "t2.micro"
  key_name = "demo"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Day-4.0"
  }
}