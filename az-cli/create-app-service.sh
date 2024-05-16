#!/bin/bash
RG=pipeline-demo
NAME=Leo-pipeline-demo97
az group create -n $RG -l westus
az appservice plan create -g $RG -n MyPlan --sku s1 -l eastus
az webapp create -g $RG -p MyPlan -n $NAME
