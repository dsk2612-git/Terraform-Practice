# Create VPC
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "test server"
    }
}

# Create Subnets
resource "aws_subnet" "Public" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "Public_subnet"
    }
}

resource "aws_subnet" "Private" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "Private_subnet"
    }
}

# Create Internet Gateway and Attach to VPC
resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.dev.id
    tags = {
      Name = "My-IG"
    }
}

# Create Route Table and Associate with Public Subnet
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "MY-RT"
  }
}

resource "aws_route_table_association" "sb" {
    route_table_id = aws_route_table.rt.id
    subnet_id = aws_subnet.Public.id
}

# Create Security Group (SSH, HTTP, and Egress Rules)
resource "aws_security_group" "sg" {
    name = "my-sg"
    description = "allow access"
    vpc_id = aws_vpc.dev.id
    tags = {
      Name = "SG"
    }

    ingress {
        description = "http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        description = "ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# Create EC2 Instances

# Public Server
resource "aws_instance" "public" {
    ami = "ami-05fa46471b02db0ce"
    instance_type = "t2.medium"
    key_name = "demo"
    # availability_zone = "ap-south-1c"
    subnet_id = aws_subnet.Public.id
    vpc_security_group_ids = [aws_security_group.sg.id]
    associate_public_ip_address = true
    tags = {
      Name = "dec2"
    }
}

# Private Server
resource "aws_instance" "private" {
    ami = "ami-05fa46471b02db0ce"
    instance_type = "t2.micro"
    key_name = "demo"
    subnet_id = aws_subnet.Private.id
    vpc_security_group_ids = [aws_security_group.sg.id]
    associate_public_ip_address = false
    tags = {
      Name = "dev_ec2"
    }
}









######## # create vpc 

# resource "aws_vpc" "dev" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "test server"
#   }
# }

# # create subnets

# resource "aws_subnet" "Public" {
#   vpc_id     = aws_vpc.dev.id
#   cidr_block = "10.0.0.0/24"
#   tags = {
#     Name = "Public_subnet"
#   }
# }
# resource "aws_subnet" "Private" {
#   vpc_id     = aws_vpc.dev.id
#   cidr_block = "10.0.1.0/24"
#   tags = {
#     Name = "Private_subnet"
#   }
# }

# # create internet gateway and attach to vpc

# resource "aws_internet_gateway" "gg" {
#   vpc_id = aws_vpc.dev.id
#   tags = {
#     Name = "My-IG"
#   }
# }

# # create route table and edit routes to the internet gateway and subnet association to the required subnet

# resource "aws_route_table" "rt" {
#   vpc_id = aws_vpc.dev.id
#   tags = {
#     Name = "MY-RT"
#   }
#   route = {[
#     cidr_block , "0.0.0.0/0" ,
#     gateway_id , aws_internet_gateway.gg.id
#   ]}
# }

# resource "aws_route_table_association" "sb" {
#   route_table_id = aws_route_table.rt.id
#   subnet_id      = aws_subnet.Public.id
# }

# # create security group <inbound rules: ssh 20 http 80 / all traffic>

# resource "aws_security_group" "sg" {
#   name        = "my-sg"
#   description = "allow access"
#   vpc_id      = aws_vpc.dev.id
#   tags = {
#     Name = "SG"
#   }
#   ingress {
#     description = "http"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "ssh"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "TCP"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]

#   }

# }
# create instances

#public server

# resource "aws_instance" "public" {
#   ami                         = "ami-05fa46471b02db0ce"
#   instance_type               = "t2.micro"
#   key_name                    = "demo"
#   subnet_id                   = aws_subnet.public.id
#   vpc_security_group_ids      = [aws_security_group.sg.id]
#   associate_public_ip_address = true
#   tags = {
#     Name = "dev_ec2"
#   }

# }

# #private server

# resource "aws_instance" "private" {
#   ami                         = "ami-05fa46471b02db0ce"
#   instance_type               = "t2.micro"
#   key_name                    = "demo"
#   subnet_id                   = aws_subnet.private.id
#   vpc_security_group_ids      = [aws_security_group.sg.id]
#   associate_public_ip_address = false
#   tags = {
#     Name = "dev_ec2"
#   }

# }


