provider "azurerm" {
  features {}
}

variable "serverGroupName" {
  type = string
}

variable "location" {
  type = string
}

variable "serverGroupTags" {
  type = map(string)
}

variable "administratorLogin" {
  type = string
}

variable "administratorLoginPassword" {
  type = string
}

variable "serverVersion" {
  type = string
}

variable "nodeCount" {
  type = number
}

variable "sku" {
  type = string
}

variable "diskSizeGB" {
  type = number
}

variable "enableHa" {
  type = bool
}

variable "firewallRules" {
  type = list(object({
    name           = string
    startIPAddress = string
    endIPAddress   = string
  }))
}

resource "azurerm_mongo_cluster" "example" {
  name                     = var.serverGroupName
  location                 = var.location
  tags                     = var.serverGroupTags
  administrator_login      = var.administratorLogin
  administrator_login_password = var.administratorLoginPassword
  server_version           = var.serverVersion
  node_group_specs {
    kind          = "Shard"
    node_count    = var.nodeCount
    sku           = var.sku
    disk_size_gb  = var.diskSizeGB
    enable_ha     = var.enableHa
  }
}

resource "azurerm_mongo_cluster_firewall_rule" "example" {
  count                    = length(var.firewallRules)
  name                     = var.firewallRules[count.index].name
  mongo_cluster_id         = azurerm_mongo_cluster.example.id
  start_ip_address         = var.firewallRules[count.index].startIPAddress
  end_ip_address           = var.firewallRules[count.index].endIPAddress
}
