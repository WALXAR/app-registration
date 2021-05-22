#!/bin/bash 


echo "Logout Azure"
az logout

# Initialization instructions
echo "Login Azure..."
echo "*********************************************************************************************"
az login --service-principal --username $APP_ID --password $PASSWORD --tenant $TENANT_ID
#az account set --subscription $SUBSCRIPTION_ID
echo "*********************************************************************************************"