resource "aws_instance" "dependent" {
    ami = "ami-0ec0e125bb6c6e8ec"
    instance_type = "t2.micro"
    key_name = "democp"
}

resource "aws_s3_bucket" "dependent" {
    bucket = "hfbbc" 
}

#terraform apply -target=aws_s3_bucket.dependent
#terraform destroy -target=aws_s3_bucket.dependent