@description('VNet name')
param vnetName string = 'LL-Demo-vnet01'

@description('Address Prefix')
param vnetAddressPrefix string = '10.0.1.0/24'

@description('WebSubnet Prefix')
param websubnetprefix string = '10.0.1.0/26'

@description('Web Subnet Name')
param websubnetname string = 'WebSubnet01'

@description('Database Subnet Name')
param databasesubnetname string = 'DatabaseSubnet01'

@description('Database Subnet Prefix')
param databasesubnetprefix string = '10.0.1.64/26'

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
        name: websubnetname
        properties: {
          addressPrefix: websubnetprefix
        }
      }
      {
        name: databasesubnetname
        properties: {
          addressPrefix: databasesubnetprefix
        }
      }
    ]
  }
}
