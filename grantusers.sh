#!/bin/bash -x
while getopts "u:r:s:t:" flag
do
    case "${flag}" in
        u) users=(${OPTARG});; #Separeted username by blank space
        r) role=${OPTARG};;
        s) subscription=${OPTARG};;
        t) tenant=${OPTARG};;
    esac
done



echo "Checking if subscription already exist"
#existsubscription= true && $(az account list --query '[0].{Name:name}')
existsubscription=true


if [ "$existsubscription" = true ]
    then
        for usersfn in ${users[@]}; do    
          result= $(az role assignment create --role "$role" --assignee "$usersfn$tenant" --subscription "$subscription")
        done
    else
        echo "Subscription $name Doesn't exist"
fi