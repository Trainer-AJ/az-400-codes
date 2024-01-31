az group create -n leo -l westus
# be in the directory where you have the app files
az webapp up -g "leo" -l eastus --html -n demo-0989 --sku F1
