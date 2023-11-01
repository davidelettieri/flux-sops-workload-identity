az deployment sub create \
    --name aks-flux-workload-identity \
    --template-file bicep/main.bicep \
    --location westeurope