from flask import Flask, url_for , render_template

app = Flask(__name__)

@app.route("/")
def hello():
    return render_template("base.html",link=url_for('child'))

@app.route("/child")
def child():
    return render_template("child.html")

@app.errorhandler(404)
def error(e):
    return render_template("error.html"),404

with app.test_request_context():
    print(url_for('child'))

if __name__ == "__main__":
    app.run(debug=True)
