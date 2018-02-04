from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os

chemin_actuel = os.path.dirname(os.path.abspath(__file__))
templates = os.path.join(chemin_actuel, "templates")
statics = os.path.join(chemin_actuel, "static")

app = Flask(
    "Application",
    template_folder=templates,
    static_folder=statics
)
# On configure la base de données
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://gazetteer_user:password@localhost/gazetteer'
# On initie l'extension
db = SQLAlchemy(app)

from .routes import lieu, accueil, recherche