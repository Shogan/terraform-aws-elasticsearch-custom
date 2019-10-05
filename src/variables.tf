variable "region" {
  default = "eu-west-2"
  type    = "string"
}

variable "name" {
    type        = string
    default     = "shogan"
    description = "The name for your ElasticSearch cluster"
}

variable "vpc_id" {
    type        = string
    description = "The VPC ID of the VPC to place the ElasticSearch cluster into"
}

variable "namespace" {
    type        = string
    default     = "eg"
    description = "The namespace for your ElasticSearch cluster"
}

variable "stage" {
    type        = string
    default     = "dev"
    description = "The stage or environment for your ElasticSearch cluster"
}

variable "security_groups_to_allow_access_from" {
    type        = list(string)
    description = "The security group IDs to allow access to ElasticSearch from. Note that a new security group will be created if this is specified and this new group will be attached to the ElasticSearch cluster for access to these specified groups."
    default     = []
}

variable "existing_security_groups_for_access" {
    type        = list(string)
    description = "If this list is specified, these security groups will be attached to the ElasticSearch domain instead of a dynamically, terraform created Security Group. The security_groups_to_allow_access_from setting will be ignored in this case."
}

variable "allowed_cidr_blocks" {
    type        = list(string)
    description = "List of CIDR blocks to be allowed to connect to the cluster"
    default     = []
}

variable "subnet_ids" {
    type        = list(string)
    description = "The subnet IDs to place ElasticSearch nodes across"
}

variable "zone_awareness_enabled" {
    type        = bool
    default     = true
    description = "Zone awareness allocates nodes and replica index shards that belong to an Elasticsearch cluster across multiple Availability Zones in the same Region. You must allocate at least one replica shard per Availability Zone for zone awareness to be effective."
}

variable "dedicated_master_enabled" {
    type        = bool
    default     = false
    description = "Indicates whether dedicated master nodes are enabled for the cluster"
}

variable "dedicated_master_type" {
    type        = string
    default     = "t2.small.elasticsearch"
    description = "Instance type of the dedicated master nodes in the cluster"
}

variable "dedicated_master_count" {
    type        = number
    default     = 0
    description = "Number of dedicated master nodes in the cluster"
}

variable "data_instance_type" {
    type        = string
    default     = "t2.small.elasticsearch"
    description = "ElasticSearch Data instance type"
}

variable "data_instance_count" {
    type        = number
    default     = 1
    description = "ElasticSearch Data instance count"
}

variable "iam_role_arns" {
    type        = list(string)
    description = "A list of IAM role ARNs to permit access to the Elasticsearch domain"
    default     = []
}

variable "iam_actions" {
    type        = list(string)
    default     = ["es:ESHttpGet", "es:ESHttpPut", "es:ESHttpPost"]
    description = "List of actions to allow for the IAM roles, e.g. es:ESHttpGet, es:ESHttpPut, es:ESHttpPost"
}

variable "encrypt_at_rest_enabled" {
    type        = bool
    default     = true
    description = "Whether to enable encryption at rest"
}

variable "encrypt_at_rest_kms_key_id" {
    type        = "string"
    description = "The KMS key ID to encrypt the Elasticsearch domain with. If not specified, then it defaults to using the AWS/Elasticsearch service KMS key. Specify this as the ARN of the key."
}

variable "node_to_node_encryption_enabled" {
    type        = bool
    default     = true
    description = "Whether to enable node-to-node encryption"
}

variable "kibana_subdomain_name" {
    type        = string
    default     = "kibana-es"
    description = "The name of the subdomain for Kibana in the DNS zone (e.g. kibana, ui, ui-es, search-ui, kibana.elasticsearch)"
}

variable "tag_map" {
    type    = map(string)
    default = {"Terraformed" = "true"}
}