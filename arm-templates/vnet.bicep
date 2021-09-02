@description('VNet name')
param vnetName string

@description('Address prefix')
param vnetAddressPrefix string

@description('Subnet 1 Prefix')
param subnet1Prefix string

@description('Subnet 1 Name')
param subnet1Name string

@description('Subnet 2 Prefix')
param subnet2Prefix string

@description('Subnet 2 Name')
param subnet2Name string

@description('Subnet 3 Prefix')
param subnet3Prefix string

@description('Subnet 3 Name')
param subnet3Name string

@description('Subnet 4 Prefix')
param subnet4Prefix string

@description('Subnet 4 Name')
param subnet4Name string

@description('Subnet 5 Prefix')
param subnet5Prefix string

@description('Subnet 5 Name')
param subnet5Name string

@description('Subnet 6 Prefix')
param subnet6Prefix string

@description('Subnet 6 Name')
param subnet6Name string

@description('Location for all resources.')
param location string = resourceGroup().location

resource vnetName_resource 'Microsoft.Network/virtualNetworks@2020-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
  }
}

resource vnetName_subnet1Name 'Microsoft.Network/virtualNetworks/subnets@2020-05-01' = {
  parent: vnetName_resource
  location: location
  name: '${subnet1Name}'
  properties: {
    addressPrefix: subnet1Prefix
  }
}

resource vnetName_subnet2Name 'Microsoft.Network/virtualNetworks/subnets@2020-05-01' = {
  parent: vnetName_resource
  location: location
  name: '${subnet2Name}'
  properties: {
    addressPrefix: subnet2Prefix
  }
  dependsOn: [
    vnetName_subnet1Name
  ]
}

resource vnetName_subnet3Name 'Microsoft.Network/virtualNetworks/subnets@2020-05-01' = {
  parent: vnetName_resource
  location: location
  name: '${subnet3Name}'
  properties: {
    addressPrefix: subnet3Prefix
  }
  dependsOn: [
    vnetName_subnet2Name
  ]
}

resource vnetName_subnet4Name 'Microsoft.Network/virtualNetworks/subnets@2020-05-01' = {
  parent: vnetName_resource
  location: location
  name: '${subnet4Name}'
  properties: {
    addressPrefix: subnet4Prefix
  }
  dependsOn: [
    vnetName_subnet3Name
  ]
}

resource vnetName_subnet5Name 'Microsoft.Network/virtualNetworks/subnets@2020-05-01' = {
  parent: vnetName_resource
  location: location
  name: '${subnet5Name}'
  properties: {
    addressPrefix: subnet5Prefix
  }
  dependsOn: [
    vnetName_subnet4Name
  ]
}

resource vnetName_subnet6Name 'Microsoft.Network/virtualNetworks/subnets@2020-05-01' = {
  parent: vnetName_resource
  location: location
  name: '${subnet6Name}'
  properties: {
    addressPrefix: subnet6Prefix
  }
  dependsOn: [
    vnetName_subnet5Name
  ]
}