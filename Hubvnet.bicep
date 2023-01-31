@description('VNet name')
param vnetName string = 'LL-Demo-Hubvnet'

@description('Address Prefix')
param vnetAddressPrefix string = '10.0.0.0/24'

@description('GatewaySubnet Prefix')
param gatewaysubnetprefix string = '10.0.0.0/26'

@description('GatewaySubnet Name')
param gatewaysubnetname string = 'GatewaySubnet'

@description('RouteServerSubnet Name')
param routeserversubnetname string = 'RouteServerSubnet'

@description('RouteServerSubnet Prefix')
param routeserversubnetprefix string = '10.0.0.64/26'

@description('Inbound Subnet Name')
param inboundsubnetname string = 'InboundSubnet'

@description('Inbound Subnet Prefix')
param inboundprefix string = '10.0.0.128/28'

@description('Outbound Subnet Name')
param ouboundsubnetname string = 'OutboundSubnet'

@description('Outbound Subnet Prefix')
param outboundprefix string = '10.0.0.144/28'

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
        name: gatewaysubnetname
        properties: {
          addressPrefix: gatewaysubnetprefix
        }
      }
      {
        name: routeserversubnetname
        properties: {
          addressPrefix: routeserversubnetprefix
        }
      }
      {  
        name:inboundsubnetname
        properties: {
          addressPrefix: inboundprefix
          delegations: [
            {
              name: inboundsubnetname
              properties: {
                serviceName: 'Microsoft.Network/dnsResolvers'
              }
            }
          ]     
        }
      }
      {
        name: ouboundsubnetname
        properties: {
          addressPrefix:outboundprefix
          delegations: [
            {
              name: ouboundsubnetname
              properties: {
                serviceName: 'Microsoft.Network/dnsResolvers'
              }
            }
          ]
        }
      }
    ]
  }
}
