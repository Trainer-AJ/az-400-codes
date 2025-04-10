import os
from azure.identity import ClientSecretCredential
from azure.keyvault.secrets import SecretClient

# Azure App Registration details
tenant_id = os.getenv("AZURE_TENANT_ID")       
client_id = os.getenv("AZURE_CLIENT_ID")       
client_secret = os.getenv("AZURE_CLIENT_SECRET")

# Key Vault details
keyVaultName = "secrets-keeper-007"
KVUri = f"https://{keyVaultName}.vault.azure.net"

# Secret names to retrieve
secret_names = ["host", "user", "password"]

# Authenticate using App Registration
credential = ClientSecretCredential(
    tenant_id=tenant_id,
    client_id=client_id,
    client_secret=client_secret
)

# Create SecretClient
client = SecretClient(vault_url=KVUri, credential=credential)

def get_secret(secret_name):
    print(f"Retrieving secret '{secret_name}' from {keyVaultName}...")
    retrieved_secret = client.get_secret(secret_name)
    print(f"    ➤ Value of '{secret_name}': {retrieved_secret.value}")
    return retrieved_secret

def main():
    for name in secret_names:
        get_secret(name)

if __name__ == "__main__":
    main()
