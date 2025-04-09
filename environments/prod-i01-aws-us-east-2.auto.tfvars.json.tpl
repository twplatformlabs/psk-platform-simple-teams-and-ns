{
  "aws_account_id": "{{ op://platform/aws-production/aws-account-id }}",
  "aws_assume_role": "PSKRoles/PSKControlPlaneBaseRole",
  "aws_region": "us-east-2",
  "cluster_name": "prod-i01-aws-us-east-2",
  "external_dns_chart_version": "1.16.0",

  "cluster_domains": [
    "dev.twplatformlabs.org",
    "dev.twplatformlabs.link",
    "qa.twplatformlabs.org",
    "qa.twplatformlabs.link",
    "api.twplatformlabs.org",
    "api.twplatformlabs.link",
    "dev.twdps.digital",
    "dev.twdps.io",
    "qa.twdps.digital",
    "qa.twdps.io",
    "api.twdps.digital",
    "api.twdps.io"
  ],
  "issuerEndpoint": "https://acme-v02.api.letsencrypt.org/directory",
  "issuerEmail": "twplatformlabs@gmail.com"
}