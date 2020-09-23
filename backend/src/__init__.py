import os
from flask import Flask, request, jsonify, send_file

from src.config import Config
from src.site_cloner import SiteCloner


def validation_error(msg):
    return jsonify({"error": msg}), 400


def create_app():

    app = Flask(__name__, static_url_path="/src/static")
    app.config.from_object(Config)

    @app.route("/health")
    def health():
        return jsonify({"message": "ok"})

    @app.route("/get-offline", methods=["POST"])
    def get_offline():
        output = {}
        data = request.json
        if "url" not in data:
            output["error"] = "No url supplied"
        else:
            SiteCloner.clone(data["url"])
        return jsonify(output)

    return app
