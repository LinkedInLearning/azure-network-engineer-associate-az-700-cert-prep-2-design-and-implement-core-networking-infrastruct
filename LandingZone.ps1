$rg = @{
    Name = 'LL-Demo-RG'
    Location = 'EastUS2'
}
New-AzResourceGroup @rg

#Hub Virtual Network

$vnet01 = @{
    Name = 'lldemohubvnet'
    ResourceGroupName = 'LL-Demo-RG'
    Location = 'EastUS2'
    AddressPrefix = 10.0.0.0/24
}

$HubVirtualNetwork = New-AzVirtualNetwork @vnet01

$subnet01 = @{
    Name = 'GatewaySubnet'
    VirtualNetwork = $HubVirtualNetwork
    AddressPrefix = '10.0.0.0/26'
}
$subnetConfig01 = Add-AzVirtualNetworkSubnetConfig @subnet01

$HubVirtualNetwork | Set-AzVirtualNetwork

$subnet02 = @{
    Name = 'RouteServerSubnet'
    VirtualNetwork = $HubVirtualNetwork
    AddressPrefix = '10.0.0.64/26'
}
$subnetConfig02 = Add-AzVirtualNetworkSubnetConfig @subnet02

$HubVirtualNetwork | Set-AzVirtualNetwork

$subnet03 = @{
    Name = 'InboundSubnet'
    VirtualNetwork = $HubVirtualNetwork
    AddressPrefix = '10.0.0.128/28'
}
$subnetConfig03 = Add-AzVirtualNetworkSubnetConfig @subnet03

$HubVirtualNetwork | Set-AzVirtualNetwork

$subnet04 = @{
    Name = 'OutboundSubnet'
    VirtualNetwork = $HubVirtualNetwork
    AddressPrefix = '10.0.0.144/28'
}
$subnetConfig04 = Add-AzVirtualNetworkSubnetConfig @subnet04

$HubVirtualNetwork | Set-AzVirtualNetwork

#Spoke Virtual Network 1
$vnet02 = @{
    Name = 'lldemovnet01'
    ResourceGroupName = 'LL-Demo-RG'
    Location = 'EastUS2'
    AddressPrefix = '10.0.1.0/24'
}

$Spoke01VirtualNetwork = New-AzVirtualNetwork @vnet02

$subnet05 = @{
    Name = 'WebSubnet01'
    VirtualNetwork = $Spoke01VirtualNetwork
    AddressPrefix = '10.0.1.0/26'
}
$subnetConfig05 = Add-AzVirtualNetworkSubnetConfig @subnet05

$Spoke01VirtualNetwork | Set-AzVirtualNetwork

$subnet06 = @{
    Name = 'DatabaseSubnet01'
    VirtualNetwork = $Spoke01VirtualNetwork
    AddressPrefix = '10.0.1.64/26'
}
$subnetConfig06 = Add-AzVirtualNetworkSubnetConfig @subnet06

$Spoke01VirtualNetwork | Set-AzVirtualNetwork

#Spoke Virtual Network 2
$vnet03 = @{
    Name = 'lldemovnet02'
    ResourceGroupName = 'LL-Demo-RG'
    Location = 'EastUS2'
    AddressPrefix = '10.0.2.0/24'
}

$Spoke02VirtualNetwork = New-AzVirtualNetwork @vnet03

$subnet07 = @{
    Name = 'WebSubnet02'
    VirtualNetwork = $Spoke02VirtualNetwork
    AddressPrefix = '10.0.2.0/26'
}
$subnetConfig07 = Add-AzVirtualNetworkSubnetConfig @subnet07

$Spoke02VirtualNetwork | Set-AzVirtualNetwork

$subnet08 = @{
    Name = 'DatabaseSubnet02'
    VirtualNetwork = $Spoke02VirtualNetwork
    AddressPrefix = '10.0.2.64/26'
}
$subnetConfig08 = Add-AzVirtualNetworkSubnetConfig @subnet08

$Spoke02VirtualNetwork | Set-AzVirtualNetwork

#On Prem Virtual Network
$vnet04 = @{
    Name = 'lldemoonpremvnet'
    ResourceGroupName = 'LL-Demo-RG'
    Location = 'EastUS2'
    AddressPrefix = '192.168.0.0/24'
}

$onpremVirtualNetwork = New-AzVirtualNetwork @vnet04

$subnet09 = @{
    Name = 'onpremSubnet'
    VirtualNetwork = $onpremVirtualNetwork
    AddressPrefix = '192.168.0.0/26'
}
$subnetConfig09 = Add-AzVirtualNetworkSubnetConfig @subnet09

$onpremVirtualNetwork | Set-AzVirtualNetwork
