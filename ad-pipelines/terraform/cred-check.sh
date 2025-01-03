#!/bin/bash

# Flag to track if any variable is missing
missing=false

# Check if ARM_CLIENT_ID is set
if [ -z "$ARM_CLIENT_ID" ]; then
    echo "ERROR: ARM_CLIENT_ID is not set or is empty." 
    missing=true
else
    echo "ARM_CLIENT_ID is set."
fi

# Check if ARM_CLIENT_SECRET is set
if [ -z "$ARM_CLIENT_SECRET" ]; then
    echo "ERROR: ARM_CLIENT_SECRET is not set or is empty." 
    missing=true
else
    echo "ARM_CLIENT_SECRET is set."
fi

# Check if ARM_TENANT_ID is set
if [ -z "$ARM_TENANT_ID" ]; then
    echo "ERROR: ARM_TENANT_ID is not set or is empty." 
    missing=true
else
    echo "ARM_TENANT_ID is set."
fi

# Check if ARM_SUBSCRIPTION_ID is set
if [ -z "$ARM_SUBSCRIPTION_ID" ]; then
    echo "ERROR: ARM_SUBSCRIPTION_ID is not set or is empty." 
    missing=true
else
    echo "ARM_SUBSCRIPTION_ID is set."
fi

# If any variable is missing, raise an error and exit with non-zero status
if [ "$missing" = true ]; then
    echo "******* ERROR !!!! **************"
    echo "One or more environment variables are missing. Exiting..."
    exit 1
fi
