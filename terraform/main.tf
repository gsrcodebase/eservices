provider "aws" {
  region = "us-east-1"  # Change to your AWS region
}

resource "aws_lambda_function" "eServices_email_sender" {
  filename         = "lambda/email_sender.zip"
  function_name    = "eServicesEmailSender"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "email_sender.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = filebase64sha256("lambda/email_sender.zip")
}

resource "aws_iam_role" "lambda_exec" {
  name = "eServicesLambdaExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

resource "aws_api_gateway_rest_api" "eServices_api" {
  name        = "eServicesEmailAPI"
  description = "API to trigger email sending via Lambda"
}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.eServices_email_sender.function_name
  principal     = "apigateway.amazonaws.com"
}
