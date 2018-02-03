# Python
## Chapitre 6 : MySQL avec Python et Flask

### Commences pour requêtes
- `.query` : appliqué à une table définie dans un modèle de donnée, permet de lancer une requête.
- `.all()` : appliqué à la suite de query ou d'une requête plus complexe, permet d'afficher l'ensemble des résultats de la requête.
- `.get()` : appliqué à la suite de query, complété d'un entier entre les (), permet de cibler un élément de la table par sa clef primaire.  
- `.count()` : appliqué à la suite de query ou d'une requête plus complexe, permet d'afficher le nombre de résultats pour la requête.  
- `.first` : appliqué à la suite de query ou d'une requête plus complexe, permet de n'afficher que le premier résultat.  
- `.order_by()` : appliqué à la suite de query ou d'une requête plus complexe, permet de trier les résultats en fonction des valeurs d'un champ dont le nom est donné entre ().  
- `.asc()` ou `.desc()` : appliqué à la suite du champ sur lequel porte order_by, dans le cadre des paramètres de order_by, permet d'indiquer le sens du tri à opérer (croissant/décroissant).  
- `.filter()` : appliqué à la suite de query, permet de donner en paramètre une série de critères pour filtrer la recherche. Ces critères sont exprimés sur le modèle : `champ + opérateur + valeur`. On peut combiner plusieurs critères.
- `.like()` : à la suite du champ sur lequel porte filter, dans le cadre des paramètres de filter, permet de donner une valeur que l'on cherche dans un champ de la table. Comme en MySQL l'utilisation des joker `%` avant ou après la valeur permet préciser ou non la position de la valeur dans les éléments du champ. *cf. chapitre 8*. 

### Remarques
Par convention :  
- Aaaa : classe
- aaaa : variable ou fonction
- AAAA : constante

> Qu'est-ce qu'une constante ?

