param location string = 'westeurope'

targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2025-03-01' = {
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

module managedIdentity 'mi.bicep' = {
  name: 'mi-module'
  scope: rg
  params: {
    location: location
    aksIssuerURL: aks.outputs.oidcIssuerURL
  }
}

module keyVault 'kv.bicep' = {
  name: 'kv-module'
  scope: rg
  params: {
    location: location
    managedIdentityObjectId: managedIdentity.outputs.objectId
  }
}
