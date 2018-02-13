import datetime


class Authorship(db.Model):
    __tablename__ = "authorship"
    authorship_id = db.Column(db.Integer, nullable=True, autoincrement=True, primary_key=True)
    authorship_place_id = db.Column(db.Integer, db.ForeignKey('place.place_id'))
    authorship_user_id = db.Column(db.Integer, db.ForeignKey('user.user_id'))
    authorship_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    user = db.relationship("User", back_populates="authorships")
    place = db.relationship("Place", back_populates="authorships")

class User(db.Model):
    user_id = db.Column(db.Integer, unique=True, nullable=False, primary_key=True, autoincrement=True)
    user_nom = db.Column(db.Text, nullable=False)
    user_login = db.Column(db.String(45), nullable=False, unique=True)
    user_email = db.Column(db.Text, nullable=False)
    user_password = db.Column(db.String(100), nullable=False)
    authorships = db.relationship("Authorship", back_populates="user")
    
class Place(db.Model):
    place_id = db.Column(db.Integer, unique=True, nullable=False, primary_key=True, autoincrement=True)
    place_nom = db.Column(db.Text)
    place_description = db.Column(db.Text)
    place_longitude = db.Column(db.Float)
    place_latitude = db.Column(db.Float)
    place_type = db.Column(db.String(45))
    authorships = db.relationship("Authorship", back_populates="place")
    variante = db.relationship("Variante", back_populates="variante")
    
class Variante(db.Model):
    # A compléter
    variante_id = db.Column(db.Integer, unique=True, nullable=False, primary_key=True, autoincrement=True)
    variante_nom = db.Column(db.Text)
    variante_lang_code = db.Column(db.String(45))
    variante_place_id = db.Column(db.Integer, db.ForeignKey('place.place_id'))
    place = db.relationships("Place", back_populates="place")
