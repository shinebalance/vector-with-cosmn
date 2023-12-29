serverGroupName = "cosmon-vector"
location = "southeastasia"
serverGroupTags = {
  objective = "ベクトル検索"
}
administratorLogin = "cosmonadmin"
administratorLoginPassword = null  # パスワードが null の場合、別途設定が必要になる場合があります
serverVersion = "6.0"
nodeCount = 1
sku = "Free"
diskSizeGB = 32
enableHa = false
firewallRules = [
  {
    name = ルール名"
    startIPAddress = ""
    endIPAddress = ""
  },
  {
    name = "AllowAllAzureServicesAndResourcesWithinAzureIps_2023-12-29_11-2-10"
    startIPAddress = "0.0.0.0"
    endIPAddress = "0.0.0.0"
  }
]
