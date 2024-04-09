VPC(public/private subnets, NAT gateway, etc)
EKS cluster який буде жити в тому VPC
ECR куди можна буде запушити образ з беком
Всередину EKS задеплоїти ALB ingress controller (через helm чарт)
s3 bucket, cloudfront distribution де буде жити фронт