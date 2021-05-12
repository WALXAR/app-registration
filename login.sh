#!/bin/bash 

APP_ID="f825f6dd-b211-46b0-aaf6-5d9474ad099a"
PASSWORD="8iPidAY189GktzxiAuQVnX-6BZpOTNkhsG"
TENANT_ID="fedc3089-4e9e-4945-924f-70be916da72b"
SUBSCRIPTION_ID="ff14d8b2-4d78-4128-a4a2-192b1b37d9d8"

echo "Login Azure using credentials ..........."
az login --service-principal --username $APP_ID --password $PASSWORD --tenant $TENANT_ID
az account set --subscription $SUBSCRIPTION_ID