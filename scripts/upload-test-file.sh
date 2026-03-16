#!/bin/bash
BUCKET_NAME="ryan-event-upload-bucket"
FILE=${1:-test.txt}
echo "Uploading $FILE to $BUCKET_NAME..."
aws s3 cp "$FILE" "s3://$BUCKET_NAME/"
echo "Upload complete. Check Lambda logs in CloudWatch."