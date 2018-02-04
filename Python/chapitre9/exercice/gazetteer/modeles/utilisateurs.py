from .. app import db


class User(db.Model):
    user_id = db.Column(db.Integer, unique=True, nullable=False, primary_key=True, autoincrement=True)
    user_nom = db.Column(db.Text, nullable=False)
    user_login = db.Column(db.String(45), nullable=False)
    user_email = db.Column(db.Text, nullable=False)
    user_password = db.Column(db.String(64), nullable=False)