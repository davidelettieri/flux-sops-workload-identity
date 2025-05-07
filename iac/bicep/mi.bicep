param location string

param aksIssuerURL string

resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2024-11-30' = {
  name: 'kustomize-controller-mi'
  location: location
}

resource federatedCredentials 'Microsoft.ManagedIdentity/userAssignedIdentities/federatedIdentityCredentials@2024-11-30' = {
  name: 'aks-fc'
  parent: managedIdentity
  properties: {
    audiences: [
      'api://AzureADTokenExchange'
    ]
    issuer: aksIssuerURL
    subject: 'system:serviceaccount:flux-system:kustomize-controller'
  }
}

output objectId string = managedIdentity.properties.principalId
