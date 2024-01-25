#!/bin/bash
#
#############################
# Author: RISHI SETHI
# Date: 25th Jan, 2024
#
# Version:1.0
# This script will report the AWS usage.
############################
#
# set -x # For debug mode
set -e # To exit if error
# set -o # For pipe line error
# AWS S3, EC2, IAM Users, Lambda
#
# To list the s3 buckets
# echo "Print s3 buckets"
# aws s3 ls

# To list ec2 instances
echo "Print ec2 instances" > resource-tracker
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resource-tracker

# To list lambda functions
echo "Print lambda functions list" >> resource-tracker
aws lambda list-functions >> resource-tracker

# To list iam users
echo "Print list of iam-users" >> resource-tracker
aws iam list-users | jq '.Users[].UserName' >> resource-tracker