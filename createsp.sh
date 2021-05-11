#!/bin/bash -x
while getopts "s:n:" flag
do
    case "${flag}" in
        s) subscription=${OPTARG};;
        n) name=${OPTARG};;
    esac
done

subscription="/subscriptions/{SubID}/resourceGroups/{ResourceGroup1} /subscriptions/{SubID}/resourceGroups/{ResourceGroup2}" #blank space for a list of subscriptions

echo "Checking if subscription already exist"
#existsubscription= true && $(az account list --query '[0].{Name:name}')
existsubscription=true

if [ "$existsubscription" = true ]
    then
        echo "Checkint if Service Ppal already exist ................"
        exist=$(az ad sp list --filter "displayname eq '$name'")
        if [ $exist ]
            then
                echo "Service Ppal Already Created"
            else       
                echo "Creating Service Principal $name with contributor role ..........."
                ID=$(az ad sp create-for-rbac --name $name --query '[appId,password]' -o json)
                az ad sp create-for-rbac -n "$name" --role Contributor --scopes "/subscriptions/$subscription"  #root of the subscription
                echo $ID
        fi
    else
        echo "Subscription $name Doesn't exist"
fi