### Recommandations
Lorsqu'on réalise un projet avec des bases de données :
1. ne jamais travailler directement sur la base de données publique (une erreur est vite arrivée et on risque de supprimer l'ensemble des données par erreur).  
2. travailler sur des copies (backup). Il vaut mieux installer les données sur sa propre machine pour pouvoir lancer les requêtes sur une machine hors production (c'est-à-dire, qui n'est pas utilisée par la base de données publique).

### mysqlclient
Pour installer mysqlclient (**dans un environnement virtuel**) :  
- `pip install mysqlclient`

En cas d'erreur sur Ubuntu (14, 16) ou Debian :  
- `sudo apt-get install python3-dev libmysqlclient-dev`
- `pip install mysqlclient`


### SQLAlchemy et Flask_sqlalchemy
Flask_sqlalchemy est la variante pour Flask de SQLAlchemy. SQLAlchemy prend en charge la traduction de requêtes vers les systèmes SQL (SQLite, PostgreSQL, MariaDB, ...). Cela permet de simplifier les interaction et de limiter l'impact d'une migration de système de base de données.  

#### installation
Pour installer le package (**dans l'environnement virtuel**):  
- pip install flask_sqlalchemy==2.3.2

#### Flask et flask_sqlalchemy
`flask_sqlalchemy` doit être importé dans le script de l'application :  
``` python
from flask_sqlalchemy import SQLalchemy
```

Pour connecter l'application à la base de données, on utilise :  
``` python
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://gazetteer_user:password@localhost/gazetteer'
db = SQLAlchemy(app)
```

> ici, app.config... fournit à les informations nécessaires pour se connecter (y compris le mot de passe). cf. [Documentation Flask sur la configuration](http://flask-sqlalchemy.pocoo.org/2.3/config/)  
> l'objet SQLAlchemy a comme variable l'application, et est lui-même stocké dans la variable `db`.  

#### Modèles de données
Les modèles de données permettent de créer des requêtes de manière automatique à partir d'une déclaration `class`, suivie d'une série de lignes décrivant les différents champs du modèles, suivant la syntaxe : `nom = colonne(type de colonne, paramètres supplémentaires)`.  

Pour signaler une colonne, on utilise `SQLAlchemy.Column`.  
Il existe plusieurs types de colonne :  

| Type         | Exemple         | Définition                                                                    |
| ------------ | --------------- | ------------------------------------------------------------------------------|
| Entier       | db.Integer      | Stocke un entier                                                              |
| Chaîne       | db.String(42)   | Stocke une chaîne à taille maximale ( ici 42)                                 |
| Texte        | db.Text         | Un texte sans taille maximale                                                 |
| DateTime     | db.DateTime     | Date et Heure suivant un objet [`datetime`](https://docs.python.org/3.5/library/datetime.html) en python                           |
| Float        | db.Float        | Stocke un décimal                                                             |
| Boolean      | db.Boolean      | Stocke un booléen                                                             |

> en MySQL on a beaucoup plus de finesse qu'avec SQLAlchemy quand on décrit la taille des éléments de la table.  

**Exemple de déclaration d'un modèle de données :**
``` python
class Place(db.Model):
    # Tout comme tous les deux points de python, on écrit ensuite en décalé
    place_id = db.Column(db.Integer, unique=True, nullable=False, primary_key=True, autoincrement=True)
    place_nom = db.Column(db.Text)
    place_description = db.Column(db.Text)
    place_longitude = db.Column(db.Float)
    place_latitude = db.Column(db.Float)
    place_type = db.Column(db.String(45))
```
> le nom de la variable après `class` doit être le même que le nom de la table (commençant par convention par une majuscule pour plus de lisibilité).

**paramètres supplémentaires :**  
- `unique=True`
- `nullable=False`
- `primary_key=True`
- `autoincrement=True`

On peut définir le modèle de données dans le script de l'application, ou bien l'inscrire dans un fichier à part et le convoquer dans le script principal de l'application.

#### Requêtes à partir du modèle
- **Nom_de_la_classe_de_données.query.all()** : équivaut à `SELECT * from Nom_de_la_classe_de_données`.  
- table **.query.get(** *clef* **)** : équivaut à `SELECT * from table where champs = clef`. Le numéro donné à la place de `clef` correspond à la clef primaire de la table.  
- table **.query.filter(** *champ* **=="** *valeur* **").all()** : équivaut à `SELECT * from table where champ = "valeur"`.  
On peut utiliser tous les opérateurs qui existent en python (`==`, `>`, `<=`, etc). `.all()` permet d'afficher l'ensemble des résultats sans attendre de paramètre supplémentaire.  
- table.query.fetchall()**.count()** : permet d'afficher le nombre de résultat.
- table.query.filter(...) **.first** : permet de n'afficher que le premier résultat.  
- table.query.filter(...) **.order_by(** *champs* **.desc())** .all() : permet trier les résultats dans un ordre décroissant (.desc()) ou croissant ( **.asc()** ).  


On peut stocker le résultat dans ces requêtes dans des variable pour pouvoir ensuite boucler dessus. Exemple :  
``` python
lieux = Place.query.all()
for lieu in lieux:
    print(lieu.place_nom, lieu.place_type)
```

Ces requêtes peuvent être utilisées dans le script de l'application pour définir la valeur d'une variable que l'on retourne en partie ou entièrement dans le cadre de la définition d'une réponse serveur (app.route).


#### ORM : [Object-Relational Mapping](https://fr.wikipedia.org/wiki/Mapping_objet-relationnel)
Les ORM permettent de créer l'illusion d'une interaction avec une base de donnée dans le cadre d'une programmation orientée objet. Les ORM on l'avantage de donner des résultat dans des formes faciles à exploiter, de simplifier l'écriture des requêtes, et d'offrir une compatibilité avec plusieurs systèmes de base de données à la fois.  

---

### Démonstrations dans la leçon
#### Requêtes manuelles Flask_sqlalchemy (peu utilisée)
La sous-méthode de SQLAlchemy `engine.execute()` permet de réaliser des requêtes manuelles. Sachant que SQLAlchemy est sotcké dans la variable `db`:  
``` python
query = db.engine.execute("SELECT * FROM place")
print(query)
for x in query.fetchall():
    print(x["place_nom"])
    print(type(x))
```

```
Output :  
<sqlalchemy.engine.result.ResultProxy object at 0x7fad0c701ac8>  
Hippana  
<class 'sqlalchemy.engine.result.RowProxy'>  
Nicomedia  
<class 'sqlalchemy.engine.result.RowProxy'>  
Aornos  
<class 'sqlalchemy.engine.result.RowProxy'>  
The "Hochtor Sanctuary"  
<class 'sqlalchemy.engine.result.RowProxy'>  
Lipara (settlement)  
...
```

> remarques :  
> la variable *query* est un objet de type `ResultProxy`. Elle possède plusieurs méthodes :  
> `.fetchone()`  
> `.fetchall()`  
> `.fetchmany(*nombre*)`  
> On peut boucler sur les résultats des méthodes de type `fetch__()`  
> Les résultats sont des `RowProxy` qui se comportent comme des dictionnaires, qui prennent comme clée de dictionnaire des noms de colonnes.  

#### Requête Python vers MySQL sans SQLalchemy
...'est compliqué !  
On fait ça avec le système MySQLdb, qui est proche de la manière dont fonctionne MySQL mais qui rend la formulation des requête très compliquée. En plus, si on migre vers un autre système SQL, les requêtes ne seront plus valables.

``` python
import MySQLdb
db = MySQLdb.connect(
    user="gazetteer_user",
    passwd="password",
    db="gazetteer"
)
cursor = db.cursor()  #ce couple de commande est toujours le même, si ce n'est la requête qui change
cursor.execute("SELECT * FROM place")
for result in cursor.fetchall(): # pour chaque résultat dans cursor.fetchall
    print(result) #result sera égal à mon dernier résultat dans la boucle
print(type(result))
db.close() # on ferme la transaction avec la base de données
```
> Il n'est pas utile de comprendre cette syntaxe, pour python, il suffit de l'apprendre.  

> commentaire sur le code :  
- On importe le module MySQLdb
- On se connecte à MySQL via la fonction connect() du module MySQLdb
    - On stocke cette connection dans la variable db
- On crée un curseur qui nous permettra de réaliser des requêtes en faisant db.cursor()
      - On stocke ce curseur dans la variable cursor
- On exécute une requête en utilisant la méthode .execute() de l'objet stocké dans cursor
      - cursor va exécuter en fond la requéte
      Attention: on ne stocke pas le résultat d'exécute
- On boucle sur le résultat de la méthode .fetchall() de cursor
      - Les résultats sont des tuples comprenant les valeurs de la base de données dans l'ordre de définition de ses champs
      - On affiche ces résultats via print()
- On clôt la connection
