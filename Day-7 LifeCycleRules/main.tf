resource "aws_instance" "dev"{
    ami = "ami-0fd05997b4dff7aac"
    instance_type = "t2.micro"
    key_name = "democp"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "dev"
    }
 
#  lifecycle {
#       create_before_destroy = true #create first then delete
#     }
# lifecycle {
#       ignore_changes = [ tags, ]
#     }
    # lifecycle {
    #   prevent_destroy = true
    # }


}