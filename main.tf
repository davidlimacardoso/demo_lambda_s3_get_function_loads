locals {
  lambda_zip_location = "outputs/hello.zip"
}


data "archive_file" "hello" {
  type        = "zip"
  source_file = "hello.py"
  output_path = "${local.lambda_zip_location}"
}

resource "aws_lambda_function" "test_lambda" {
  
  filename      = "${local.lambda_zip_location}"
  function_name = "hello_function"
  role          = "${var.lambda_role_arn}"
  handler       = "hello.hello_function"

  source_code_hash = data.archive_file.hello.output_base64sha256

  runtime = "python3.7"
}