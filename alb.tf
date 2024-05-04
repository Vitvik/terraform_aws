provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
      command     = "aws"
    }
  }
}
//cluster_id

resource "helm_release" "aws-load-balancer-controller" {
  name       = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version    = "1.5.3"
  //  cluster_id
  set {
    name  = "clusterName"
    value = module.eks.cluster_name
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.aws_load_balancer_controller.arn
  }

  depends_on = [
    module.eks,
    aws_iam_role_policy_attachment.aws_load_balancer_controller_attach
  ]
}

/*
set {
    name  = "serviceAccount.create"
    value = "true" 
  }

  set {
    name  = "region"
    value = var.region
  }

  set{
    name="vpcId"
    value = module.vpc.vpc_id
  }

  set {
    name  = "cluster.tlsCertificateSHA1"
    value = module.eks.cluster_tls_certificate_sha1_fingerprint
  }
*/  

