- [Original Demo - ms docs](https://learn.microsoft.com/en-us/azure/aks/cluster-container-registry-integration?tabs=azure-cli)
- [ACR Import](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-import-images?tabs=azure-cli)
```sh
 az acr import \
  --name testjb76 \
  --source docker.io/oj09/static-webpage:latest \
  --image imported:v1
```
