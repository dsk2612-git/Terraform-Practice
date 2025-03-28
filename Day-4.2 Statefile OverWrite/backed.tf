#taking same bakend file from day4.1 to prevent from over write of backend file we are changing key of s3 bucket


 terraform {
backend "s3" {
    bucket         = "dsk2612-pp"  # Name of the S3 bucket where the state will be stored.
    region         =  "ap-south-1"
    key            = "Day1/terraform.tfstate" # Path within the bucket where the state will be read/written.
    dynamodb_table = "terraform-state-lock-dynamo" # DynamoDB table used for state locking, note: first run day-4-bckend resources then day-5-backend config
    encrypt        = true  # Ensures the state is encrypted at rest in S3.
}
}