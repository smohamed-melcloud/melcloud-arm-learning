param location string
param extendedLocation object
param virtualNetworkName string
param resourceGroup string
param addressSpaces array
param ipv6Enabled bool
param subnetCount int
param subnet0_name string
param subnet0_addressRange string
param ddosProtectionPlanEnabled bool
param firewallEnabled bool
param bastionEnabled bool

resource virtualNetworkName_resource 'Microsoft.Network/VirtualNetworks@2021-01-01' = {
  name: virtualNetworkName
  location: location
  extendedLocation: (empty(extendedLocation) ? json('null') : extendedLocation)
  tags: {}
  properties: {
    addressSpace: {
      addressPrefixes: [
        '172.20.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'web'
        properties: {
          addressPrefix: '172.20.1.0/24'
        }
      }
    ]
    enableDdosProtection: ddosProtectionPlanEnabled
  }
  dependsOn: []
}