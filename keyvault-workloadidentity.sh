
export subscriptionID=
export resourceGroupName=
export UAMI=uami_csi
export KEYVAULT_NAME=
export clusterName=

az account set --subscription $subscriptionID
az identity create --name $UAMI --resource-group $resourceGroupName
export USER_ASSIGNED_CLIENT_ID="$(az identity show -g $resourceGroupName --name $UAMI --query 'clientId' -o tsv)"
export IDENTITY_TENANT=$(az aks show --name $clusterName --resource-group $resourceGroupName --query identity.tenantId -o tsv)
