{
  "aws_account_id": "{{ op://empc-lab/aws-dps-1/aws-account-id }}",
  "aws_assume_role": "PSKRoles/PSKControlPlaneBaseRole",
  "aws_region": "us-east-2",
  "cluster_name": "prod-i01-aws-us-east-2",
  "external_dns_chart_version": "1.15.0",

  "cluster_domains": [
    "dev.twdps.digital",
    "dev.twdps.io",
    "qa.twdps.digital",
    "qa.twdps.io",
    "api.twdps.digital",
    "api.twdps.io"
  ],
  "issuerEndpoint": "https://acme-v02.api.letsencrypt.org/directory",
  "issuerEmail": "twdps.io@gmail.com"
}