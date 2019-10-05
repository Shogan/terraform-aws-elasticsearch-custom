# terraform-aws-elasticsearch-custom

An example of a managed Elasticsearch cluster running in AWS, leveraging the excellent CloudPosse terraform module (forked). Encryption settings dialed up / enabled to make it extra secure. (**Note:** in dev environment example node sizes are reduced and encryption-at-rest disabled).

The module source for this repository is a forked version of the CloudPosse official Terraform [module](https://github.com/cloudposse/terraform-aws-elasticsearch) for AWS ElasticSearch.

You can find the customised module source [here](https://github.com/Shogan/terraform-aws-elasticsearch)

This particular [implementation](https://github.com/cloudposse/terraform-aws-elasticsearch) has some tweaks made to prevent the original modules' security group creation from happening. This is done in particular for AWS accounts where Security Group creation/edit and/or IAM create/edit permissions have been revoked or are handled by other siloed teams.

Effectively, this Terraform AWS ElasticSearch implementation will do most of what the CloudPosse one does, but it adds variables, and defines optionals for:

* Node-to-Node Encryption being enabled by default
* Encryption at rest enabled by default for the prod and staging example .tfvars / environment files
* Default master/data node instance types that work with Encryption at rest being enabled in staging/prod .tfvars files

The module has been customised to allow for preventing automatic security group (default and egress) creation if required, as well as preventing dynamic IAM role creation too, if required. Useful for when your IAM credentials have specific denies in place that prevent security group and IAM resource creation/modification.
