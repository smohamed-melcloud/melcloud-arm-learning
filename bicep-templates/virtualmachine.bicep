param adminUsername string = 'sharam'
param adminPassword string 
param location string = resourceGroup().location
param OSVersion string = '2019-Datacenter'
param vmSize string = 'Standard_D2_v3'
param vmName string = 'simple-vm'
module storage 'storage.bicep' = { 
  
  name: 'storage'
  scope: resourceGroup()
  params: {
  name : 'melcloudstg001'
 }
}
module VN 'virtualnetwork.bicep' = {
  name: 'VN'
  scope: resourceGroup()
  params: {
    name : 'virtualNetworkName'
 }
}

resource vm 'Microsoft.Compute/virtualMachines@2021-03-01' = {
   name: vmName
   location: location
   properties: {    
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: OSVersion
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
        }
      }
      dataDisks: [
        {
          diskSizeGB: 1023
          lun: 0
          createOption: 'Empty'
        }
      ]
    }    
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: stg.properties.primaryEndpoints.blob
      }
    }
  }
}  

output hostname string = pip.properties.dnsSettings.fqdn
