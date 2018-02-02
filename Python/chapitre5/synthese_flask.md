# python
## Chapitre 5 (suite)

---
fonctions et commandes :  
===

- **paramétrer la réponse serveur dans le script de l'application :** `app.route()`. On donne entre `()` la valeur qui doit s'afficher dans l'url. `app.route()` retourne une valeur qui permet de configurer la réponse serveur. cf. plus bas.  
- **insérer une valeur de variable au sein d'un template :** `render_template`. On donne entre `()` le chemin relatif vers le template, puis nom_de_variable="valeur_de_variable". Cette valeur peut être une variable, une valeur, ou un chemin vers une valeur dans un dictionnaire ou une liste. *Attention :* `render_template` doit être importé au début du script de l'application.  
- **générer une url dans un template :** `url_for()`. Cette fonction est insérée dans un template de la même manière qu'une variable (entre `{{ }}`). On donne entre `()` les éléments qui permettent de composer l'url : une ou plusieurs valeur, des variables ou des chemins dans un dictionnaire ou une liste.  

---

### Flask

`Flask` est un framework pour le développement d'applications web en Python. (Il existe aussi `Django`, son concurrent, qui est plus utilisé mais qui ne convient pas à des débutant ni à des petits projets). Flask est un package python disponible au téléchargement via [`PyPI`](https://pypi.python.org/pypi) (**Py** thon **P** ackage **I** ndex) et qui s'installe via la commande `pip install flask`.

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

##### route (vs. URL)
Quand on développe un site, on ne définit pas une url complète mais seulement le chemin.  
On peut donner plusieurs `@app.route` dans un même script.  

`app.route()` permet de configurer l'url qui doit être rendue en réponse à une réquête précise, ainsi que la page elle-même. En effet, `app.route()` retourne (toujours ?) aussi une valeur qui sert à construire la page. Cette valeur peut être seulement du texte, un code html, ou un chemin vers un template.

> cf. la section "Routing" de [Flask Quickstart](http://flask.pocoo.org/docs/0.12/quickstart/)

*Petit épiphanie : les fonctions que l'on encode (et les templates) réagissent à l'url que l'on tape ! C'est ça notre requête, de type GET généralement. Ce que l'on paramètre avec @app.route, c'est la manière dont la fonction réagit à la requête URL que le serveur reçoit.*  

---

#### Les templates
Les templates sont des fichiers html, xml ou équivalents qui sont pris en compte par le frameworks, complétés par des informations fournies, pour générer les réponses du serveur.  
Les éléments de templates sont rangés dans un dossier `templates` au sein du dossier principal de l'application. Une bonne pratique de nommage des templates consiste à utiliser des sous-dossiers pour les éléments commun/de même responsabilité *(c'est-à-dire ?)*.  

##### composition et héritages dans les templates

###### les blocs (extends)
La gestion des héritages permet d'éviter de répéter des morceaux de code et de simplifier leur modification.  
La page doit donc être pensée comme un conteneur dont les éléments sont constants, qui reçoit des éléments propres à chaque page (corps). Cette manipulation se fait en deux temps :  
- `côté conteneur.html` : Les blocs sont définis dans un fichier html qui fait office de conteneur à l'aide des éléments `{% block nom_de_bloc %}` et `{% endblock %}`.
- `côté template (corps)` : on commence par une ligne qui "étend" le contenu html du conteneur (`{% extends "conteneur.html" %}`), puis la définition du contenu du corps. Attention, il n'y a pas d'élément de type *{% endextends %}*.

> l'image derrière "extend" n'est pas très claire, mais on peut imaginer qu'il s'agit d'une sorte de milestone qui signale que le code qui suit cet élément doit être "étendu" entre un élément {% block nom %} et un élément {% endblock %} présent dans le fichier cible indiqué.

Cela donne les deux éléments suivants :  
**templates/conteneur.html**
``` html
<html>
    <head>
        <title>Gazetteer</title>
    </head>
    <body>
        <div><h1>Bienvenue sur le Gazetteer</h1></div>
        <div>{% block corps%}{%endblock%}</div>
    </body>
</html>

```

**templates/accueil.html**
``` html
{% extends "conteneur.html" %}
{% block corps %}
Il y a {{lieux|length}} enregistrés :
<ul>
    {% for lieu_id, lieu in lieux.items() %}
        <li><a href="{{url_for('lieu', place_id=lieu_id)}}">{{lieu.nom}}</a></li>
    {% endfor %}
</ul>
{% endblock %}
```

Il est possible d'étendre plusieurs blocs dans un seul conteneur, il suffit de déclarer l'ensemble des blocs, et de leur donner un nom différent.  

###### les includes
Plutôt que d'`étendre` un ensemble d'éléments, on peut choisir de simplement l'`inclure` dans la page. Cela permet de ne pas avoir à multiplier les squelettes principaux ou quand un ensemble de sous-éléments se répète.  
Les pages doivent donc être composées comme suit :  
1. un ensemble de pages (donc des fichiers qui commencent par {% extends (...) %})
2. des conteneurs étendus par ces pages
3. des sous-éléments incrustables dans les conteneurs ou les pages

