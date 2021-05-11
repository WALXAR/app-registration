#!/bin/bash -x
while getopts "u:r:s:t:g:" flag
do
    case "${flag}" in
        u) users=(${OPTARG});; #Separeted username by blank space
        r) role=${OPTARG};;
        s) subscription=${OPTARG};;
        t) tenant=${OPTARG};;
        g) group=${OPTARG};;
    esac
done



echo "Checking if subscription already exist"
#existsubscription= true && $(az account list --query '[0].{Name:name}')
existsubscription=true

echo "Create Management Group for the project"

    az ad group create --display-name "DEMOGROUP" --mail-nickname "DEMOGROUP"
    #todo GET THE ID OF THE GROUP
    az role assignment create --role "$role" --assignee "9a7e39ad-490b-451f-8701-b7b3ba266d18" --subscription "$subscription"


if [ "$existsubscription" = true ]
    then
        for usersfn in ${users[@]}; do    
          (az role assignment create --role "$role" --assignee "$usersfn$tenant" --subscription "$subscription")
        done
    else
        echo "Subscription $name Doesn't exist"
fi