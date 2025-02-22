output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = aws_lambda_function.eServices_email_sender.function_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.eServices_email_sender.arn
}

output "api_gateway_url" {
  description = "URL of the API Gateway"
  value       = aws_api_gateway_rest_api.eServices_api.execution_arn
}

