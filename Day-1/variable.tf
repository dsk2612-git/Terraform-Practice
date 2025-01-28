variable "ami_id" {
    description = "inserting ami value to main.tf"
    type = string
    default = "ami-0b7207e48d1b6c06f"
}

variable "instance_type" {
    type = string
    default = "t2.nano"
  
}

variable "key_name" {
    type = string
    default = "demo"
  
}