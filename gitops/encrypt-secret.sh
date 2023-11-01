cd gitops/aks/apps
sops -e -i --encrypted-regex '^(data|stringData)$' --azure-kv https://my-kv-55qgmoueto4pc.vault.azure.net/keys/encryption-key/105c8824fd2343c4a94fed4021cdd67c secret.yaml
cd ../..