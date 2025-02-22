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
# Monitoring 
To decide which metric, log, or trace to monitor for a given resource type, you need to consider the purpose of monitoring, the type of resource, and the operational context. Below are pointers and industry standards for monitoring effectively:

---

## **Key Principles for Monitoring**

1. **Understand the Three Pillars of Observability**:
   - **Metrics**: Provide numerical data over time (e.g., CPU usage, memory utilization). Best for alerting and trend analysis.
   - **Logs**: Contain detailed event records. Useful for debugging and understanding specific incidents.
   - **Traces**: Show the journey of a request across systems. Essential for diagnosing latency issues in distributed systems[3][4][8].

2. **Correlate Metrics, Logs, and Traces**:
   - Use timestamps and consistent tagging/naming conventions to link data from these three sources.
   - Integrated tools (e.g., Datadog, New Relic) help unify these data types for better insights[3][4].

3. **Define Monitoring Goals**:
   - Performance optimization
   - Fault detection
   - Capacity planning
   - Security monitoring

---

## **Monitoring CPU: Example Resource**

### Common Metrics:
- **CPU Usage (%):** Percentage of time the CPU is actively processing tasks. High usage may indicate bottlenecks or heavy workloads[6][7].
- **User Time vs. Kernel Time:** Tracks time spent on user-level processes vs. system-level operations. Helps identify whether applications or system processes are consuming resources[6][7].
- **Idle Time:** Indicates unused CPU capacity. High idle time may suggest underutilization[6].
- **I/O Wait Time:** Measures time spent waiting for I/O operations to complete. High values indicate potential disk or network bottlenecks[6].
- **Interrupt Time:** Tracks time spent handling hardware interrupts[6].

### Logs:
- Use logs to capture events like process crashes, high CPU spikes, or application errors.
- Include trace IDs in logs to correlate them with metrics and traces[4].

### Traces:
- Use traces to identify which specific requests or transactions are causing high CPU usage.
- Distributed tracing tools like Jaeger or Zipkin can highlight latency issues in microservices architectures[3][4].

---

## **General Monitoring Guidelines**

### When to Monitor Metrics:
- For **real-time performance tracking**, such as CPU usage or memory utilization.
- To set up alerts for threshold breaches (e.g., CPU usage > 80%)[5][9].
- For long-term trend analysis to predict capacity needs.

### When to Use Logs:
- For detailed debugging after an issue occurs.
- To investigate anomalies flagged by metrics (e.g., high error rates).
- To maintain an audit trail for compliance.

### When to Use Traces:
- For diagnosing performance bottlenecks in distributed systems.
- To understand dependencies between services and pinpoint latency issues.

---

## **Best Practices**

1. **Prioritize Critical Metrics**:
   - Focus on metrics that directly impact performance or user experience (e.g., response times, error rates)[3][5].
   
2. **Set Thresholds and Alerts**:
   - Define thresholds based on historical data (e.g., CPU usage > 90% triggers an alert)[9].

3. **Use Adaptive Thresholds**:
   - Employ AI-based tools to detect anomalies dynamically instead of relying solely on static thresholds[9].

4. **Integrate Tools**:
   - Use platforms like Datadog or Dynatrace to unify metrics, logs, and traces into a single dashboard for better observability[3][8].

5. **Correlate Across Data Types**:
   - Align timestamps across metrics, logs, and traces for effective root cause analysis[4].

---
Answer from Perplexity: pplx.ai/share
# App Service
- By default, App Service assumes that a Flask app's main module is application.py or app.py. If your main module uses a different name, then you must customize the startup command. )
[ For example, if you have a Flask app whose main module is hello.py and the Flask app object in that file is named myapp, then the command is as follows- ](https://learn.microsoft.com/en-us/azure/app-service/configure-language-python)

`gunicorn --bind=0.0.0.0 --timeout 600 hello:myapp`
- CLI (Tested) -
```sh
az webapp create -g MyResourceGroup -p MyPlan -n MyUniqueAppName --runtime "PYTHON:3.12"
az webapp list-runtimes
```


