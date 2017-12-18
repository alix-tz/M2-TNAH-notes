# Python

## Chapitre 2

### Fonctions et méthodes de base
- **Ouvrir un fichier stocké localement :** `variable = open('chemin/nom.fichier')`.  
On pourrait préciser un encodage, après une `,` à la suite du nom du fichier. Exemple : `variable = open('chemin/nom.fichier', encoding="latin")`.

- **Fermer un texte ouvert avec la fonction/méthode `open()` :** `fichier_ouvert.close()`.  
Il est important de fermer un fichier car en cas de plantage, s'il est toujours ouvert cela peut le vider de son contenu.

- **Ouvrir un fichier de manière *safe* :** avec déclaration `with ___ as ___ :`.  
*Exemple :* `with open ("chemin/fichier.extension") as variable:`. Cela équivaut à faire en une seule commande `open()` et `.close()`. `With` fonctionne comme `if` :  il est suivi d'un bloc indenté qui contient les commandes à exécuter avant de fermer le fichier. Il est utile d'attribuer le contenu du fichier à une autre variable qui pourra ensuite être utilisée une fois le bloc fermé.

- **Afficher le contenu textuel d'un fichier stocké localement :** `print(fichier_ouvert.read())`.  
`read` est une fonction qui permet de lire le contenu d'un fichier dans Python; elle fonctionne avec les objets `TextWrapper`.

- **Générer un test unitaire :** `assert ___ , ___`.  
Cette fonction est suivie d'un test d'égalité ou une condition et, après une `,` d'un message d'erreur qui doit s'afficher (entre `" "`).

- **Compter des occurrences dans un texte :** `count()`.  
Cette fonction prend en argument l'élément ou la chaîne que l'on souhaite compter. Exemple : `variable = texte.count("e")`.  
*Remarque : il peut être utile d'utiliser la méthode split() au préalable.*

- **transformer une liste en set :** `set()`.  
Cette fonction permet de générer une nouvelle liste particulière (entre `{}`) qui contient tous les éléments de la liste précédente une et une seule fois. Contrairement à une liste, un set n'est pas ordonné : on ne peut pas utiliser l'indexation.  

- **ajouter un élément à un set :** `add()`.  
*Remarque : on utilise rarement cette fonction.*    

- **Définir une fonction :** `def nom_fonction(params)`.  
Les paramètres sont optionnels, mais les parenthèses doivent toujours être écrites (même si elles restent vides). Les paramètres sont séparés par des `,`. La ligne de définition de la fonction est suivie d'un `bloc indenté contenant le code de la fonction`. Il peut se terminer par un `return` qui permet de renvoyer la valeur de renvoi.

- **transformer une chaine de caractères en minuscule ou en majuscule :** `.lower()` ou `.upper()`.  

- **remplacer des caractères par d'autres caractères :** `.replace()`.  
On donne en premier argument le caractère à remplacer et en deuxième argument le nouveau caractère. On peut utiliser `replace` pour surpprimer un caractère dans une chaine : pour cela il suffit de le remplacer par `""`.  
*Remarque : si on veut remplacer plusieurs caractères qui ne sont pas forcément à la suite, il faut utiliser plusieurs `replace()`. On peut les mettre à la suite sur la même ligne puisqu'ils renvoient systématiquement une nouvelle chaîne de caractères.*  
*Remarque 2 : pour supprimer plusieurs signes de ponctuation, on peut faire appel à une liste de ces signes, et à une boucle.*

- **créer un intervalle :** `range()`.

- **écrire dans un document ouvert :** `.write()`.  
On met entre parenthèses le texte que l'on souhaite inscrire dans le document. Il n'est pas possible d'ajouter du texte au document sans réécrire par-dessus : il faut donc récupérer le texte du document, puis ajouter le sien avant de réécrire. 
----

### Traitement du texte

#### L'ouverture d'un fichier
La fonction open permet d'attribuer un fichier enregistré localement dans une variable. Mais si on tente de l'afficher (`print`), cela n'affiche pas le texte mais une information sur la manière de lire le fichier, ainsi que son encodage.

#### Traitement du texte
Les objetcits du traitement du texte en sciences humaines sont notamment de nettoyer les données pour ensuite les analyser, convertire une collection de textes en un format différent, ... .

#### Écrire dans un document
Lorsqu'on utilise `open()`, on peut préciser en attribut : `mode="w"` pour se mettre en mode écriture. `mode="r"` permet de se mettre en mode lecture.

----

### Les Fonctions
Une fonction est composée de `paramètres/arguments` (aussi appelés args ou params). Elle renvoie une valeur, appelée `valeur de retour` (return value).
On peut créer ses propres fonctions.
```
def fonction_avec_parametres(parametre1, parametre2, parametre3):
    # Le code de la fonction

def fonction_sans_parametre():
    # le code la fonction
```
Exemple de fonction qui prend en paramètres un élément à chercher, et un emplacement où le chercher :
```
def compter_dans_une_autre_chaine(aiguille, botte_de_foin):
    mots_de_foin = botte_de_foin.split()
    nombre_daiguilles = mots_de_foin.count(aiguille)               
    return nombre_daiguilles  
```

#### `Fonctions` et `Méthodes`
Une méthode se différencie d'une fonction sa syntaxe. Alors qu'une fonction s'écrit `nom_fonction(paramètres)`, une méthode s'écrit de la maniètre suivante : `variable.methode(paramètres)`.

#### Scope et portée
Une variable qui existe dans une fonction est séparée du reste du code : on ne peut pas faire appel à une variable utilisée dans la définition de la fonction ailleurs quand dans cette même définition.

#### Paramètres optionnels
Il est possible en Python de préciser des paramètres par défaut : s'ils ne sont pas précisé au moment de la convocation de la fonction, ce sont ces paramètres par défaut qui seront utilisés.  
syntaxe :
```
def fonction (param, param="chaîne qui fait param par défaut")
```

Il est également possible de donner des paramètres dans un ordre différent de celui qui a été donné au moment de la définitin de la fonction. On appelle cela les `named arguments`/`keyword argument`/`kwargs`.  



#### Documenter une fonction
Il existe plusieurs normes/méthodes pour documenter une fonction : documentation Google, [reStructuredText (rST)](https://docs.python.org/devguide/documenting.html).  

Exemple de doc en RST :  
```
def comptage2(mots):
    """ Compte et stocke le décompte de chaque mot dans une liste de mots

    :param mots: Liste de mosts
    :type mots: list
    :returns: Dictionnaire où les clefs sont les mots et les valeurs le nombre d'occurrences
    :rtype: dict
    """
```

Explication :
- la doc est donnée entre `"""` (commentaire multilignes)
- la 1ère ligne donne la description de ce à quoi sert la fonction
- `:param nom_du_paremetre:` décrit ce qui est attendu
- `:type nom_du_parametre:`donne le type attendu (`list`, `int`, `str`, `dict`, `TextIOWrapper`, ...)
- `:retuns:` est donné après tous les paramètres et décrit ce qui sera renvoyé par le `return`
- `:rtype:` indique le type du `return`
- *remarque : on peut se contenter de préciser les type uniquement lorsque c'est nécessaire*  
