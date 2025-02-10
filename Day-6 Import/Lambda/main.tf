resource "aws_lambda_function" "name" {
  function_name = "mytest"
  runtime       = "python3.10"
  image_uri = ""
  s3_bucket = null
  handler = "lambda_function.lambda_handler"
  role          = "arn:aws:iam::941377132483:role/service-role/mytest-role-jojsw1hm"
}