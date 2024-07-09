require 'awspec'

describe route53_hosted_zone('preview.twdps.digital.') do
  it { should exist }
end

describe route53_hosted_zone('preview.twdps.io.') do
  it { should exist }
end
