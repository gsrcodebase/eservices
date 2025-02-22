
variable "aws_region" {
  description = "AWS Region to deploy the resources"
  default     = "us-east-1"   # You can change this to your preferred region
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  default     = "eServicesEmailSender"
}

variable "ses_sender_email" {
  description = "The email address used to send emails through SES"
  default     = "sender@example.com"
}

variable "ses_recipient_email" {
  description = "The email address that will receive the email"
  default     = "recipient@example.com"
}
