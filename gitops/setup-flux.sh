az aks get-credentials --resource-group flux-workload-identity-post --name my-aks

flux bootstrap github \
    --owner=davidelettieri \
    --repository=flux-sops-workload-identity \
    --branch=main \
    --path=./gitops/aks