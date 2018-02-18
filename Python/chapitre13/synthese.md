# Python

## Chapitre 13 : Ecrire des tests

### Fonctions et commandes
- `class TestName(unittest.testCase)`
- `setUp()`
- `tearDown()`
- `db.create_all()`
- `db.drop_all()`
- `test_client()`

### Tests : définition

Dans l'écriture d'un programme, la rédaction des tests prend énormément de temps.  

Les tests s'appliquent à vérifier le fonctionnement de plusieurs éléments :
- les blocs programmés, pris séparément
- l'interaction de ces blocs les uns avec les autres
- l'interaction entre la partie graphique et la partie "cachée"
- que les modifications futures ne provoquent pas d'erreur

#### tests unitaires vs. tests d'intégration
Le test unitaire vérifie le bon fonctionnement d'une partie précise d'un logiciel ou d'un portion d'un programme.  
Le test d'intégration assemble tous les modules indépendants d'un logiciel et les teste en les traitant comme un ensemble.

#### tests unitaires
On a vu que pour des tests unitaires, `assert` est une bonne solution. cf. [chapitre 2](https://github.com/alix-tz/M2-TNAH/blob/master/Python/chapitre2/synthese.md)  

Mais `assert` n'est pas suffisant dans le cadre d'un application, car il ne permet pas de créer plusieurs tests.

#### Outils de tests
Python propose plusieurs libraries pour gérer la création et l'exécution des tests :
- `unittest` (inclus par défaut dans python)
- `nosetest` (installé via pypi et rétro-compatible avec unittest)
- `py.test` (utilise beaucoup assert de manière un peu détournée)

Le choix de la library dépend des préférences locales de l'équipe de développement, et des besoin spécifiques d'options complexes.  

### Unittest

Pour utiliser `unittest`, il faut :
- créer une classe dérivée de `unittest.TestCase` (le nom de la classe commencera par Test...)
- créer des fonctions commençant par `test_`
- utiliser des termes spécifiques pour réaliser les tests (*assertions*).

exemple :
``` python
import unittest

class TestCarre(unittest.TestCase):
    """ Test l'ensemble des fonctions pour carré """

    def test_calcul_correct(self):
        self.assertEqual(carre(8), 64)
        self.assertEqual(carre(3), 9)
        self.assertEqual(carre(-1), 1)
        for x in range(9):
            self.assertEqual(carre(x), carre(-x))

    def test_erreur_quand_non_numeric(self):
        with self.assertRaises(TypeError):
            # Ne fonctionnera que si l'erreur TypeError est lancée
            carre("Ca va pas marcher...")

    def test_accepte_decimaux(self):
        """Le carré d'un décimal devrait être bien calculé"""
        self.assertEqual(carre(0.1), 0.01)

```

#### liste des assertions :

| Method                    	| Checks that                                                                  	|
|---------------------------	|------------------------------------------------------------------------------	|
| assertEqual(a,b)          	| a == b                                                                       	|
| assertNotEqual(a,b)       	| a != b                                                                       	|
| assertTrue(x)             	| bool(x) is True                                                              	|
| assertFalse(x)            	| bool(x) is False                                                             	|
| assertIs(a,b)             	| a is b                                                                       	|
| assertIsNot(a,b)          	| a is not b                                                                   	|
| assertIsNone(x)           	| x is None                                                                    	|
| assertIsNotNone(x)        	| x is not None                                                                	|
| assertIn(a,b)             	| a in b                                                                       	|
| assertNotIn(a,b)          	| a not in b                                                                   	|
| assertIsInstance(a,b)     	| isinstance(a, b)                                                             	|
| assertNotIsInstance(a,b)  	| not isinstance(a, b)                                                         	|
| assertAlmostEqual(a,b)    	| round(a-b, 7) == 0                                                           	|
| assertNotAlmostEqual(a,b) 	| round(a-b, 7) != 0                                                           	|
| assertGreater(a,b)        	| a > b                                                                        	|
| assertGreaterEqual(a,b)   	| a >= b                                                                       	|
| assertLess(a,b)           	| a < b                                                                        	|
| assertLessEqual(a,b)      	| a <= b                                                                       	|
| assertRegex(s,r)          	| r.search(s)                                                                  	|
| assertNotRegex(s,r)       	| not r.search(s)                                                              	|
| assertCountEqual(a,b)     	| a et b sont égaux : même nombre d'éléments et mêmes éléments quelque soit leur ordre 	|


#### Lancer un test
On pourrait lancer le test directement dans python (`unittest.main(argv=['first-arg-is-ignored'], exit=False)`), mais ce n'est généralement pas comme cela que l'on procède aux tests.

Dans le cadre d'un application, on aura généralement l'environnement de travail suivant :
> - **Dossier de travail/**  
>   - **dossier_application/** (module principal)  
>   - **module_de_tests/** (module de tests)  
>   - **docs/** (dossier avec la documentation)  
>   - run.py ou app.py (outil pour lancer l'application)  
>   - **env/** (environnement virtuel soigneusement ignoré dans un gitignore)  
>   - README.md  
>   - LICENSE.md  
>   - .gitignore  

Dans ce environnement, on ira **dans le dossier de travail** pour **lancer l'environnement virtuel** avant d'utiliser la commande :  
`python -m unittest discover module_de_tests`  

### Rédiger des tests, éléments principaux
Un test d'intégration est réalisé à partir d'une application test, c'est-à-dire qu'elle est lancée à partir de tous les modules de l'application uniquement dans le cadre du test.  
Deux fonctions sont essentielles pour gérer cela :  
- `setUp`
- `tearDown`

Exemple :
``` python
class TestMiseAJourRessources(TestCase):
    def setUp(self):
        self.application = gazetteer
        self.user = gazetteer.User.Johanna
        self.application.login(self.user)

    def tearDown(self):
        try:
            self.application.logout(self.user)
        except:
            pass

    def test_update(self):
        self.application.route.update_item(1).nom = "Rome"
        self.assertEqual(self.application.item(1).nom, "Rome")

    def test_erreur_non_loguee(self):
        self.application.logout(self.user)
        with self.assertRaises(Forbidden):
            self.application.route.update_item(1).nom = "Rome"
        self.assertEqual(self.application.item(1).nom, "Roma")
```

Les `fixtures` sont des données pour une base de données temporaires qui permettent de vérifier la validité des tests.  

Un `mock` est une fonction qui remplace une autre fonction capable d'échouer. Ils aident à tester des services externes, comme les APIs hébergées par d'autres sites qui pourraient refuser d'être la source d'un test. [Documentation 1](http://python-mock-tutorial.readthedocs.io/en/latest/introduction.html) ; [Documentation 2](https://realpython.com/blog/python/testing-third-party-apis-with-mocks/)

### Flask, SQLAlchemy et les tests
Pour tester une application, qui possède notamment une base de données, il faut générer un ensemble de données qui permette de tester les différentes pages.  

`SQLAlchemy` et `Flask-SQLAlchemy` permettent de générer des bases de données à partir de l'ensemble des modèles enregistrés. On utilise `db.create_all()` (ici *db* contient l'ensemble des modèles de données) pour générer la base de données. Pour l'effacer, on utiliser `db.drop_all()`. [Documentation supplémentaire](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-iv-database)  

Pour sécuriser l'environnement de test, et ne pas risquer d'écraser des données qui existent et qui sont nécessaires à l'application dans son fonctionnement normal, il est nécessaire de créer **plusieurs configurations**. Pour faire cela, il y a plusieurs méthodes :
- [variables environnementales](https://fr.wikipedia.org/wiki/Variable_d%27environnement)  
- configurations multiples dans un module config  

#### méthode config et SQLite
***Cette méthode est très sensible à l'ordre de création des autres variables.***

On crée/complète le fichier `config.py` dans le dossier de l'application. En créant une configuration de production, et une configuration de test.  

`SQLite` est un moteur de base de données où tout se trouve dans un seul fichier. C'est plus lent que MySQL, mais cela convient tout à fait pour des tests.  
Les constantes sont nommées en commençant par `_`. Cette convention de nommage permet de signaler que ce sont des variables qui ne doivent pas être appelées directement / utilisées en dehors du test.  

``` python
# ...
class _TEST:
    SECRET_KEY = SECRET_KEY
    # On configure la base de données
    SQLALCHEMY_DATABASE_URI = 'sqlite:///test_db.sqlite'
    SQLALCHEMY_TRACK_MODIFICATIONS = False


class _PRODUCTION:
    SECRET_KEY = SECRET_KEY
    # On configure la base de données
    SQLALCHEMY_DATABASE_URI = 'mysql://gazetteer_user:password@localhost/gazetteer'
    SQLALCHEMY_TRACK_MODIFICATIONS = False

CONFIG = {
    "test": _TEST,
    "production": _PRODUCTION
}
```

> on crée 2 classes qui possèdent des propriétés similaires aux configurations nécessaires de Flask, et donc les noms commencent par `_`;  
> on les regroupe dans un dictionnaire.

Dans `app.py` dans le dossier de l'application :  
``` python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
import os
from .constantes import CONFIG

chemin_actuel = os.path.dirname(os.path.abspath(__file__))
templates = os.path.join(chemin_actuel, "templates")
statics = os.path.join(chemin_actuel, "static")

# On initie l'extension
db = SQLAlchemy()
# On met en place la gestion d'utilisateur-rice-s
login = LoginManager()

app = Flask(
    __name__,
    template_folder=templates,
    static_folder=statics
)


from .routes import generic
from .routes import api


def config_app(config_name="test"):
    """ Create the application """
    app.config.from_object(CONFIG[config_name])

    # On initie les extensions
    db.init_app(app)
    login.init_app(app)

    return app
```
> toute la partie initiation des routines est mise à part dans une fonction `config_app()` qui retourne l'application. On utilise la fonction `.config.from_object()` en lui donnant *CONFIG[config_name]* en paramètre, étant donné qu'on a définit (et importé) ce dictionnaire depuis `config.py`.  

Dans `run.py`, on importera désormais `config_app` qu'on exécute afin de lancer l'application :
``` python
from gazetteer.app import config_app

if __name__ == "__main__":
    app = config_app("production")
    app.run(debug=True)
```
> `__name__` désigne le fichier courant  
> `__main__` est le nom donné au fichier courant dans c'est celui qui a été exécuté.  

---

### Exemple de test d'intégration :
``` python
from gazetteer.app import db, config_app, login
from gazetteer.modeles.utilisateurs import User
from gazetteer.modeles.donnees import Place, Authorship
from unittest import TestCase
from json import loads


class TestApi(TestCase):
    places = [
        Place(
            place_nom='Hippana',
            place_description='Ancient settlement in the western part of Sicily, probably founded in the seventh century B.C.',
            place_longitude=37.7018481,
            place_latitude=13.4357804,
            place_type='settlement'
        )
    ]

    def setUp(self):
        self.app = config_app("test")
        self.db = db
        self.client = self.app.test_client()
        self.db.create_all(app=self.app)

    def tearDown(self):
        self.db.drop_all(app=self.app)

    def insert_all(self, places=True):
        # On donne à notre DB le contexte d'exécution
        with self.app.app_context():
            if places:
                for fixture in self.places:
                    self.db.session.add(fixture)
            self.db.session.commit()

    def test_single_place(self):
        """ Vérifie qu'un lieu est bien traité """
        self.insert_all()
        response = self.client.get("/api/places/1")
        # Le corps de la réponse est dans .data
        # .data est en "bytes". Pour convertir des bytes en str, on fait .decode()
        content = response.data.decode()
        self.assertEqual(
            response.headers["Content-Type"], "application/json" # vérifier que c'est bien du json
        )
        json_parse = loads(content) # vérifier le contenu de la réponse par des tests d'égalité (type, attributs, lien)
        self.assertEqual(json_parse["type"], "place")
        self.assertEqual(
            json_parse["attributes"],
            {'name': 'Hippana', 'latitude': 13.4357804, 'longitude': 37.7018481, 'category': 'settlement',
             'description': 'Ancient settlement in the western part of Sicily, probably '
                            'founded in the seventh century B.C.'}
        )
        self.assertEqual(json_parse["links"]["self"], 'http://localhost/place/1') #on test ce lien en suite, c'est-à-dire on vérifier que le lien fonctionne, pas forcément son contenu :

        # On vérifie que le lien est correct
        seconde_requete = self.client.get(json_parse["links"]["self"])
        self.assertEqual(seconde_requete.status_code, 200)
```

> on génère l'application dans `setUp()`  
> on garde la capacité d'insérer ou non des données (préférences personnelles)  
> une fois l'application générée, on crée un client de test qui permet de faire des requêtes (`test_client()`)  
> on utilise ce client pour faire des requêtes dont les réponses sont composées de :  
>   - ̀`.headers` (dictionnaire)  
>   - ̀̀̀`.data` (*bytes*, qu'on transforme en *str* via `chaine=response.data.decode()`)  
>   - `.status_code` (entier)  
> `self.client` permet de faire des requêtes vers l'instance web qui tourne durant le test.  
