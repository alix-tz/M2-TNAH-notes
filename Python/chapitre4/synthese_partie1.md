# Python  

## Chapitre 4  

### Fonctions et méthodes de base
- **importer un package** : `import nom_de_package`.  
- **lire le contenu d'un dossier** : `dir(nom_du_dossier)`.  
- créer un tuple combinant un index et un élément d'une liste sur laquelle on itère : `enumerate(liste_parcourue)`.  

- **lire un fichier CSV :** `csv.reader()`. Plus d'informations plus bas.  
- **écrire dans un fichier :** `csv.writer()`. Plus d'information plus bas.  

- **lire un fichier JSON :** `json.load()` ou `json.loads()`. Plus d'informations plus bas.  
- **écrire un fichier JSON :** `json.dump()` ou `json.dumps()`. Plus d'informations plus bas.

- **remplacer automatique des emplacements signalés par des accolades par des valeurs :** `format()`. Plus d'informations plus bas.

### les fichiers CSV
Un fichier `CSV` est un fichier de tableau simplifié au maximum. Il est encodé en plein texte (il peut être lu par n'importe quel éditeur de texte), il utilise la `virgule`, le `point-virgule` ou la `tabulation` (tsv) comme séparateur de colonnes. Une ligne dans le fichier équivaut à une ligne de tableau.  

### les fichiers JSON  
Le format JSON est apparu au début des années 2000 pour simplifier la communication des données "simples" sur le web. Il est présent dans 99% des requêtes du web. C'est un format privilégié pour communiquer entre client et serveur une fois la page affichée.  
L'objet racine d'un fichier JSON peut être un dictionnaire ou une liste, et il peut contenir des listes, des dictionnaires, des booléens, des chaînes de caractères, des entiers et des décimaux, des objets vides (null ou None).  

### Packages
Les packages sont des `library` qui permettent d'ajouter des fonctions à Python, en plus des fonctions de base (ex: print, etc).  
Un package est un ensemble de modules qui contiennent des outils tels que des fonctions. Pour utiliser un package, on doit l'importer entièrement, ou importer l'un des modules.  

Pour voir la documentation sur les packages python : (https://docs.python.org/3.5/library)

#### Le Package CSV
##### Reader()
`reader()` renvoie une liste qui correspond aux lignes du documents CSV lorsque l'on itère dessus. Pour utiliser `reader`, il faut avoir ouvert un fichier en mode lecture : `with open("fichier.csv") as csvfile:`.

**Interprétation de la documentation.**  
  - `csv.reader()` prend comme premier argument un fichier ouvert  
  - il peut prendre un `dialect` ou des paramètres qui ne sont pas développés par la documentation de la fonction elle-même : dans `**fmtparams`, `**` signifie qu'il existe d'autres paramètres optionnels nominatifs.  
  - il arrive que, sans aller dans Dialects and Formatting Parameters, nous avons deux exemples de ces paramètres dans l'exemple :  
    - `delimiter` qui semble être un délimiteur de colonne.  
    - `quotechar` qui semble être un "encapsulateur" permettant d'échapper les délimiteurs  

**Exemple :**  
``` python
import csv
with open('data/csv/eggs.csv', newline='') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    for row in spamreader:
        print(row)
        print(', '.join(row))
# Spam, Spam, Spam, Spam, Spam, Baked Beans
# Spam, Lovely Spam, Wonderful Spam
```

##### Enumerate
`enumerate` permet de renvoyer un tuple sur une valeur simple afin de compter l'index de l'objet parcouru.  

**exemple :**
``` python
couleurs = ["vert", "rouge", "bleu"]

for index, couleur in enumerate(couleurs):
    print(str(index)+ " = " + couleur)

# output :
# 0 = vert
# 1 = rouge
# 2 = bleu
```

##### writer()
`csv.writer` permet d'écrire des informations en csv à l'intérieur d'un fichier. Pour utiliser cette fonction, il faut donc avoir préalablement ouvert un fichier (`with open("fichier.csv", mode="w") as file:`) en mode écriture (`, mode="w"`).

**Interprétation de la documentation.**  
- `csv.writer()` prend comme premier argument un fichier ouvert en mode écriture
- il peut prendre un `dialect` ou des paramètres qui ne sont pas développés par la documentation de la fonction elle-même : dans `**fmtparams`, `**` signifie qu'il existe d'autres paramètres optionnels nominatifs.
- il arrive que, sans aller dans *Dialects and Formatting Parameters*, nous avons deux exemples de ces paramètres dans l'exemple :
    - `delimiter` qui semble être un délimiteur de colonne.
    - `quotechar` qui semble être un "encapsulateur" permettant d'échapper les délimiteurs
    - `quoting` qui d'après la documentation correspond à un mode de citation minimal (Utilisation des `quotechar` que lorsque cela est nécessaire. C'est par ailleurs la valeur par défaut : https://docs.python.org/3.5/library/csv.html#csv.Dialect.quoting )
- on écrit une ligne en utilisant la méthode `.writerow()` qui prend comme argument une liste
- on utilise `.writerow()` autant de fois que nécessaire

**Exemple :**  
``` python
import csv
with open('data/csv/eggs.csv', 'w') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    spamwriter.writerow(['Spam'] * 5 + ['Baked Beans'])
    spamwriter.writerow(['Spam', 'Lovely Spam', 'Wonderful Spam'])
```

#### Le package json
##### lire
Dans le package json, deux fonctions permettent de lire un fichier json : `load()` et `loads()`. La premier prend une instance de fichier en cours de lecture, tandis que la seconde prend une chaîne de caractères ('s' fait référence à 'str').  

``` python
import json

# A partir d'un wrapper de fichier
with open("data/json/brecht.json") as f:
    print(json.load(f))

# A partir d'une chaîne
with open("data/json/brecht.json") as f:
    chaine = f.read()
    print(json.loads(chaine))
```

##### .format()
Cette méthode s'utilise sur une chaîne de caractères, elle remplace les valeurs entre accolades à l'intérieur de cette chaîne.
``` python
"{} est en premiere position, {} en deuxieme".format(1, 2)
# '1 est en premiere position, 2 en deuxieme'

"{0} est en premiere position, {1} en deuxieme, et {0} était bien le premier".format(1, 2)
# '1 est en premiere position, 2 en deuxieme, et 1 était bien le premier'

# L'indentation n'est pas obligatoire. Mais elle rend le code plus lisible
"{nom} a écrit le poème '{titre}'. {nom} est {nationalite}.".format(
    nom="Brecht", titre="Solution", nationalite="allemand"
)

# "Brecht a écrit le poème 'Solution'. Brecht est allemand."
```

##### Écrire
Le package json propose là aussi deux fonctions : `json.dump()` et `json.dumps`, que l'on utilise en fonction de l'objectif d'écriture : soit une chaîne de caractères, soit un fichier.  
``` python
# Avec une chaîne de caractère comme objectif
chaine_json = json.dumps(mon_objet)
print(chaine_json)
print(type(chaine_json))

# Avec un fichier comme objectif
with open("data/json/youtube.exemple.json", "w") as f:
    json.dump(mon_objet, f)

# On vérifie que cela marche bien :
with open("data/json/youtube.exemple.json") as f:
    chaine = f.read()
    objet_recharge = json.loads(chaine)
    print(objet_recharge[0]["titre"])
```
#### Approfondir :
Si les fonctions `csv.reader()` et `csv.writer()` sont sympathiques, les fonctions `DictReader` et `DictWriter` le sont beaucoup plus : elles stockent les noms de colonnes !

#### Remarque : 
PARCER signifie lire un fichier dans un format quelconque, pour qu'on puisse ensuite interroger par le biais de l'ordinateur. = lire un fichier et le comprendre en n'importe quel langage informatique. 
