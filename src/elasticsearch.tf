terraform {
  required_version = ">= 0.12.0"
}

provider "aws" {
  version = ">= 2.28.1"
  region  = var.region
  skip_credentials_validation = true
}

data "aws_caller_identity" "current" {}

module "elasticsearch" {
  source                              = "git::https://github.com/Shogan/terraform-aws-elasticsearch.git?ref=tags/0.5.2"
  elasticsearch_version               = "7.1"
  namespace                           = var.namespace
  stage                               = var.stage
  name                                = var.name
  security_groups                     = var.security_groups_to_allow_access_from
  existing_security_groups_for_access = var.existing_security_groups_for_access
  vpc_id                              = var.vpc_id
  subnet_ids                          = var.subnet_ids
  zone_awareness_enabled              = var.zone_awareness_enabled
  instance_type                       = var.data_instance_type
  instance_count                      = var.data_instance_count
  iam_role_arns                       = var.iam_role_arns
  iam_actions                         = var.iam_actions
  encrypt_at_rest_enabled             = var.encrypt_at_rest_enabled
  node_to_node_encryption_enabled     = var.node_to_node_encryption_enabled
  kibana_subdomain_name               = var.kibana_subdomain_name
  tags                                = var.tag_map
  create_iam_service_linked_role      = false
  ebs_volume_size                     = 10
  custom_access_policies              = templatefile("${path.module}/templates/domain-all-access-policy.json", { region = var.region, account_id = data.aws_caller_identity.current.account_id, namespace = var.namespace, stage = var.stage, name = var.name })

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }
}
