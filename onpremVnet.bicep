@description('VNet name')
param vnetName string = 'LL-Demo-onpremvnet'

@description('Address Prefix')
param vnetAddressPrefix string = '192.168.0.0/24'

@description('OnPremSubnet Prefix')
param onpremsubprefix string = '192.168.0.0/26'

@description('OnPrem Subnet Name')
param onpremsubname string = 'OnPremSubnet'

@description('Location for all resources.')
param location string = resourceGroup().location

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: onpremsubname
        properties: {
          addressPrefix: onpremsubprefix
        }
      }
    ]
  }
}
