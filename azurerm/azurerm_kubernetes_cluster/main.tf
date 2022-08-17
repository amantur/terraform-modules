resource "azurerm_kubernetes_cluster" "default" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = var.dns_prefix

  private_cluster_enabled = var.private_cluster_enabled
  //api_server_authorized_ip_ranges = ["34.83.219.216/32"]

  node_resource_group = "${var.resource_group_name}-node"

  default_node_pool {
    name                = "agentpool"
    vm_size             = var.node_size
    os_disk_size_gb     = var.node_disk_size
    vnet_subnet_id      = var.kubernetes_subnet_id
    enable_auto_scaling = var.enable_autoscaling
    node_count          = var.node_count
    min_count           = var.min_node_count
    max_count           = var.max_node_count
    max_pods            = var.max_pod_count
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = var.kubernetes_network_plugin // [azure,kubenet]
    network_policy = var.kubernetes_network_policy
  }

  tags = var.tags
}
