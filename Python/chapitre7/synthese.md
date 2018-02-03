# Python
## Chapitre 7 : Modules et Packages, gestion des chemins, gestion des erreurs

### Commandes et fonctions
**Gérer et créer des chemins de fichiers :**
- `os.path.dirname()` : cf. détails sur le package `os`
- `os.path.abspath(__file__)` : cf. détails sur le package `os`
- `os.path.join()` : cf. détails sur le package `os`

**Gérer des erreurs**
- `try: / except:` cf. détail sur ces blocs pour les paramètres.



### Modules et packages
La `modularisation`, c'est le fait de diviser les fichiers python de manière à simplifier le code. Un ensemble de `modules` forme un `package`.

On peut importer un package entier ou un module du package avec les commandes :
- `import nom_module`
- `from nom_module import nom_élément`

Un module est un fichier py (.py) contenu dans un dossier. Il peut contenir un ou des variable(s), une ou des fonction(s), des classes, etc.

#### Créer un package
Pour créer un package, il faut qu'un fichier \_\_init\_\_.py soit présent dans un dossier contenant le(s) module(s).

`__init__.py` contient les éléments que l'on peut importer depuis le module/package. Il peut aussi directement contenir une variable.
> si __init__.py setrouve dans un dossier exemple et contient le texte "ma_variable = 0"  
> quand on écrit dans un fichier "from exemple import ma_variable  
> on récupère la valeur "0". On utilise donc un élément listé dans __init__.py en convoquant le nom du dossier qui le contient.

Un package peut contenir plusieurs modules. Pour cela, on ajoute des fichier .py dans le dossier (package), en plus du fichier \_\_init\_\_.py. S'ils ne sont pas présents dans \_\_init\_\_.py, ce sont des `sous-modules`, que l'on convoque en ajoutant leur nom, séparé d'un `.` à la suite du nom du package.  
> Si j'ai un dossier "exemple" qui contient un fichier __init__.py vide, et un fichier application.py dans lequel se trouve la variable app  
> j'importe le module app, en faisant :  
> from exemple.application import app

Il est important d'utiliser cette syntaxe et de ne pas viser directement un sous-module en donnant seulement le nom du package car si deux sous-modules ont le même nom, c'est uniquement la variable appelée en dernier qui sera utilisée par le programme.   

Les imports de ressources dans des modules peuvent être construits de trois manières :
- `import package.module` : appelée via `package.module.ressource`
- `from package import module` ; appelée via `module.ressource`
- `from package.module import ressource`; appelée via `ressource`

