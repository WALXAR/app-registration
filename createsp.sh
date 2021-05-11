#!/bin/bash -x
while getopts "s:n:" flag
do
    case "${flag}" in
        s) subscription=${OPTARG};;
        n) name=${OPTARG};;
    esac
done


echo "Checking if subscription already exist"
#existsubscription= true && $(az account list --query '[0].{Name:name}')
#az account alias list
existsubscription=true

if [ "$existsubscription" = true ]
    then
        echo "Checkint if Service Ppal already exist ................"
        exist=$(az ad sp list --filter "displayname eq '$name'" -o table)
        if [ "$exist" = '' ]
            then
                echo "Service Ppal Doesnt Exist, Creating Service Principal $name with contributor role ..........."
                SP=$(az ad sp create-for-rbac -n "$name" --role "Contributor" --scopes "//subscriptions//$subscription" --query '[appId,password]' -o json) #root of the subscription
                echo $SP
            else       
                echo "Service Ppal Already Created"
        fi
    else
        echo "Subscription $name Doesn't exist"
fi