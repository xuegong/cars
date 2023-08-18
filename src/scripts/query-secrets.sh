#!/bin/bash

SECRET_NAME="YourSecretName"  # Change this to target secret name
AWS_REGION="us-west-1"  # Change this to the region of your secret

# Use AWS CLI to get the secret value
SECRET_VALUE=$(aws secretsmanager get-secret-value --secret-id $SECRET_NAME --region $AWS_REGION | jq -r .SecretString)

# Print the secret value
echo $SECRET_VALUE
