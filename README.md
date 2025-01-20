**[Implementing DevOps](https://spacelift.io/blog/devops-implementation)**
[Types of tests](python/test)

## Security
- Code scanning with GitHub Actions is not available for this repository.
`GitHub Actions is disabled on this repository because it is a fork. To use code scanning please enable it, or submit code scanning results externally using the API.`

- [Dependabot Alerts - Free for Github Public Repo](https://docs.github.com/en/code-security/dependabot/dependabot-alerts/about-dependabot-alerts)

**GitHub Advanced Security**: 
Public repo and private repo with adv security license have: 
- Code scanning			
- CodeQL CLI			
- Secret scanning			
- Custom auto-triage rules			
- Dependency review			
[GH docs](https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security)

## Monitor
[App Insights Python](https://learn.microsoft.com/en-us/azure/azure-monitor/app/opentelemetry-enable?tabs=python)

`YAML PIPELINE= $(system.defaultworkingdirectory) == Root of your Azure Repo`
- **IF bash script error => \r**:
```sh
sed -i 's/\r$//' Codes/rg/linux-cred-check.sh
```

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
## Below Install IIS on win-server
```ps1
powershell.exe Install-WindowsFeature -name Web-Server -IncludeManagementTools && powershell.exe remove-item 'C:\\inetpub\\wwwroot\\iisstart.htm' && powershell.exe Add-Content -Path 'C:\\inetpub\\wwwroot\\iisstart.htm' -Value $('Hello World from ' + $env:computername)
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


