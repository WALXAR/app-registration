#!/bin/bash 



echo "Login Azure using credentials ..........."
az login --service-principal --username $APP_ID --password $PASSWORD --tenant $TENANT_ID
az account set --subscription $SUBSCRIPTION_ID