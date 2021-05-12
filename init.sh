#!/bin/bash 

echo "loading variables .........................."
source ./variables.sh

source ./login.sh

echo "Creating New Subscription..........."
#source ./createsubscription.sh -n "subscriptionaliasname" -w "workload(production, devtest, workload)" -b "billingid"

echo "Creating New Service Ppal"
#source ./createsp.sh -s "$SUBSCRIPTION_ID" -n "$PROJECTNAME"

echo "Assign Role to ussers in new Subscription"
source ./grantusers.sh -u "walxar" -r "Owner" -s "ff14d8b2-4d78-4128-a4a2-192b1b37d9d8" -t "$TENANTDOMAIN"