En cas de conflit, il y a deux solutions :  
- changer de méthode d'import
- renommer la ressource importée (en ajoutant `as nouveau_nom` après l'import), mais au détriment de l'information d'origine.

Un package peut contenir un package, il suffit qu'un sous-dossier de package contienne lui aussi un fichier \_\_init\_\_.py.  

#### Import relatif
Les imports permettent de faire interagir les modules au sein d'un ou plusieurs packages. On navigue entre ces packages à l'aide d'une syntaxe de chemins relatif :  
- `.` : dossier courant
- `..` : dossier parent
- `...` : dossier grand-parent
- etc.

Dans le cas de la configuration suivante :
gazetteer/
   |- __init__.py
   |- application.py
   |- modeles/
       |- __init__.py
       |- donnees.py
       |- utilisateurs.py
run.py

En se plaçant depuis modeles.donnees, on pourra par exemple utiliser ces commandes suivantes :
- `from ..application import nom_dapplication`
- `from .utilisateurs import mon_utilisateur`

#### Recommandations
Pour une application, il vaut mieux découper les packages selon la répartition suivante :
- les modèles de données (en séparant si possible les modèles de données scientifiques et les modèles de données utilisateurs)
- les routes
- la création de l'application

Par ailleurs, on aura un dossier organisé de la manière suivante :  
- dossier_app/
  - \_\_init\_\_.py
  - app.py
  - routes.py
  - modeles/
    - etc
  - static/
    - etc
  - templates/
    - etc
- run.py
- path.py

On lance donc l'application depuis `run.py`, en important en début de code `app.py` :  

**run.py :**
``` Python
from gazetteer.app import app

if __name__ == "__main__":
    app.run(debug=True)
```

### Gérer les interactions dans le cadre d'une application

`Flask()` prend deux paramètres : `templates_folder`et `static_folder` où on peut indiquer le chemin vers les dossiers `templates` et `static`.  
Le problème c'est que si on exécute l'application depuis run.py et non plus depuis app.py, python/flask essaie de recomposer le chemin depuis le fichier qui a été exécuté. On aboutit donc à une erreur si on définit le chemin depuis app.py.  

**app.py :**
```python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

# voir "Retrouver le chemin d'un fichier de manière automatique"
import os
chemin_actuel = os.path.dirname(os.path.abspath(__file__))
templates = os.path.join(chemin_actuel, "templates")
statics = os.path.join(chemin_actuel, "static")

# on fournit en effet à Flask() des informations pour template_folder
# et static_folder, qui sont les valeurs des variables templates et
# static renseignné grâce au packahe os :
app = Flask(

    "Application",
    template_folder=templates,
    static_folder=statics
)


# On configure la base de données
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://gazetteer_user:password@localhost/gazetteer'
# On initie l'extension
db = SQLAlchemy(app)

# attention à la place de l'import d'autres packages qui importent aussi
# le fichier en cours, pour ne pas générer de boucles infinies.
from .routes import lieu, accueil
```

#### Retrouver le chemin d'un fichier de manière automatique
Le code suivant permet de mettre dans les variables `chemin_actuel` et `templates` les chemin vers le dossier de l'application et le dossier *templates*.  

``` python
import os

chemin_actuel = os.path.dirname(os.path.abspath(__file__))
templates = os.path.join(chemin_actuel, "gazetteer", "templates")
```
**Explications :**  
- `os` est un package qui permet de faire des opérations liées au système.  
- `os.path.dirname` permet de récupérer le nom de dossier du résultat de `os.path.abspath()` ; c'est-à-dire le chemin absolu vers le dossier qui contient le fichier que l'on est en train d'exécuter.  
- `os.path.abspath(__file__)` récupère le chemin absolu vers le fichier courant.  
- `__file__` signifie "le fichier courant" (en python), c'est-à-dire celui qui est exécuté.
- `os.path.join()` permet de créer un chemin en joignant plusieurs éléments (ici un chemin absolu, puis deux chaînes de caractères). `os.path.join()` s'adapte au système d'exploitation utilisé : sous Mac et Linux, la jointure se fait via le caractère `/`, tandis que sous Windows, elle se fait via `\`.

#### Chronologie des imports
Il est important d'importer les éléments dans le bon ordre, sinon on risque de se retrouver dans un boucle infinie. Dans le fichier app.py, les routes sont importées à la fin du script. Flask reconnaît ensuite qu'il a déjà fini d'exécuter un script et ne risquera pas de tomber dans une boucle si on import à nouveau app par la suite.  


### Gestion des erreurs
Les erreurs empêchent le script de tourner ou bien l’interrompent. On peut les éviter en prévoyant des cas de figure avec "if / else", qui consomment peu de mémoire, mais dans certains cas, il vaut mieux utiliser `try / except`.  

#### try / except
Le bloc `except` est obligatoire si un `try` est ouvert. Il ne s'exécute que si une erreur apparaît, donc si quelque chose n'a pas fonctionné dans le bloc `try`.  
*Remarque :* `try` et `except` sont tous les deux suivis de blocs indentés.

``` python
list = ["1", "2", "2"]
try:
  print(liste[3])
except:
  print("ça ne marche pas")
```

#### Gestion personnalisée d'erreurs spécifiques
Pour identifier des erreurs spécifiques qui sont survenues, on peut créer plusieurs éléments `except` après un `try` en les faisant suivre directement pas le ou les noms des erreurs que l'on veut gérer avec le bloc. Si une erreur n'a pas été prévu, un message d'erreur s'affiche, comme si on n'avait pas de bloc "try / except".  

**Exemples de noms d'erreur :**
- IndexError
- KeyError
- ZeroDivisionError
- AssertionError (test unitaire)
- Exception ("l'erreur-mère")
> cf. pour la liste complète des erreurs : https://docs.python.org/2/library/exceptions.html

#### Récupérer une erreur
On peut intégrer le message d'erreur dans une variable en utilisant `as + nom_variable` après `except`. Pour relancer l'erreur, on utilise `raise + nom_variable`.  

``` python
try:
    print(liste[3])
except Exception as ma_variable_erreur:
    print("Je me suis trompé !")
    raise ma_variable_erreur
```
ma_variable_erreur contient :  
```
--------------------------------------------------------
IndexError                                Traceback (most recent call last)
<ipython-input-23-61108c1cc242> in <module>()
      3 except Exception as ma_variable_erreur:
      4     print("Je me suis trompé !")
----> 5     raise ma_variable_erreur

<ipython-input-23-61108c1cc242> in <module>()
      1 try:
----> 2     print(liste[3])
      3 except Exception as ma_variable_erreur:
      4     print("Je me suis trompé !")
      5     raise ma_variable_erreur

IndexError: list index out of range
```

Cela permet de gérer d'important corpus de fichier ou une grande quantité de tâche et d'identifier automatiquement toutes les erreurs pour pouvoir traiter les fichiers concernés un par un, ou autrement.  
