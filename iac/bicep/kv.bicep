param location string

param managedIdentityObjectId string

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: 'my-kv-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: tenant().tenantId
    accessPolicies: [
      {
        objectId: managedIdentityObjectId
        tenantId: tenant().tenantId
        permissions: {
          keys: [
            'get'
            'decrypt'
          ]
        }
      }
    ]
  }
}

resource key 'Microsoft.KeyVault/vaults/keys@2023-02-01' = {
  name: 'encryption-key'
  parent: keyVault
  properties: {
    attributes: {
      enabled: true
      exportable: false
    }
    kty: 'RSA'
    keySize: 2048
  }
}
