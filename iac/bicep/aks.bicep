param location string

resource aks 'Microsoft.ContainerService/managedClusters@2025-02-01' = {
  name: 'my-aks'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  sku: {
    name: 'Base'
    tier: 'Free'
  }
  properties: {
    kubernetesVersion: '1.32'
    agentPoolProfiles: [
      {
        name: 'system'
        mode: 'System'
        vmSize: 'Standard_B2ms'
        count: 1
        enableAutoScaling: false
        osType: 'Linux'
        osSKU: 'AzureLinux'
      }
    ]
    dnsPrefix: 'my-aks-dns'
    oidcIssuerProfile: {
      enabled: true
    }
    securityProfile: {
      workloadIdentity: {
        enabled: true
      }
    }
    networkProfile: {
      loadBalancerSku: 'basic'
    }
  }
}

output oidcIssuerURL string = aks.properties.oidcIssuerProfile.issuerURL
