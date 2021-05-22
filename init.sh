#!/bin/bash 

echo "0. loading variables ........................................."
echo ""
source ./input_variables.sh
source ./variables.sh
echo ""

source ./login.sh

echo "1. Creating New Subscription.................................."
source ./createsubscription.sh 
echo ""
echo ""

#Necesary to refresh Subscriptions
source ./login.sh 

echo "2. Creating New Service Ppal.................................."
source ./createsp.sh 
echo ""
echo ""

echo "3. Assign Role to users in new Subscription .................."
source ./grantusers.sh
echo ""
echo ""

source ./logout.sh




