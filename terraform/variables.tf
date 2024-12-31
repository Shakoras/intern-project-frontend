variable "resource_group_name" {
  default = "DevopsProjectFrontendRg"
}

variable "aks_cluster_name" {
  default = "DevopsProjectFrontendAKSCluster"
}

variable "location" {
  default = "northeurope"
}

variable "node_count" {
  default = 1
}

variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "The Azure tenant ID"
  type        = string
}