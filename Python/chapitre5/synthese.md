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
