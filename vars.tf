variable "resource_group_name" {
  type        = string
  description = "RG name in Azure"
}


variable "prefix" {
  type        = string
  description = "Enter then environment name"
}

variable "location" {
  type        = string
  description = "Resources location in Azure"
}

variable "cluster_name" {
  type        = string
  description = "AKS name in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

variable "node_resource_group" {
  type        = string
  description = "RG name for cluster resources in Azure"
}

variable "namespace" {
  type        = string
  description = "Name of namespace in AKS"
}

#variable "subscription" {
#  description = " Share the subcription for the deployment"
#}


