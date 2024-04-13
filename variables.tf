

variable "MONGODB_ATLAS_ORGANIZATION_ID" {
  default     = "6395efc19ab5a87ebc8b6d23"
  description = "Organization ID"
  type        = string
  sensitive   = true
}

variable "USER_PASSWORD" {
  default     = "fXUJAFkf5ZZbuY6z"
  description = "User password"
  type        = string
  sensitive   = true
}

variable "cidr_block_list" {
  type        = list(string)
  description = "Cidr block list"
  default     = ["0.0.0.0/1", "128.0.0.0/1"]
}

variable "provider_instance_size_name" {
  type        = string
  description = "Provider instance size name"
}

variable "provider_name" {
  type        = string
  description = "Provider name"
}

variable "backing_provider_name" {
  type        = string
  description = "Backing provider name"
}

variable "provider_region_name" {
  type        = string
  description = "Provider region name"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name"
}

variable "username" {
  type        = string
  description = "User name"
}

variable "auth_database_name" {
  type        = string
  description = "Auth database name"
}

variable "role_name" {
  type        = string
  description = "Role name"
}

variable "database_name" {
  type        = string
  description = "Database name"
}

