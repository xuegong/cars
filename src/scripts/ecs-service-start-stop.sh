#!/bin/bash

# Replace with your values
CLUSTER_NAME="YourEcsClusterName"
SERVICE_NAME="YourEcsServiceName"
AWS_REGION="us-west-1"  # Change to your AWS region

# Decide whether to start or stop
ACTION=$1

case $ACTION in
    start)
        # Set DESIRED_COUNT to a number >0 for your service
        DESIRED_COUNT=1
        ;;
    stop)
        DESIRED_COUNT=0
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
esac

# Update the service with the desired count
aws ecs update-service --cluster $CLUSTER_NAME --service $SERVICE_NAME --desired-count $DESIRED_COUNT --region $AWS_REGION

# Echo the service status
aws ecs describe-services --cluster $CLUSTER_NAME --services $SERVICE_NAME --region $AWS_REGION | jq '.services[] | {serviceName: .serviceName, desiredCount: .desiredCount, runningCount: .runningCount}'
