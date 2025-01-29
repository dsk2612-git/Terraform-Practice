resource "aws_instance" "dev" {
  ami           = var.amiid
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = var.tags
  }
}


#terraform apply -var="ami=ami-0440d3b780d96b29d" -var="instance_type=t2.micro"
#insert varaibles while apply time


#Note: custom tfvar process ex: dev.tfvar test.tfvar ...etc    while applying time we can call required .tfvars 
#by defualt terraform.tfvars will work
#ex:# terraform apply -var-file="test.tfvars" we can call diff .tfvars like dev and test etc same code will call diff env