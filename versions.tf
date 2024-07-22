terraform {
  required_version = "~> 1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "twdps"
    workspaces {
      prefix = "psk-platform-simple-teams-and-ns-"
    }
  }
}

provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn     = "arn:aws:iam::${var.aws_account_id}:role/${var.aws_assume_role}"
    session_name = "psk-aws-platform-simple-teams-and-ns"
  }

  default_tags {
    tags = {
      pipeline                                    = "psk-aws-platform-simple-teams-and-ns"
      "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }
  }
}
