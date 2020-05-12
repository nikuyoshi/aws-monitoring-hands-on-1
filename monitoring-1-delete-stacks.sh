#/bin/sh

set -e -u -o pipefail

profile=default
region=ap-northeast-1

delete_stacks () {
    echo "Delete RDS stack"
    aws cloudformation delete-stack --stack-name monitoring-1-rds --region $region --profile $profile
    aws cloudformation wait stack-delete-complete --stack-name monitoring-1-rds --region $region --profile $profile

    echo "Delete ALB stack"
    aws cloudformation delete-stack --stack-name monitoring-1-alb --region $region --profile $profile
    aws cloudformation wait stack-delete-complete --stack-name monitoring-1-alb --region $region --profile $profile

    echo "Delete EC2 stack"
    aws cloudformation delete-stack --stack-name monitoring-1-ec2 --region $region --profile $profile
    aws cloudformation wait stack-delete-complete --stack-name monitoring-1-ec2 --region $region --profile $profile

    echo "Delete VPC stack"
    aws cloudformation delete-stack --stack-name monitoring-1-vpc --region $region --profile $profile
    aws cloudformation wait stack-delete-complete --stack-name monitoring-1-vpc --region $region --profile $profile
}

time delete_stacks