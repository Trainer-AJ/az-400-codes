from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

# Replace with your Key Vault name
KEY_VAULT_NAME = "your-key-vault-name"
KV_URI = f"https://{KEY_VAULT_NAME}.vault.azure.net/"

# Authenticate to Azure Key Vault
credential = DefaultAzureCredential()
client = SecretClient(vault_url=KV_URI, credential=credential)

def get_secret(secret_name):
    """
    Fetch a secret from Azure Key Vault by name.
    """
    return client.get_secret(secret_name).value
