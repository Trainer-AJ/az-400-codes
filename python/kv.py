import os
from azure.keyvault.secrets import SecretClient
from azure.identity import DefaultAzureCredential

keyVaultName = "python-myslq"  # Make sure the name is correct
KVUri = f"https://{keyVaultName}.vault.azure.net"

secretName = ["user", "pswd"]

# Initialize SecretClient
credential = DefaultAzureCredential()
client = SecretClient(vault_url=KVUri, credential=credential)

def get_secret(secret_name):
    print(f"Retrieving your secret from {keyVaultName}.")

    # Fetch the secret value
    retrieved_secret = client.get_secret(secret_name)

    print(f"    Value of '{secret_name}' secret is '{retrieved_secret.value}'.")

    return retrieved_secret

def main():
    for name in secretName:
        get_secret(name)

if __name__ == '__main__':
    main()
