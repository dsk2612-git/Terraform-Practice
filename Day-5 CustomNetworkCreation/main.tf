#creation of VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"
  }
}
#Creation of Subnets
resource "aws_subnet" "Public" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"
#   availability_zone = "ap-south-1a"
  tags = {
    Name = "Public"
  }
}

resource "aws_subnet" "Private" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
#   availability_zone = "ap-south-1b"
  tags = {
    Name = "Private"
  }
}
#creation of Internetgateway and attachment to VPC
resource "aws_internet_gateway" "myig" {
  vpc_id = aws_vpc.myvpc.id
}
#create Routetable, and Routing to Internetgateway
resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.myvpc.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myig.id
  }
  }
#Routetable>>Subnet association to the required subnet
resource "aws_route_table_association" "myrt" {
  route_table_id = aws_route_table.myrt.id
  subnet_id = aws_subnet.Public.id
}
#create security group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.myvpc.id
  tags = {
    Name = "mysg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}

# Elastic IP for NAT
resource "aws_eip" "nat_eip" {
  tags = {
    Name = "NatEIP"
  }
}


resource "aws_nat_gateway" "nat" {
  subnet_id = aws_subnet.Public.id
  allocation_id = aws_eip.nat_eip.id
}


# Create route table and map to NAT gateway
resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "private_RT"
  }
}

resource "aws_route_table_association" "private_RT" {
  route_table_id = aws_route_table.private_RT.id
  subnet_id = aws_subnet.Private.id
}
