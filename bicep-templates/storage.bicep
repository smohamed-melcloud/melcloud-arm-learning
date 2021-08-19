param location string
resource storage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'teststorage1234'
  sku:{
    name:'Standard_LRS'
  }
  kind:'StorageV2'
  location: location

}
