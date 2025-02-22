import boto3
import json

def lambda_handler(event, context):
    ses_client = boto3.client('ses', region_name='us-east-1')  # Use your region

    # Sample email details
    sender = "gsramadurai1@gmail.com"
    recipient = "gramadurai01@gmail.com"
    subject = "Test email from Lambda"
    body_text = "This is a test email sent from AWS Lambda."

    # Send email
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
        'body': json.dumps('Email sent successfully')
    }
