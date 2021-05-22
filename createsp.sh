#!/bin/bash 



echo "subscriptions $SUBSCRIPTION_IDS"
echo "name $PROJECTNAME"

az account list -o table
echo ''
echo "Checking if Subscription Alias already exist"
existsubscription=$(az account alias show --name $SUBSCRIPTION_NAME --query 'properties.subscriptionId')
echo ''


if [ "$existsubscription" != '' ]
    then
        echo "The Subscription ID $existsubscription"
        echo "Checking if Service Ppal already exist ................"
        echo "**********************************************************************************************"
        exist=$(az ad sp list --filter "displayname eq '$PROJECTNAME'" -o tsv)
        if [ "$exist" = '' ]
            then
                echo "Service Ppal Doesn't Exist, Creating Service Principal $PROJECTNAME with contributor role ..........."
                echo "**********************************************************************************************"
                SP=$(az ad sp create-for-rbac -n "$PROJECTNAME" --role "Contributor" --scopes "//subscriptions//$SUBSCRIPTION_IDS" --query '[appId,password]' -o json)
                echo $SP
                echo "**********************************************************************************************"
            else       
                echo "Service Ppal $PROJECTNAME Already Created"
                echo "**********************************************************************************************"
        fi
    else
        echo "Subscription $SUBSCRIPTION_NAME Doesn't exist"
        echo "**********************************************************************************************"
fi