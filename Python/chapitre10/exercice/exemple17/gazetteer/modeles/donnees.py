from flask import url_for
import datetime

from .. app import db


class Authorship(db.Model):
    __tablename__ = "authorship"
    authorship_id = db.Column(db.Integer, nullable=True, autoincrement=True, primary_key=True)
    authorship_place_id = db.Column(db.Integer, db.ForeignKey('place.place_id'))
    authorship_user_id = db.Column(db.Integer, db.ForeignKey('user.user_id'))
    authorship_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    user = db.relationship("User", back_populates="authorships")
    place = db.relationship("Place", back_populates="authorships")

    def author_to_json(self):
        return {
            "author": self.user.to_jsonapi_dict(),
            "on": self.authorship_date
        }


# On crée notre modèle
class Place(db.Model):
    place_id = db.Column(db.Integer, unique=True, nullable=False, primary_key=True, autoincrement=True)
    place_nom = db.Column(db.Text)
    place_description = db.Column(db.Text)
    place_longitude = db.Column(db.Float)
    place_latitude = db.Column(db.Float)
    place_type = db.Column(db.String(45))
    authorships = db.relationship("Authorship", back_populates="place")

    def to_jsonapi_dict(self):
        """ It ressembles a little JSON API format but it is not completely compatible

        :return:
        """
        return {
            "type": "place",
            "id": self.place_id,
            "attributes": {
                "name": self.place_nom,
                "description": self.place_description,
                "longitude": self.place_longitude,
                "latitude": self.place_latitude,
                "category": self.place_type
            },
            "links": {
                "self": url_for("lieu", place_id=self.place_id, _external=True),
                "json": url_for("api_places_single", place_id=self.place_id, _external=True)
            },
            "relationships": {
                 "editions": [
                     author.author_to_json()
                     for author in self.authorships
                 ]
            }
        }

    @staticmethod
    def creer_place(place_nom, place_description, place_longitude, place_latitude, place_type):
        """ Crée un nouvel élément Place. Retourne un tuple (booléen, Place ou liste).
        Si il y a une erreur, la fonction renvoie False suivi d'une liste d'erreur
        Sinon, elle renvoie True suivi de la donnée enregistrée

        :param place_nom: Nom du lieu
        :param place_description: Courte description du lieu
        :param place_longitude: Coordonnées de la longitude
        :param place_latitude: Coordonnées de la latitude
        :param place_type: Mot identifiant le type de lieu

        """
        erreurs = []
        if not place_nom:
            erreurs.append("Aucun nom de lieu n'est fourni")
        if not place_description:
            erreurs.append("Aucune description de lieu n'est fournie")
        if not place_longitude:
            erreurs.append("Aucune coordonnée de longitude n'est fournie")
        if not place_latitude:
            erreurs.append("Aucune coordonnée de latitude n'est fournie")
        if not place_type:
            erreurs.append("Aucun type de lieu n'est fourni")

        # Si on a au moins une erreur
        if len(erreurs) > 0:
            return False, erreurs

        # On crée un nouveau lieu
        nouveaulieu = Place(
            place_nom=place_nom,
            place_description=place_description,
            place_longitude=place_longitude,
            place_latitude=place_latitude,
            place_type=place_type
        )

        try:
            # On l'ajoute au transport vers la base de données
            db.session.add(nouveaulieu)
            # On envoie le paquet
            db.session.commit()

            # On renvoie l'utilisateur
            return True, nouveaulieu
        except Exception as erreur:
            return False, [str(erreur)]
