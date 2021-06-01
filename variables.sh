#!/bin/bash

set -a 


# Project Configuration 
#****************************************************************************
SUBSCRIPTION_NAME="Sandbox$PROJECTNAME"
SUBSCRIPTION_DISPLAY_NAME="AMR.BPG.Sandbox.$PROJECTNAME"
GROUP_NAME="$PROJECTNAME Admins"
#****************************************************************************


set +a 

export DEMOVAR="My permanent variable"
echo "Demovar $DEMOVAR"
