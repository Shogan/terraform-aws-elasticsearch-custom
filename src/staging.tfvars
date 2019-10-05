vpc_id                               = "vpc-your-vpc-id"
stage                                = "staging"
namespace                            = "eg"
existing_security_groups_for_access  = ["an-existing-sg-id-1", "an-existing-sg-id-2"]
subnet_ids                           = ["subnet-id-1", "subnet-id-2"]
zone_awareness_enabled               = true
dedicated_master_enabled             = true
dedicated_master_count               = 3
dedicated_master_type                = "m5.large.elasticsearch"
data_instance_type                   = "m5.large.elasticsearch"
data_instance_count                  = 3
iam_actions                          = ["es:ESHttpGet", "es:ESHttpPut", "es:ESHttpPost"]
encrypt_at_rest_enabled              = true
encrypt_at_rest_kms_key_id           = "arn-for-your-dedicated-kms-key-id"
node_to_node_encryption_enabled      = true
kibana_subdomain_name                = "kibana-es"