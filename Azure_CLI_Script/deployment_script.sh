#!/bin/bash
proj_sub="Project-Sub"
resource_group_name="cloud-challenge-group"
location="germanywestcentral"
cosmos_account="cosmos-db-cloud-challenge2024"

#login to the azure account
az login

#set my project sub
az account set --name $proj_sub

#deploy a resource group
az group create \
    --name $resource_group_name \
    --location $location

#create a CosmosDB Account
az cosmosdb create \
    --name $cosmos_account \
    --resource-group $resource_group_name \
    --default-consistency-level Eventual \
    --locations isZoneRedundant
    --capabilities EnableServerless