param location string = 'westeurope'

targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'flux-workload-identity-post'
  location: location
}

module aks 'aks.bicep' = {
  name: 'aks-module'
  scope: rg
  params: {
    location: location
  }
}
