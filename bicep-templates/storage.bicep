param location string = resourceGroup().location
param name string
resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: name
  sku:{
    name:'Standard_LRS'
  }
  kind:'StorageV2'
  location: location

}


resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2020-08-01-preview' = {
  name:'${stg.name}/default/images'
}


output storageId  string = stg.id
