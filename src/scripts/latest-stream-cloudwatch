#!/bin/bash

# Replace with your Log Group name
LOG_GROUP_NAME="YourLogGroupName"
AWS_REGION="us-west-1"  # Modify to your desired AWS region

# Get the latest log stream based on last event timestamp
LATEST_LOG_STREAM=$(aws logs describe-log-streams --log-group-name $LOG_GROUP_NAME --order-by LastEventTime --descending --limit 1 --region $AWS_REGION | jq -r '.logStreams[0].logStreamName')

if [ -z "$LATEST_LOG_STREAM" ]; then
    echo "No log streams found for Log Group: $LOG_GROUP_NAME"
    exit 1
fi

echo "Latest log stream: $LATEST_LOG_STREAM"

# Optionally, if you want to fetch the latest log events from this stream
LATEST_LOG_EVENTS=$(aws logs get-log-events --log-group-name $LOG_GROUP_NAME --log-stream-name $LATEST_LOG_STREAM --region $AWS_REGION)

echo $LATEST_LOG_EVENTS | jq '.events[] | {timestamp: .timestamp, message: .message}'
