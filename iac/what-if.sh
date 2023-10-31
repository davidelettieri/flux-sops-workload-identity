az deployment sub what-if \
    --name aks-flux-workload-identity \
    --template-file bicep/main.bicep \
    --location westeurope