On utilise `{% include "chemin/vers/inclusion.html" %}`. Comme `extends`, `include` ne fait pas appel à un élément *{% endincludes %}*.  

Une inclusion suit la même logique que le bloc, mais elle s'en différencie dans le sens où on l'inclusion se fait du coté du conteneur (et va chercher les morceaux à ajouter), alors que le bloc s'étend sur une page vers laquel on l'envoie (avec {% extends nom_du_fichier.html %}). Le `include` fonctionne vraiment comme un copier-coller.  

*exemple :*  
**conteneur.html**
``` html
<html>
    <head>
        <title>Gazetteer {%block titre %}{%endblock%}</title>
        {% include "partials/metadata.html" %}
    </head>
    <body>
        <div><h1>Bienvenue sur le Gazetteer</h1></div>
        <div>{% block corps%}{%endblock%}</div>
    </body>
</html>

```

**partials/metadata.html**
``` html
<meta name="description" content="Gazetteer formidable développé par l'Ecole Nationale des Chartes">
<meta name="keywords" content="Gazetteer,Chartes,Ecole,Topographie,Dictionnaire,Topologie">
<meta name="author" content="Thibault Clérice">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```
> remarque : ici l'ensemble des fichiers qui doivent être "inclus" est rangé dans un dossier "partials".


##### assets et statiques
Les `assets` s'opposent aux `templates` en ce qu'ils sont des éléments statiques, qui n'induisent pas de calcul ou de remplacement. On inclut dans le dossier principal de l'application un dossier `static/` dans lequel on ajoute les dossiers de types assets: `css`, `fonts`, `js`, etc. Ils permettent donc de personnaliser l'aspect de l'application en ajoutant les éléments nécessaires aux éléments de type html.  

##### Jinja
`Jinja` est le nom du système de templates utilisé par Flask. On peut néanmoins l'utiliser sans Flask.  

#### Variables
Dans un template, il existe des `variables` qui sont signalées à l'aide d'un **nom de variable** placé entre `{{ }}`.  
*exemple :*  
``` html
<html>
    <head>
        <title>{{nom}}</title>
    </head>
    <body>Bienvenue !</body>
</html>
```
> dans l'exemple suivant, "nom" est une variable.

###### render_template
On indique dans le script de l'application ce qui devra remplacer la variable. Il faut pour cela importer, au préalable, la fonction `render_template`.  

``` Python
from flask import Flask, render_template

app = Flask("Application")

@app.route("/")
def accueil():
    return render_template("accueil.html", nom="Gazetteer")
```

On peut également définir un dictionnaire dans le script, *exemple*:  
``` python
from flask import Flask, render_template

app = Flask("Application")

lieux = [
    {
        "nom": "Col. Lugdunum",
        "moderne": "Lyon",
        "latlong": [45.762095775, 4.822438025],
        "type": "ville",
        "description": "Col. Lugdunum was a Roman military colony from 43 BC and a major center in Gaul. Marcus "
                       "Agrippa was involved in its expansion and two Roman emperors, Claudius and Caracalla, "
                       "were born there."
    },
    {
        "nom": "Samarobriva Ambianorum",
        "moderne": "Amiens",
        "type": "ville",
        "description": "An ancient place, cited: BAtlas 11 C3 Samarobriva Ambianorum ",
        "latlong": [49.8936075, 2.297948]
    }
]


@app.route("/")
def accueil():
    return render_template("accueil.html", nom="Gazetteer", lieux=lieux)


@app.route("/place/<int:place_id>")
def lieu(place_id):
    return render_template("place.html", nom="Gazetteer", lieu=lieux[place_id])
```

#### Conditions
On peut prendre en compte des `conditions` dans les templates. Elles sont données entre `{% %}`. La syntaxe complète pour exprimer une condition est la suivante :  
- `{% if *condition* %}`
- `{% elif %}` *(optionnel)*
- `{% else %}` *(optionnel)*
- `{% endif %}`

Sous chacun de ces blocs de condition, on affiche le code que l'on souhaite afficher.  

#### Boucles
On peut générer des boucles dans les templates de la même manière que pour les conditions :  
- `{% for *valeur* in *conteneur* %}`
- `{% endfor %}`

#### url_for
La fonction `url_for` permet de générer un url. `url_for` est utilisé dans le template, il y est inséré de la même manière qu'une variable, mais complété d'éléments qui permettent de générer l'url. Dans l'exemple, ces arguments sont des éléments tirés d'un dictionnaire :  
``` html
{% for lieu_id, lieu in lieux.items() %} # c'est un dézipage ici
        <li><a href="{{url_for('lieu', place_id=lieu_id)}}">{{lieu.nom}}</a></li>
    {% endfor %}
```

#### particularité concernant la syntaxe des dictionnaires
En python, on écrit normalement, pour un dictionnaire :  
> dictionnaire["clef1"][0]["etc"]
Or dans les templates, on peut se contenter d'écrire :
> dictionnaire.clef1[0].etc
Il n'y a aucune différence entre les deux syntaxes.
