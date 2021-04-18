
output "Stage_URL" {
  value = "http://${kubernetes_service.test.status.0.load_balancer.0.ingress.0.ip}/"
}


output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.dns_prefix
}



#output "aks_id" {
#  value = azurerm_kubernetes_cluster.aks.id
#}

#output "aks_fqdn" {
#  value = azurerm_kubernetes_cluster.aks.fqdn
#}

#output "aks_node_rg" {
#  value = azurerm_kubernetes_cluster.aks.node_resource_group
#}

#output "aks_kube_config" {
#  value = azurerm_kubernetes_cluster.aks.kube_config_raw
#}

#output "Stage_URL" {
#  value = "http://${kubernetes_service.test.status.0.load_balancer.0.ingress.0.ip}/"
#}


#output "resource_group_name" {
#  value = azurerm_resource_group.rg.name
#}

#output "kubernetes_cluster_name" {
#  value = azurerm_kubernetes_cluster.aks.dns_prefix
#}
