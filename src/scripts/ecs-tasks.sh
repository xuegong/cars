#!/bin/bash

# Replace these with your cluster and service names
CLUSTER_NAME="YourEcsClusterName"
SERVICE_NAME="YourEcsServiceName"
AWS_REGION="us-west-1"  # Change this to your AWS region

# List running task ARNs for the given service
TASK_ARNS=$(aws ecs list-tasks --cluster $CLUSTER_NAME --service-name $SERVICE_NAME --desired-status RUNNING --region $AWS_REGION | jq -r '.taskArns[]')

# Fetch and print details for each running task
for TASK_ARN in $TASK_ARNS; do
    aws ecs describe-tasks --cluster $CLUSTER_NAME --tasks $TASK_ARN --region $AWS_REGION
done
