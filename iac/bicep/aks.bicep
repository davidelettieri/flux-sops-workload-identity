param location string

resource aks 'Microsoft.ContainerService/managedClusters@2023-08-01' = {
  name: 'my-aks'
  location: location
  properties: {
    kubernetesVersion: '1.26.6'
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
    servicePrincipalProfile: {
      clientId: 'msi'
    }
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
