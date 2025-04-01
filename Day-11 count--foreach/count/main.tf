provider "aws" {
#   profile = "dsfg"
#   region = "us-east-1"
}

# resource "aws_instance" "name" {
#   ami = "ami-0b7207e48d1b6c06f"
#   key_name = "democp"
#   instance_type = "t2.micro"
#   count = 2
# #   tags = {
# #     Name = "dev"
# #   }
#   tags = {
#     Name = "dev-${count.index}"
#   }
# }


# example-2 with variables list of string 

variable "ami" {
  type    = string
  default = "ami-0b7207e48d1b6c06f"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instancename" {
  type    = list(string)
  default = [  "sindhu"]
}

# main.tf
resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = length(var.instancename)

  tags = {
    Name = var.instancename[count.index]
  }
}

#example-3 creating IAM users 
# variable "user_names" {
#   description = "IAM usernames"
#   type        = list(string)
#   default     = ["user1", "user2", "user3"]
# }
# resource "aws_iam_user" "example" {
#   count = length(var.user_names)
#   name  = var.user_names[count.index]
# }


# example-4 with numeric condition in thid condition if ec2 instance = t2.micro only instance will create(count = var.instance_type == "t2.micro" ? 1 : 0) but i am passing t2.nano so ec2 will not create
# variables.tf
# variable "ami" {
#   type    = string
#   default = "ami-0230bd60aa48260c6"
# }

# variable "instance_type" {
#   type = string
#   default = "t2.nano"
# }

# # main.tf
# resource "aws_instance" "dev" {
#   ami           = var.ami
#   instance_type = var.instance_type
#   count         = var.instance_type == "t2.micro" ? 1 : 0
#   tags = {
#     Name = "dev_server"
#   }
# }