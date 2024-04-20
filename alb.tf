resource "helm_release" "aws-load-balancer-controller" {
  name       = "alb-ingress-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"
  version = "1.5.3"
 
  set {
    name  = "clusterName"
    value = module.eks.cluster_endpoint

  }

  set{
    name="vpcId"
    value = module.vpc.vpc_id
  }

  set {
    name  = "cluster.tlsCertificateSHA1"
    value = module.eks.cluster_tls_certificate_sha1_fingerprint
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }
  
  depends_on = [
    module.eks
  ]
}
