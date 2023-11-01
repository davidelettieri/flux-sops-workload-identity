param location string

param aksIssuerURL string

resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'kustomize-controller-mi'
  location: location
}

resource federatedCredentials 'Microsoft.ManagedIdentity/userAssignedIdentities/federatedIdentityCredentials@2023-01-31' = {
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
