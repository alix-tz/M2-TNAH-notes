# Python

## Chapitre 11 : Jointures SQL et Update

### Commandes et fonctions

### Jointures

Une jointures est une requête effectuée sur plusieurs tables ensemble. Cela permet d'éviter de dupliquer les informations entre les tables et donc de multiplier les communications avec le serveur SQL. Leur optimisation est essentielle pour garantir la performance de la base.

Une jointure implique de connaître les cardinalités entre les différentes tables (n-n, 0-1, 0-n, etc).

cf. [MySQL sur openclassrooms](https://openclassrooms.com/courses/concevez-votre-site-web-avec-php-et-mysql/les-jointures-entre-tables)

#### SQLAlchemy et les jointures
SQLAlchemy facilite la réalisation des jointures.

cf. [documentation SQLAlchemy sur les jointures](http://docs.sqlalchemy.org/en/latest/orm/basic_relationships.html)

Quand on a une relation **n-n** (*many-to-many*), on crée une `table de liaison` pour gérer les interactions.

Exemple : *la table Authorship qui lie les tables User et Place*  
``` python
import datetime

class Authorship(db.Model):
    __tablename__ = "authorship"
    authorship_id = db.Column(db.Integer, nullable=True, autoincrement=True, primary_key=True)
    authorship_place_id = db.Column(db.Integer, db.ForeignKey('place.place_id'))
    authorship_user_id = db.Column(db.Integer, db.ForeignKey('user.user_id'))
    authorship_date = db.Column(db.DateTime, default=datetime.datetime.utcnow)
    user = db.relationship("User", back_populates="authorships")
    place = db.relationship("Place", back_populates="authorships")
```
> `__tablename__` permet de nommer manuellement la table. Par défaut, SQLAlchemy nomme la table avec une casse en minuscule.  
> la package `datetime` permet d'inclure des données de type *date* ou *heure* de manière automatique : `default=datetime.datetime.utcnow`.  
> `ForeignKey` permet de lier la table à une autre table en précisant le champs qui supporte cette liaison (souvent l'id). On fait cette connexion des deux "côtés" de la table de liaison.  
> `db.relationship()` permet de créer les connections, avec l'attribut `back_populates` qui indique la table vers lequel la table courante est ancrée.

`db.relationship()` permet de construire des relations directes entre les objets et de naviguer entre eux. Ainsi, dans l'insertion, on n'utilise pas **place_id** ou **user_id** mais bien **place** et **user**. Cette fonction est très différente de `db.Column()` parce qu'elle n'intervient pas sur la structure MySQL des classes, elle ne fait que les connecter.  

``` python
class A(db.Model):
    propriete_de_relation = db.relationship(
        "NomDeLaClasseLiée",
        back_populates="a"
    )
class NomDeLaClasseLiée(db.Model):
    a = db.relationship(
        "A",
        back_populates="propriete_de_relation"
    )
```

