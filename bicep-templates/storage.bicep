param location string
param storageAccountName string
resource storage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  sku:{
    name:'Standard_LRS'
  }
  kind:'StorageV2'
  location: location

}
