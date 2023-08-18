#!/bin/bash

# Replace with your Task Definition family name
TASK_DEF_FAMILY="YourTaskDefinitionFamily"
AWS_REGION="us-west-1"  # Change this to your AWS region

# Get the latest revision of the Task Definition
LATEST_TASK_DEF=$(aws ecs describe-task-definition --task-definition $TASK_DEF_FAMILY --region $AWS_REGION)

# Print the latest Task Definition
echo $LATEST_TASK_DEF

# If you only want the ARN of the latest Task Definition
LATEST_TASK_DEF_ARN=$(echo $LATEST_TASK_DEF | jq -r '.taskDefinition.taskDefinitionArn')
echo $LATEST_TASK_DEF_ARN
