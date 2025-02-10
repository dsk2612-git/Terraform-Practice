#Continuation to main.tf
#create Instances 
resource "aws_instance" "Public" {
    ami = "ami-0b7207e48d1b6c06f"
    instance_type = "t2.micro"
    key_name = "demo"
    subnet_id = aws_subnet.Public.id
    vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
    associate_public_ip_address = true
    tags = {
      Name = "Public"
    }
}

resource "aws_instance" "Private" {
    ami = "ami-0b7207e48d1b6c06f"
    instance_type = "t2.micro"
    key_name = "demo"
    subnet_id = aws_subnet.Private.id
    vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
    tags = {
      Name = "Private"
    }
}