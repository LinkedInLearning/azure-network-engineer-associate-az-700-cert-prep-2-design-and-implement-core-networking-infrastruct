$rg = @{
    Name = 'LL-Demo-RG'
    Location = 'EastUS2'
}
New-AzResourceGroup @rg
$vnet = @{
    Name = 'LL-Demo-Vnet01'
    ResourceGroupName = 'LL-Demo-RG'
    Location = 'EastUS2'
    AddressPrefix = '10.0.0.0/16'    
}
$virtualNetwork = New-AzVirtualNetwork @vnet
$subnet = @{
    Name = 'RouteServerSubnet'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '10.0.0.0/24'
}
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet

$virtualnetwork | Set-AzVirtualNetwork

$vnetInfo = Get-AzVirtualNetwork -Name LL-Demo-Vnet01
$subnetId = (Get-AzVirtualNetworkSubnetConfig -Name RouteServerSubnet -VirtualNetwork $vnetInfo).Id

$ip = @{
    Name = 'LLDemoRSPIP01'
    ResourceGroupName = 'LL-Demo-RG'
    Location = 'EastUS2'
    AllocationMethod = 'Static'
    IpAddressVersion = 'Ipv4'
    Sku = 'Standard'
}
$publicIp = New-AzPublicIpAddress @ip

$rs = @{
    RouteServerName = 'LLDemoRouteServer01'
    ResourceGroupName = 'LL-Demo-RG'
    Location = 'EastUS2'
    HostedSubnet = $subnetId
    PublicIP = $publicIp
}
New-AzRouteServer @rs

$peer = @{
    PeerName = 'LLDemoNVA"
    PeerIp = '192.168.0.1'
    PeerAsn = '65501'
    RouteServerName = 'LLDemoRouteServer01'
    ResourceGroupName = LL-Demo-RG'
}
Add-AzRouteServerPeer @peer

$routeserver = @{
    RouteServerName = 'LLDemoRouteServer01'
    ResourceGroupName = 'LL-Demo-RG'
} 
Get-AzRouteServer @routeserver

$routeserver = @{
    RouteServerName = 'LLDemoRouteServer01'
    ResourceGroupName = 'LL-Demo-RG'
    AllowBranchToBranchTraffic
}  
Update-AzRouteServer @routeserver