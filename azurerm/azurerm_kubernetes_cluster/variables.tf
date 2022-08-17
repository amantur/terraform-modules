variable "name" {
  type        = string
  description = "Container Name"
}

variable "location" {
  type        = string
  description = "Cloud Location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "private_cluster_enabled" {
  type        = string
  description = "Private Cluster Enabled"
}

variable "dns_prefix" {
  type        = string
  description = "DNS Prefix"
}

variable "node_size" {
  type        = string
  description = "Node Size"
}

variable "node_disk_size" {
  type        = string
  description = "Node Disk Size"
}

variable "enable_autoscaling" {
  type = bool
}

variable "node_count" {
  type        = number
  description = "Number of node that should exist in cluster. It is required if 'enable_auto_scaling' is set to false."

  validation {
    condition     = var.node_count >= 1 && var.node_count <= 1000
    error_message = "The node count value should be between 1 and 1000. Also, between min and max node counts. It is required if 'enable_auto_scaling' is set to false."
  }
}

variable "min_node_count" {
  type        = number
  description = "Minimum number of nodes in cluster. Should be between 1 and 1000"
  validation {
    condition     = (var.min_node_count >= 1 && var.min_node_count <= 1000)
    error_message = "The Min Node Count should be between 1 and 1000."
  }
}

variable "max_node_count" {
  type        = number
  description = "Maximum number of nodes in cluster. Should be between 1 and 1000"
  validation {
    condition     = (var.max_node_count >= 1 && var.max_node_count <= 1000)
    error_message = "The Max Node Count should be between 1 and 1000."
  }
}

variable "max_pod_count" {
  type        = number
  description = "The maximum number of pods that can run on each agent."
}

variable "kubernetes_network_plugin" {
  type        = string
  description = "Kubernetes Network Plugin"
}

variable "kubernetes_network_policy" {
  type        = string
  description = "Kubernetes Network Policy"
}

variable "kubernetes_subnet_id" {
  type        = string
  description = "Kubernetes Subnet Id"
}

variable "enable_http_application_routing" {
  description = "Enable HTTP application Routing"
}

variable "tags" {
  type = map(string)
}
