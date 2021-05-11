#!/bin/bash 

SUBSCRIPTIONID="ff14d8b2-4d78-4128-a4a2-192b1b37d9d8"
PROJECTNAME="magicadds8"
TENANTDOMAIN="@walterxavierbtoutlook.onmicrosoft.com"

echo "Login Azure using credentials ..........."
#az login --service-principal --username APP_ID --password PASSWORD --tenant TENANT_ID

echo "Creating New Subscription..........."
#sh ./createsubscription.sh -n "subscriptionaliasname" -w "workload(production, devtest, workload)" -b "billingid"

echo "Creating New Service Ppal"
#sh ./createsp.sh -s "$SUBSCRIPTIONID" -n "$PROJECTNAME"

echo "Assign Role to ussers in new Subscription"
sh ./grantusers.sh -u "walxar" -r "Owner" -s "ff14d8b2-4d78-4128-a4a2-192b1b37d9d8" -t "$TENANTDOMAIN"


