from flask import Flask

def create_app():
    app = Flask(__name__)

    from app.view import view

    app.register_blueprint(view)

    return app