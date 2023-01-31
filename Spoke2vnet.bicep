@description('VNet name')
param vnetName string = 'LL-Demo-vnet02'

@description('Address Prefix')
param vnetAddressPrefix string = '10.0.2.0/24'

@description('WebSubnet Prefix')
param websubprefix string = '10.0.2.0/26'

@description('Web Subnet Name')
param websubname string = 'WebSubnet02'

@description('Database Subnet Name')
param dbsubnetname string = 'DatabaseSubnet02'

@description('Database Subnet Prefix')
param dbsubnetprefix string = '10.0.2.64/26'

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
        name: websubname
        properties: {
          addressPrefix: websubprefix
        }
      }
      {
        name: dbsubnetname
        properties: {
          addressPrefix: dbsubnetprefix
        }
      }
    ]
  }
}
