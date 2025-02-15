import os
import base64
import hashlib
import smtplib
from email.mime.text import MIMEText
import boto3
from azure.identity import DefaultAzureCredential
from azure.storage.blob import BlobServiceClient

# Hardcoded API Keys for AWS and Azure
AWS_ACCESS_KEY_ID = "AKIAIOSFODNN7EXAMPLE"  # AWS Access Key ID
AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"  # AWS Secret Access Key

AZURE_STORAGE_ACCOUNT_NAME = "mystorageaccount"  # Azure Storage Account Name
AZURE_STORAGE_ACCOUNT_KEY = "mysecretkey==example"  # Azure Storage Account Key

# Hardcoded secret for a third-party API
API_KEY = "sk_test_4eC39HqLyjWDarjtT1zdp7dc"  # Hardcoded secret key (API key)

# Unsafely exposing sensitive information
print("Sending API keys and credentials to the console...")
print(f"AWS Access Key ID: {AWS_ACCESS_KEY_ID}")
print(f"AWS Secret Access Key: {AWS_SECRET_ACCESS_KEY}")
print(f"Azure Storage Account Name: {AZURE_STORAGE_ACCOUNT_NAME}")
print(f"Azure Storage Account Key: {AZURE_STORAGE_ACCOUNT_KEY}")
print(f"API Key: {API_KEY}")

# Weak hash function - MD5
password = "password123"
hashed_password = hashlib.md5(password.encode()).hexdigest()
print(f"Hashed password (MD5): {hashed_password}")

# Unsafely reading user input
user_email = input("Enter your email: ")
user_password = input("Enter your password: ")

# Sending email with plaintext password (not using TLS)
def send_email():
    try:
        server = smtplib.SMTP('smtp.example.com', 587)
        server.login("user@example.com", "userpassword")
        msg = MIMEText(f"Password is: {user_password}")
        msg['Subject'] = 'Sensitive Information'
        msg['From'] = "user@example.com"
        msg['To'] = user_email
        server.sendmail("user@example.com", user_email, msg.as_string())
        server.quit()
        print("Email sent successfully with sensitive data!")
    except Exception as e:
        print(f"Failed to send email: {e}")

send_email()

# Command injection vulnerability
os.system('echo "Hello World"')

# Insecure Deserialization
class User:
    def __init__(self, username):
        self.username = username

    def __str__(self):
        return self.username

# Unsafe use of pickle (deserialization vulnerability)
import pickle
user_object = User('admin')
serialized_object = pickle.dumps(user_object)

# Simulating a malicious attack where the serialized object is loaded by an attacker
loaded_object = pickle.loads(serialized_object)
print(f"Loaded user: {loaded_object}")

# Predictable session token (e.g., vulnerable to session fixation attacks)
session_token = "123456"
print(f"Session token (predictable): {session_token}")

# Boto3 - AWS Vulnerability
def aws_vulnerability():
    try:
        # This will authenticate to AWS using the hardcoded credentials (bad practice)
        session = boto3.Session(
            aws_access_key_id=AWS_ACCESS_KEY_ID,
            aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
            region_name='us-west-2'
        )
        s3 = session.resource('s3')
        for bucket in s3.buckets.all():
            print(f"Bucket name: {bucket.name}")
    except Exception as e:
        print(f"AWS Vulnerability - Failed to list S3 buckets: {e}")

aws_vulnerability()

# Azure Blob Storage Vulnerability
def azure_vulnerability():
    try:
        # This uses the hardcoded Azure credentials (bad practice)
        blob_service_client = BlobServiceClient(account_url=f"https://{AZURE_STORAGE_ACCOUNT_NAME}.blob.core.windows.net", credential=AZURE_STORAGE_ACCOUNT_KEY)
        containers = blob_service_client.list_containers()
        for container in containers:
            print(f"Container name: {container.name}")
    except Exception as e:
        print(f"Azure Vulnerability - Failed to list containers: {e}")

azure_vulnerability()
