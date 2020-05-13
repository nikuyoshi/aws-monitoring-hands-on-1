#/bin/sh

set -e -u -o pipefail

profile=default
region=ap-northeast-1

create_stacks () {
    echo "Create VPC stack"
    aws cloudformation create-stack --stack-name monitoring-1-vpc --template-body file://monitoring-1-vpc.yaml --region $region --profile $profile
    aws cloudformation wait stack-create-complete --stack-name monitoring-1-vpc --region $region --profile $profile

    echo "Create EC2 stack"
    aws cloudformation create-stack --stack-name monitoring-1-ec2 --template-body file://monitoring-1-ec2.yaml --region $region --profile $profile
    aws cloudformation wait stack-create-complete --stack-name monitoring-1-ec2 --region $region --profile $profile

    echo "Create ALB stack"
    aws cloudformation create-stack --stack-name monitoring-1-alb --template-body file://monitoring-1-alb.yaml --region $region --profile $profile
    aws cloudformation wait stack-create-complete --stack-name monitoring-1-alb --region $region --profile $profile

    echo "Create RDS stack"
    aws cloudformation create-stack --stack-name monitoring-1-rds --template-body file://monitoring-1-rds.yaml --region $region --profile $profile
    aws cloudformation wait stack-create-complete --stack-name monitoring-1-rds --region $region --profile $profile
}

time create_stacks