#!/bin/bash 

force=1  #force individual rol for users

az account list -o table
echo ''
echo "Checking if Subscription Alias already exist"
existsubscription=$(az account alias show --name $SUBSCRIPTION_NAME --query 'properties.subscriptionId' -o tsv)
echo "Subscription Id $existsubscription"
echo ''

if [ "$existsubscription" != '' ]
then
    echo "Check if Management Group for the project exist"
    echo "**********************************************************************************************"
    groupExist=$(az ad group show --group "$GROUP_NAME" --query 'objectId' -o tsv)     
    if [ "$groupExist" = '' ]
    then 
        echo "Create Management Group $GROUP_NAME for the project"
        echo "**********************************************************************************************"
        az ad group create --display-name "$GROUP_NAME" --mail-nickname "$PROJECTNAME" --query 'objectId' -o tsv
        sleep 60
        groupId=$(az ad group show --group "$GROUP_NAME" --query 'objectId' -o tsv)     
        if [ "$groupId" != '' ] 
            then
                echo "Assing Roles to Management Group for the project"
                echo "Group id $groupId"
                echo "**********************************************************************************************"   
                echo "az role assignment create --assignee-object-id $groupId --role $ROLE_NAME --subscription $SUBSCRIPTION_IDS"
                az role assignment create --assignee-object-id "$groupId" --role "$ROLE_NAME" --subscription "$SUBSCRIPTION_IDS"
            else
                echo "An Error Occurred Adding Role $ROLE_NAME to Group $GROUP_NAME"
                echo "**********************************************************************************************"   
            fi
    else
        groupId=$groupExist
        echo "Group $GROUP_NAME Alread Exist with id $groupId "
        az role assignment create --assignee-object-id "$groupId" --role "$ROLE_NAME" --subscription "$SUBSCRIPTION_IDS"
        echo "**********************************************************************************************"   
    fi


    echo "Adding Users to group $GROUP_NAME"
    echo "**********************************************************************************************"  
        for usersfn in $USERS; do    
            echo "Getting object id of user $usersfn$TENANTDOMAIN"
            echo "**********************************************************************************************"  
            memberObjectID=$(az ad user show --id "$usersfn$TENANTDOMAIN" --query 'objectId' -o tsv)
            echo "object id $memberObjectID"
            if [ "$memberObjectID" != '' ] 
                then
                az ad group member add --group "$groupId" --member-id "$memberObjectID"
                echo "User $usersfn$TENANTDOMAIN added to group $GROUP_NAME"
                echo "**********************************************************************************************"  
                else
                echo "User $usersfn$TENANTDOMAIN doesn't exist"
                echo "**********************************************************************************************"  
            fi
        done   
            
            
                        
    if [ $force ] 
        then
            echo "Granting Roles to specified Users"
            echo "**********************************************************************************************"
            if [ "$existsubscription" != '' ]
                then
                    for usersfn in $USERS; do    
                    echo "Granting role $ROLE_NAME to user $usersfn$TENANTDOMAIN"
                    echo "**********************************************************************************************"  
                    (az role assignment create --role "$ROLE_NAME" --assignee "$usersfn$TENANTDOMAIN" --subscription "$SUBSCRIPTION_IDS")
                    
                    done
                else
                    echo "Subscription $SUBSCRIPTION_NAME Doesn't exist"
                    echo "**********************************************************************************************"   
            fi
    fi

else
    echo "Subscription $SUBSCRIPTION_NAME Doesn't exist"
    echo "**********************************************************************************************"
fi