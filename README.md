<div align="center">
	<p>
	<img alt="Thoughtworks Logo" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/thoughtworks_flamingo_wave.png?sanitize=true" width=200 /><br />
	<img alt="DPS Title" src="https://raw.githubusercontent.com/ThoughtWorks-DPS/static/master/EMPCPlatformStarterKitsImage.png?sanitize=true" width=350/><br />
	<h2>psk-platform-simple-teams-and-ns</h2>
	<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/github/license/ThoughtWorks-DPS/psk-aws-control-plane-services"></a>
	</p>
</div>

In the greenfield development of an engineering platform there will typical be a window of time, preferably short, between when the early adopting customers need usable access to the platform but before the custom platform APIs are sufficiently mature to manage even the mvp capabilities.  

A simple way to address this problem (and even provide a good development resources to the team building the platform APIs), is to use a basic pipeline to applpy the needed, basic configuration. For this approach to be manageable, limit the scope to:

* Customer (team) namespaces

Customers will get a _default_ set of environments (such as dev, qa, and prod) in a default set of cluster (nonprod and prod). Wait to enable user-manageable namespaces as part of an API driven capability.  

The namespace definitions can include annotations for things like inclusion within the service mesh, OPA for http, and pod-security settings. In addition, include ns ResourceQuotas.  

* The mvp of the plataform should include one or more product-defined, managed top-level domains that support ingress.

The example strategy uses two domains, twdps.io and twdps.digital. Scalable configuration for the various subdomains or path-patterns to support these product domains should be api managed just like custom ns. A good short-term stragy is to initial aupport default ingress patterns much the same was as default environments are provided.  

Default environment gateways:  

| gateway                                 | urls                                |  cluster                |
|-----------------------------------------|-------------------------------------|-------------------------|
| preview.twdps.digital-gateway           | (*.)preview.twdps.digital           | sbx-i01-aws-us-east-1   |
| preview.twdps.io-gateway                | (*.)preview.twdps.io                | sbx-i01-aws-us-east-1   |
| dev.twdps.digital-gateway               | (*.)dev.twdps.digital               | prod-i01-aws-us-east-1  |
| dev.twdps.io-gateway                    | (*.)dev.twdps.io                    | prod-i01-aws-us-east-1  |
| qa.twdps.digital-gateway                | (*.)qa.twdps.digital                | prod-i01-aws-us-east-1  |
| qa.twdps.io-gateway                     | (*.)qa.twdps.io                     | prod-i01-aws-us-east-1  |
| prod.twdps.digital-gateway              | (*.)prod.twdps.digital              | prod-i01-aws-us-east-1  |
| prod.twdps.io-gateway                   | (*.)prod.twdps.io                   | prod-i01-aws-us-east-1  |


A typical external->internal routing patterns for domains would be:

api.twdps.io  >  "external api gateway"  >  api.prod.twdps.io
dev.api.twdps.io > "external api gateway" > api.stage.twdps.io  # or whatever environment constitutes a publically useable test env

A small list of example early-adopter customers have their configuration managed by this temporary, simple ns management pipeline.  

| alpha teams           | sbx-i01-aws-us-east-1  | prod-i01-aws-us-east-2  |
|-----------------------|:----------------------:|:-----------------------:|
| twdps-core-labs-team  | preview                | dev, qa, prod           |
| demo                  | preview                | dev, qa, prod           |
| demo-publications     |                        | dev, qa, prod           |
| demo-reviews          |                        | dev, qa, prod           |

For each, there will be a demo-preview, demo-dev and so on depending on the team and the cluster. Only demo and twdps-core-labs-team have a preview ns in the sbx cluster for demonstrating the role of the preview cluster.  

## Note

This pipeline is expected to be short-lived and only used to support a small number of teams onboarded. Any scale at all will begin to reveal that this is unsustainable. The value is limited to getting a limited number of early adoptors onto the plateform to provide the necessary feedback loop for features as they evolve. THe follow-on API that will ultimately own this category of configuration must be a high priority.
