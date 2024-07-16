provider "aws" {
  alias  = "sbx"
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::${var.nonprod_account_id}:role/${var.sa_assume_role}"
  }
}

module "sbx_external_dns_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.40.0"

  role_path                  = "/PSKRoles/"
  role_name                  = "simple-teams-external-dns-sa"
  attach_external_dns_policy = true

  oidc_providers = {
    main = {
      provider_arn               = data.aws_iam_openid_connect_provider.eks.arn
      namespace_service_accounts = ["istio-system:simple-teams-external-dns"]
    }
  }
}


provider "aws" {
  alias  = "prod"
  region = "us-east-2"
  assume_role {
    role_arn = "arn:aws:iam::${var.prod_account_id}:role/${var.sa_assume_role}"
  }
}

module "prod_external_dns_irsa_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.40.0"

  role_path                  = "/PSKRoles/"
  role_name                  = "simple-teams-external-dns-sa"
  attach_external_dns_policy = true

  oidc_providers = {
    main = {
      provider_arn               = data.aws_iam_openid_connect_provider.eks.arn
      namespace_service_accounts = ["istio-system:simple-teams-external-dns"]
    }
  }
}