from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Hello DevOps 🚀"

if __name__ == "__main__":
    # 0.0.0.0 makes it reachable from Docker
    app.run(host="0.0.0.0", port=5000)

