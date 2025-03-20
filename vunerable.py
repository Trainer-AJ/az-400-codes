import os
import base64
import hashlib
import smtplib
from email.mime.text import MIMEText

# Hardcoded secret
API_KEY = "sk_test_4eC39HqLyjWDarjtT1zdp7dc"  # Hardcoded secret key (API key)

# Unsafely exposing sensitive information
print("Sending API key to the console...")
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
