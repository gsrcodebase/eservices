import boto3
import json
import os

# SES client initialization
ses_client = boto3.client('ses', region_name=os.getenv('AWS_REGION', 'us-east-1'))  # Default to 'us-east-1'

def lambda_handler(event, context):
    sender = os.getenv('SES_SENDER_EMAIL', 'sender@example.com')
    recipient = os.getenv('SES_RECIPIENT_EMAIL', 'recipient@example.com')
    subject = "Test email from Lambda"
    body_text = "This is a test email sent from AWS Lambda."

    # Send the email using SES
    try:
        response = ses_client.send_email(
            Source=sender,
            Destination={'ToAddresses': [recipient]},
            Message={
                'Subject': {'Data': subject},
                'Body': {'Text': {'Data': body_text}}
            }
        )

        return {
            'statusCode': 200,
            'body': json.dumps('Email sent successfully'),
            'ses_response': response
        }

    except Exception as e:
        print(f"Error sending email: {e}")
        return {
            'statusCode': 500,
            'body': json.dumps(f"Failed to send email: {str(e)}")
        }
