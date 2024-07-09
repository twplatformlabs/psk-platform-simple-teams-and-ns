{
  "nonprod_account_id": "{{ op://empc-lab/aws-dps-2/aws-account-id }}",
  "prod_account_id": "{{ op://empc-lab/aws-dps-1/aws-account-id }}",
  "domain_assume_role": "PSKRoles/PSKPlatformHostedZonesRole"

  "aws_account_id": "{{ op://empc-lab/aws-dps-1/aws-account-id }}",
  "aws_assume_role": "PSKRoles/PSKControlPlaneBaseRole",
  "aws_region": "us-east-2",
  
  "cluster_name": "sbx-i01-aws-us-east-1",

  "external_dns_chart_version": "1.14.4",


  "cluster_domains": [
    "twdps.digital",
    "sbx-i01-aws-us-east-1.twdps.digital",
    "sbx-i01-aws-us-east-1.twdps.io",
    "preview.twdps.digital",
    "preview.twdps.io"
  ],
  "issuerEndpoint": "https://acme-v02.api.letsencrypt.org/directory",
  "issuerEmail": "twdps.io@gmail.com"
}
