require 'awspec'

describe route53_hosted_zone('dev.twdps.io.') do
  it { should exist }
end

describe route53_hosted_zone('dev.twdps.digital.') do
  it { should exist }
end

describe route53_hosted_zone('qa.twdps.io.') do
  it { should exist }
end

describe route53_hosted_zone('qa.twdps.digital.') do
  it { should exist }
end

describe route53_hosted_zone('prod.twdps.io.') do
  it { should exist }
end

describe route53_hosted_zone('prod.twdps.digital.') do
  it { should exist }
end
