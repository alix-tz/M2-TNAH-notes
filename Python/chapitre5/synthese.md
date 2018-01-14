# Python

## Chapitre 5

### Fonctions et méthodes de base

### Notion de programmation orientée objet
**Vocabulaire à comprendre :**  
- classe = un plan
- objet = réalisation du plan
-  méthode = fonction propre à l'objet
- attribut = clef/attribut/propriété de l'objet
- instaciation = création d'un objet à partir d'une classe  

#### Classe, instance de class (objet)
Une classe d'objet est une grande catégorie de valeurs qui sont régies par un ensemble de lois similaires et qui peuvent fonctionner de telle ou telle manière. `str` et `list` sont par exemple des classes. Quand on utilise la fonction `type()` sur un élément, on peut connaître la classe de cet élément.  
La `classe` est une catégorie de valeurs en programmation. Les `instances de classes` sont elles appelées des objets. Par exemple, la chaîne "hello world" est une instance de la classe `str`.  

**exemples de classes :**  
- dict
- bool
- int
- tuple
- IOWrapper
- Response
- DictReader
- DictWriter

#### Méthodes
Les objets peuvent posséder leurs propres fonctions : ce sont les méthodes. Elles diffèrent des fonctions habituelles par leur syntaxe : une méthode est toujours appelée après un `.` et elle est uniquement accessible pour les classes qui la possèdent, sinon, on obtient un erreur d'attribut :  
``` python
---------------------------------------------------------------------------
AttributeError                            Traceback (most recent call last)
<ipython-input-3-698fffd38b67> in <module>()
----> 1 [1,2,3].replace(1, 3)

AttributeError: 'list' object has no attribute 'replace'

```

#### Attributs
Un objet peut également avoir des attributs. Ce sont des propriétés de ces classes qui fonctionnent comme des variables ou des clés de dictionnaires. Les attributs diffèrent des méthodes dans leur syntaxes : ils ne sont pas suivis par des `()`.  

``` Python
print(objet_exemple.attribut_exemple)
objet_exemple.attribut_exemple = 1
print(objet_exemple.attribut_exemple)

# output
# 5
# 1
```

#### Créer un objet (instancer un objet)
Pour créer un objet qui ne fait pas partie des types principaux, on utilise le nom de la classe, avec les paramètres de base dont elle a besoin. C'est similaire à l'utilisation d'une fonction.  
cf. plus tard dans le cours.  


### Flask
`Flask` est un framework pour le développement d'applications web en Python. (Il existe aussi `Django`, son concurrent, qui est plus utilisé mais qui ne convient pas à des débutant ni à des petits projets). Flask est un package python disponible au téléchargement via [`PyPI`](https://pypi.python.org/pypi) (**Py**thon **P**ackage **I**ndex) et qui s'installe via la commande `pip install flask`.  

> Miguel Grinberg a réalisé un tutoriel pour flask qu'il est utile de consulter : https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world.


Pour des projets perso, il faut créer un environnement virtuel dans lequel on fait tourner Flask, car on risque autrement de créer des conflits entre différents projets qui utilisent différentes versions de Flask.  

#### Application Flask simple
L'exécution de ce fichier permet de créer une page où s'affiche 'hello world' à l'adresse suivante : http://127.0.0.1:5000/ .

``` python
from flask import Flask

app = Flask("Nom de l'application")

@app.route("/")
def index():
    return "Hello world !"
```
```
app.run()
```

**Commentaire sur le code :**  
> Le code suivant définit un site simpliste :
> - on crée une application nommée "Nom de l'application". Le nom est obligatoire dans Flask car il permet d'avoir plusieurs applications tournant sur le même serveur et de les différencier pour le serveur. Le serveur n'étant pas au courant des noms de variable, c'est le nom d'application qui lui sert.
> - on définit une route
>    - en précédant une fonction de `@app.route("url_de_la_route")`
>    - en écrivant une fonction qui renvoie le contenu de la réponse (Ici une réponse en plein texte et non en html
> - on lance un serveur de test via *app.run()*

#### route (vs. URL)
Quand on développe un site, on ne définit pas une url complète mais seulement le chemin.


### Environnement virtuel
Pour créer un environnement virtuel :
- `cd ~` *vous met dans votre dossier utilisateur*
- `mkdir veille-micro-blog` *crée un dossier appelé veille-micro-blog* (**A exécuter une fois seulement**)
- `cd veille-micro-blog` *vous déplace dans ce dossier*
- `python3 -m venv env` *crée un environnement virtuel dans un sous-dossier. Alternative à `virtualenv -p python3 env` (**A exécuter une fois seulement**)
- `source env/bin/activate` *remplace dans votre session de terminal le lien vers le python 3 global par un lien vers le python 3 de votre environnement virtuel*
- `pip install flask` *installe flask dans votre environnement virtuel* (**A exécuter une fois seulement**)  

Il n'y a donc que deux commandes qui doivent être utilisées à chaque fois :
```sh
cd ~/veille-micro-blog
source env/bin/activate
```

Pour vérifier que l'on se trouve bien dans un environnement virtuel, on peut généralement se référé au nom indiqué au début de chaque ligne de commande : le nom de l'environnement virtuel se trouve entre parenthèses.  
La commande `which Python` permet d'afficher à quel fichier binaire de Python l'environnement dans lequel on travaille est rattaché.  
