VPC(public/private subnets, NAT gateway, etc)
EKS cluster який буде жити в тому VPC
ECR куди можна буде запушити образ з беком
Всередину EKS задеплоїти ALB ingress controller (через helm чарт)
s3 bucket, cloudfront distribution де буде жити фронт

VPC (öffentliche/private Subnetze, NAT-Gateway, usw.)
EKS-Cluster, der in dieser VPC leben wird
ECR, wo Sie das Image mit dem Backend pushen können
Innerhalb des EKS-Clusters ALB-Ingress-Controller einrichten (über helm chart)
s3-Bucket, Cloudfront-Distribution, in der die Front leben wird
