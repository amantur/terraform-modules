variable "name" {
  type        = string
  description = "Name of the node pool."
}

variable "kubernetes_cluster_id" {
  type        = string
  description = "Id of the cluster to which to associate this node pool."
}

variable "vm_size" {
  type        = string
  description = "Size of the VM as specifed by Virtual Machine specs."
}

variable "enable_autoscaling" {
  type        = bool
  description = "Enables autoscaling between the values of [min_node_count] and [max_node_count] values."
  default     = true
}

variable "min_node_count" {
  type        = number
  description = "Minimum number of nodes in cluster. Should be between 1 and 1000"
  validation {
    condition     = (var.min_node_count >= 0 && var.min_node_count <= 1000)
    error_message = "The Min Node Count should be between 1 and 1000."
  }
  default = 1
}

variable "max_node_count" {
  type        = number
  description = "Maximum number of nodes in cluster. Should be between 1 and 1000"
  validation {
    condition     = (var.max_node_count >= 0 && var.max_node_count <= 1000)
    error_message = "The Max Node Count should be between 1 and 1000."
  }
  default = 1
}

variable "max_pod_count" {
  type        = number
  description = "The maximum number of pods to run on an agent."
  default     = 50
}

variable "kubernetes_subnet_id" {
  type        = string
  description = "Kubernetes Subnet Id"
}

variable "tags" {
  type = map(string)
}
