#!/bin/bash

# Variables
BUCKET_NAME="portfoliowebsite1993" # Replace with your bucket name
SOURCE_DIR="./mnt/c/users/homepc/desktop/" # Path to your website files

# Step 1: Upload files to S3
echo "Uploading files to S3 bucket: $BUCKET_NAME..."
aws s3 sync $SOURCE_DIR s3://$BUCKET_NAME/ --acl public-read

# Step 2: Configure static website hosting
echo "Configuring static website hosting..."
aws s3 website s3://$BUCKET_NAME/ --index-document index.html --error-document 404.html

echo "Deployment complete. Your website is hosted at:"
echo "http://$BUCKET_NAME.s3-website-$(aws configure get region).amazonaws.com"

