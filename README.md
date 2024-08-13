[Types of tests](python/test)

# App Service
- By default, App Service assumes that a Flask app's main module is application.py or app.py. If your main module uses a different name, then you must customize the startup command. )
[ For example, if you have a Flask app whose main module is hello.py and the Flask app object in that file is named myapp, then the command is as follows- ](https://learn.microsoft.com/en-us/azure/app-service/configure-language-python)

`gunicorn --bind=0.0.0.0 --timeout 600 hello:myapp`


