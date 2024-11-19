# source : https://learn.microsoft.com/en-us/azure/app-service/quickstart-python?tabs=flask
# flask --app calculator_app run (if file name calculator_app.py) else only flask run
# flask run cmd: https://flask.palletsprojects.com/en/stable/quickstart/

from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def calculator():
    return render_template('calculator.html')

@app.route('/calculate', methods=['POST'])
def calculate():
    num1 = float(request.form['num1'])
    num2 = float(request.form['num2'])
    operation = request.form['operation']
    
    if operation == 'add':
        result = num1 + num2
    elif operation == 'subtract':
        result = num1 - num2
    elif operation == 'multiply':
        result = num1 * num2
    elif operation == 'divide':
        if num2 != 0:
            result = num1 / num2
        else:
            return 'Error: Cannot divide by zero!'
    return render_template('result.html', result=result)

# if __name__ == '__main__':
#     app.run(debug=True)

if __name__ == '__main__':
   app.run()
