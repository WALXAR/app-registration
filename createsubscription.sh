#!/bin/bash -x

while getopts "n:w:b:" flag
do
    case "${flag}" in
        n) name=${OPTARG};;
        w) workload=${OPTARG};;
        b) billing=${OPTARG};;
    esac
done
#Variables
PROJECT_NAME=$name
billing="/providers/Microsoft.Billing/billingAccounts/eb8747fc-e75e-5cXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

echo "Checking if subscription already exist"
#existsubscription= true && $(az account list --query '[0].{Name:name}')
existsubscription=true

if [ "$existsubscription" = true ]
    then
        echo "Checking Billing account for $PROJECT_NAME"
        ID=$(az billing account list --query '[0].{Id:id}' -o json)
        echo $ID

        echo "Creating new subscription ..................."
        subscriptionId= $(az account alias create --name "$name" --billing-scope "$billing" --display-name "$name" --workload "$workload" --query 'properties.subscriptionId')
        #TO DO Get the Subscription ID and store in environment variables
        [[ $subscriptionId -eq '' ]] && echo 'Subscription Created' || 'Failed to created'
        EXPORT SUBSCRIPTIONID=$subscriptionId
        exit 0
        
    else
        echo "Subscription $name already exist"
        exit 0
fi

