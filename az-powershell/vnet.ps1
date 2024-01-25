# Set your variables
$resourceGroupName = "YourResourceGroupName"
$virtualNetworkName = "YourVirtualNetworkName"
$addressPrefix = "10.0.0.0/16"  # Replace with your desired address range
$subnetName = "YourSubnetName"
$subnetPrefix = "10.0.0.0/24"   # Replace with your desired subnet address range

# Create a new resource group
New-AzResourceGroup -Name $resourceGroupName -Location "YourAzureRegion"

# Create a virtual network with a subnet
$virtualNetwork = New-AzVirtualNetwork `
    -ResourceGroupName $resourceGroupName `
    -Name $virtualNetworkName `
    -AddressPrefix $addressPrefix `
    -Location "YourAzureRegion"

# Create a subnet within the virtual network
Add-AzVirtualNetworkSubnetConfig `
    -Name $subnetName `
    -AddressPrefix $subnetPrefix `
    -VirtualNetwork $virtualNetwork

# Set the subnet configuration for the virtual network
Set-AzVirtualNetwork -VirtualNetwork $virtualNetwork
