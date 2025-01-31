# Future work

## Scenarios  

1. VPC origin
1. Origin Selection
1. Add an observability option for CloudFront: CloudWatch or real time logs
1. Demonstrate an Lambda URL based API
1. Graceful failover
1. Report false positives 
1. Display Server timing headers in CloudWatch RUM
1. Include CAPTCHA in registration worklflow
1. Block unexpected API paths

## App code
* Add more registration data (e.g. First and Last name)
* Preview display in social networks
* GenAI search bar

## Infra code
* Add CSP header
* Move static content to own bucket with appropriate caching behavior
* Config file change to work with CDK output
* Allow the option for custom domain in CDK input parameters
* Update WAF WebACL on every CDK change
* More holistic Fraud prevention on the registration (e.g. custom solutions)
