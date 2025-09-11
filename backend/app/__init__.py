from flask import Flask


def create_app():
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY="dev",
    )

    from . import movement

    app.register_blueprint(movement.movement_bp)
    return app
