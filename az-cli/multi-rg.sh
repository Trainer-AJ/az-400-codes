# below is a Bash script that takes a list of Azure regions and the number of resource groups to be created.
# It distributes the resource groups evenly among the provided regions:

#!/bin/bash

# Function to create a resource group in a given region
create_resource_group() {
    local resource_group_name=$1
    local region=$2

    az group create --name $resource_group_name --location $region
}

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "Azure CLI is not installed. Please install it before running this script."
    exit 1
fi


# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <number_of_resource_groups> <region1> [<region2> ...]"
    exit 1
fi

# Parse command line arguments
number_of_resource_groups=$1
shift

# Calculate the number of regions provided
number_of_regions=$#
regions=("$@")

# Check if the number of resource groups is greater than or equal to the number of regions
if [ "$number_of_resource_groups" -lt "$number_of_regions" ]; then
    echo "Error: Number of resource groups should be greater than or equal to the number of regions."
    exit 1
fi

# Calculate the number of resource groups per region
resource_groups_per_region=$((number_of_resource_groups / number_of_regions))

# Loop through the regions and create resource groups
for region in "${regions[@]}"; do
    for ((i = 1; i <= resource_groups_per_region; i++)); do
        resource_group_name="RG_${region}_${i}"
        create_resource_group $resource_group_name $region
        echo "Resource Group created: $resource_group_name in $region"
    done
done

echo "Script completed successfully."
