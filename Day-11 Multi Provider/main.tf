provider "aws" {
  region = "ap-south-1"
  profile = "test" #first you should configure the keys under this prifile name
  alias = "devops"
}

provider "aws" {
  region = "us-east-1"
  profile = "prod"  #first you should configure the keys under this prifile name
  alias = "cloud"
}


resource "aws_s3_bucket" "mumbai" {
    bucket = "sdfsf"
    provider = aws.cloud
}

resource "aws_s3_bucket" "virginia" {
  bucket = "afsd"
  provider = aws.devops
}