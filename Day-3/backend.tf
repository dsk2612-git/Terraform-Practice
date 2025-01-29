terraform {
  backend "s3" {
    bucket = "sfsfsdgds"
    key = "terraform.tfstate"
    region = "ap-south-1"

  }
}