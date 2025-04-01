provider "aws" {
  
}

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
  default = [ "honey","sindhu"]
}

# main.tf
resource "aws_instance" "dsk" {
  ami           = var.ami
  instance_type = var.instance_type
#   count         = length(var.instancename)
for_each = toset(var.instancename)

  tags = {
    # Name = var.instancename[count.index]
    Name = each.value
  }
}
