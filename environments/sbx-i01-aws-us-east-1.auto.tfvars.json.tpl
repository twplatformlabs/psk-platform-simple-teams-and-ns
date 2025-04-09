{
  "aws_account_id": "{{ op://platform/aws-sandbox/aws-account-id }}",
  "aws_assume_role": "PSKRoles/PSKControlPlaneBaseRole",
  "aws_region": "us-east-1",
  "cluster_name": "sbx-i01-aws-us-east-1",
  "external_dns_chart_version": "1.16.0",

  "cluster_domains": [
    "preview.twplatformlabs.org",
    "preview.twplatformlabs.link",
    "preview.twdps.digital",
    "preview.twdps.io"
  ],
  "issuerEndpoint": "https://acme-v02.api.letsencrypt.org/directory",
  "issuerEmail": "twplatformlabs@gmail.com"
}