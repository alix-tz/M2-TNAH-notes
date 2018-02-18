# Python

## Chapitre 12 : Créer une API

### Commande et fonctions

### Définition
API est un raccourci pour "Application Programming Interface". Une API est un système informatique prévu pour la communication de données ou de fonctions à des services tiers. C'est un moyen externe de réaliser des transactions depuis l'extérieur sans avoir à accéder au code interne d'un projet ou à ses données au format brut.  

Les API sont utilisées aussi bien sur le Web que dans les logiciels et les librairies de développement. Ex : des APIs servant des données (IIIF, OAI PMH ou encore métadonnées de catalogue), ou des fonctions comme Google Translate ([Doc](https://cloud.google.com/translate/docs/quickstart)), ou [LemLat](http://cophilab.ilc.cnr.it:8080/LatMorphWebApp/services/complete/arma,cano,domus).  

Toutes les API ne sont pas produites pour une consommation par un tiers : elles peuvent aussi servir un moyen de communication entre le client et le serveur. Ex : l'autocomplétion d'un formulaire de recherche (Quand l'utilisateur tape quelques lettres, un script du côté client ira communiquer avec une page de l'API pour récupérer les données sans rafraichir la page actuelle).  


#### Formats d'API
Tous les formats ne sont pas des formats d'API, ce n'est pas le cas d'HTML par exemple. XML et JSON le sont.
Le choix du bon format d'API permet d'obtenir des résultat plus faciles à traiter, plus légers donc plus rapide, et plus fiables (moins de risques d'erreur de parsage).  

Il existe un début sur le choix du meilleur format, entre `XML` et `JSON` :  
- [Mobile Performance testing JSON vs XML (2016)](https://www.infragistics.com/community/blogs/b/torrey-betts/posts/mobile-performance-testing-json-vs-xml),
- [JSON vs XML: A Comparative Performance Analysis  of Data Exchange Formats](http://ijcsn.org/IJCSN-2014/3-4/JSON-vs-XML-A-Comparative-Performance-Analysis-of-Data-Exchange-Formats.pdf),
- [JSON ou XML, quel format choisir? ](https://www.scriptol.fr/ajax/json-xml.php)

### Objet Response
Rappel : une réponse serveur contient trois paramètres : les `headers`, le `code http` et le `corps`.  

Pour créer une API qui renvoie du JSON, on ne peut pas utiliser `render_template` pour paramétrer le corps de la réponse et renvoyer un élément en json. En effet, `render_template` ne renvoie pas une chaîne de caractères mais un objet de classe `Response`, qui est constitué d'un header, d'un code http et d'un corps.  

> dans le cas d'un render_template, la code http est par défaut 200, et le header prévoie le mimetype "html".  

Flask nécessite des objets Response.  
Un objet Response a deux paramètres importants :
- `.headers`, qui se comporte comme un **dictionnaire**
- `.status_code`, qui se comporte comme un **entier**.

On peut donc écrire, par exemple :
``` python
from flask import Flask, Response

app = Flask("Nom")

@app.route("/404")
def erreur_404():
    response = Response("Il y a eu une erreur") #(le message entre "" ici c'est le corps)
    response.headers["content-type"] = "text/plain" # On appelle la clef "content-type" du dictionnaire reponse dans le header
    response.status_code = 404 # donne le code http de la réponse
    return response
```

### Jsonify
La méthode `flask.jsonify()` permet de prévoir automatiquement un objet Response avec les paramètres qui permettent de renvoyer un json.  

`jsonify` est basé sur le fonctionnement de `json.dumps()`

On peut considérer que `jsonify` est l'équivalent de `render_template`.

On l'utilise comme ceci :  

``` Python
from flask import Flask, jsonify #jsonify appartient à Flask donc il suffit de l'importer
import json
app = Flask("Nom")

@app.route("/du_json")
def une_route():
    mon_dictionnaire = {"une_cle" : "une valeur"}
    return jsonify(mon_dictionnaire)
```

On peut également changer le code d'erreur pour prévoir les erreurs :  
``` python
from flask import Flask, jsonify
import json
app = Flask("Nom")

@app.route("/erreur404")
def une_route():
    mon_dictionnaire = {"message" : "Vous avez une belle erreur ici !"} # jsonify renvoi une reponse, son status_code/http est par défaut 200 ; on peut le modifier manuellement en assignant la reponse à une variable au préalable.
    response = jsonify(mon_dictionnaire)
    response.status_code = 404
    return response
```

#### Limites de jsonify
`jsonify` ne peut pas être utilisé sur tous les objets. On peut facilement convertir les dictionnaires, les listes, les booléens, les nombres, et autres types simples de Python. Ce n'est pas possible pour des objets plus complexes.  
Jsonify ne fonctionne pas, par exemple, sur des objets créés par le.a développeur.se.  

Pour remédier à cela, il faut faire une transformation intermédiaire, en construisant une fonction qui fait cette opération. Par exemple :  
``` python
from modules_cours.gazetteer.modeles.donnees import Place
from modules_cours.gazetteer.app import app
from json import dumps

data = Place.query.get(1)

def place_to_json(place):
    return {
        "nom": place.place_nom,
        "description": place.place_description,
        "longitude": place.place_longitude,
        "latitude": place.place_latitude
    }

print(dumps(place_to_json(data)))
```

> Pour faciliter l'utilisation de cette fonction, on la transforme en méthode. **comprendre le code suivant :**  

``` Python
class Place(db.Model):
    place_id = db.Column(db.Integer, unique=True, nullable=False, primary_key=True, autoincrement=True)
    place_nom = db.Column(db.Text)
    place_description = db.Column(db.Text)
    place_longitude = db.Column(db.Float)
    place_latitude = db.Column(db.Float)
    place_type = db.Column(db.String(45))

    def to_dict(self):
        return {
            "nom": self.place_nom,
            "description": self.place_description,
            "longitude": self.place_longitude,
            "latitude": self.place_latitude
        }
```

### serializer vs. parser
Parser c'est rendre un objet compréhensible par la machine (le transformer en suite binaire).  
Sérialiser, c'est transformer un objet parsé ou d'un format donné, vers un autre format lisible par l'humain.


### Créer une route d'API
On peut distinguer dans un dossier `routes/` un fichier `general.py` et un fichier `api.py`:  
- `general.py` contient la définition des routes de l'application "normale"
- `api.py` contient la définition des routes des api.  

#### URLLib
`urllib` est un package python qui permet de travailler sur des URLs. [Documentation](https://docs.python.org/2/library/urllib.html)  

- `urllib.parse.urlencode` permet d'encoder des paramètres `GET` via un dictionnaire ; les valeurs de la requête étant séparées par des `&`. [Documentation](https://docs.python.org/3/library/urllib.parse.html)

#### URL_FOR
- le paramètre de `url_for` : `url_for(..., external=True)` permet de générer une URL absolue et non plus simplement relative.

##### Exemple d'implémentation
Dans `routes/apis.py` :  
``` python
from flask import render_template, request, url_for, jsonify
from urllib.parse import urlencode

from ..app import app
from ..constantes import LIEUX_PAR_PAGE, API_ROUTE
from ..modeles.donnees import Place

@app.route(API_ROUTE+"/places")
def api_places_browse():
    """ Route permettant la recherche plein-texte et la navigation classique

    On s'inspirera de http://jsonapi.org/ faute de pouvoir trouver temps d'y coller à 100%
    """
    # q est très souvent utilisé pour indiquer une capacité de recherche
    motclef = request.args.get("q", None) # on utilise souvent "q" pour "query" pour faire plus court
    page = request.args.get("page", 1)

    if isinstance(page, str) and page.isdigit():
        page = int(page)
    else:
        page = 1

    if motclef:
        query = Place.query.filter(
            Place.place_nom.like("%{}%".format(motclef))
        )
    else:
        query = Place.query

    try:
        resultats = query.paginate(page=page, per_page=LIEUX_PAR_PAGE)
    except Exception:
        return Json_404()

    dict_resultats = {
        "links": {
            "self": request.url
        },
        "data": [
            place.to_jsonapi_dict()
            for place in resultats.items # boucle de développeur fainéant
        ]
    }

    if resultats.has_next:
        arguments = {
            "page": resultats.next_num
        }
        if motclef:
            arguments["q"] = motclef
        dict_resultats["links"]["next"] = url_for("api_places_browse", _external=True)+"?"+urlencode(arguments)

    if resultats.has_prev:
        arguments = {
            "page": resultats.prev_num
        }
        if motclef:
            arguments["q"] = motclef
        dict_resultats["links"]["prev"] = url_for("api_places_browse", _external=True)+"?"+urlencode(arguments)

    response = jsonify(dict_resultats)
    return response
```

Dans `modeles/donnees.py` :  
``` python
from flask import url_for

class Place(db.Model):
    # ...

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
```
