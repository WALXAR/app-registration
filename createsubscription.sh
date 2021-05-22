#!/bin/bash 


az account list -o table
echo ''
echo "Checking if Subscription Alias already exist"
echo "az account alias show --name $SUBSCRIPTION_NAME --query 'properties.subscriptionId'"
existsubscription=$(az account alias show --name $SUBSCRIPTION_NAME --query 'properties.subscriptionId' -o tsv)
echo ''

if [ "$existsubscription" = '' ]
    then
        echo "Subscription Doesn't exist .. Creating new subscription ..................."
        echo "**********************************************************************************************"   
        echo "az account alias create --name "$SUBSCRIPTION_NAME" --billing-scope "$BILLING_ID" --display-name "$SUBSCRIPTION_DISPLAY_NAME" --workload "$WORKLOAD" --query 'properties.subscriptionId'"
        subscriptionId=$(az account alias create --name "$SUBSCRIPTION_NAME" --billing-scope "$BILLING_ID" --display-name "$SUBSCRIPTION_DISPLAY_NAME" --workload "$WORKLOAD" --query 'properties.subscriptionId' -o tsv)
       
        #TO DO Get the Subscription ID and store in environment variables
        if [ "$subscriptionId" != '' ] 
            then 
              echo "Subscription Created with id $subscriptionId ..............................."
              export SUBSCRIPTION_IDS=$subscriptionId
            else
              echo "Failed to created Subscription $SUBSCRIPTION_NAME ............................................."
              #exit 1
        fi
        echo "**********************************************************************************************"   
        
    else
        echo "Subscription $SUBSCRIPTION_NAME with id $existsubscription already exist"
        export SUBSCRIPTION_IDS=$existsubscription
        echo "**********************************************************************************************"   
        echo "**********************************************************************************************"   
fi

