[Types of tests](python/test)

```sh
# Bash script
ID=
az ad sp create-for-rbac --name AzureDevOpsPipeline --role contributor --scopes /subscriptions/$ID
```
## CLI 
> All Codes tested 
```sh
az group list -o tsv --query '[?!(starts_with(name, `Visual`))].name' | xargs -otl az group delete --no-wait --yes -n
```
others:
```sh
az group list -o tsv --query '[?!(starts_with(name, `Visual`))].name'

az group list -o tsv --query "[?starts_with(name, 'Visual') == \`false\`].name"

az group list -o tsv --query "[?contains(name,'Visual')].name"
```

# App Service
- By default, App Service assumes that a Flask app's main module is application.py or app.py. If your main module uses a different name, then you must customize the startup command. )
[ For example, if you have a Flask app whose main module is hello.py and the Flask app object in that file is named myapp, then the command is as follows- ](https://learn.microsoft.com/en-us/azure/app-service/configure-language-python)

`gunicorn --bind=0.0.0.0 --timeout 600 hello:myapp`
- CLI (Tested) -
```sh
az webapp create -g MyResourceGroup -p MyPlan -n MyUniqueAppName --runtime "PYTHON:3.12"
az webapp list-runtimes
```


