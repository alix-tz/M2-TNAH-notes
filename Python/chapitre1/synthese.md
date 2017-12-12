# Python

## Chapitre 1

### Fonctions de base
- **Afficher : `print()`.** On place entre () :
  + une chaîne de caractère entre `" "` ou `""" """`
  + une variable
  + une opération
  + une suite de variables, de chaînes et d'opération, séparés par des `, ` ou ` + `.  

- ** Calculer la longueur d'une chaîne ou d'une liste : `len()`.** On peut placer cette valeur dans une variable, ou l'afficher à l'aide de print().

- **Découper une chaîne de caractères à partir des espaces : `nom_variable.split()`.**
Lorsque l'on assigne cette formule à une nouvelle variable, cela crée une liste qui contient tous les mots de la chaîne d'origine. *Attention toutefois :* `split()` de sépare pas la ponctuation du reste d'un mot s'ils ne sont pas séparés par un espace.

- **Ajouter des éléments à une liste : `nom_variable.append("ajout")`.** Cela ajoute les éléments les uns à la suite des autres en créant une nouvelle case dans la liste.

- **Enlever un élément d'une liste : `nom_variable.remove("chaîne contenue dans une case de la liste")`.** Si la chaîne que l'on tente de supprimer n'existe pas dans la liste, cela génère une erreur. Il faut que la chaîne soit strictement identique.

- **Remplacer un caractère ou une chaîne de caractères par un(e) autre ** : `replace("old", "new")`. La première occurrence cible le caractère ou la chaîne contenue dans le texte, la deuxième sert à indiquer ce par quoi on la remplace. On peut indiquer seulement `""` pour remplacer par rien.  

- **Trier les éléments d'une liste : `nom_variable.sort()`.**

- **Afficher la liste des clefs d'un dictionnaire : `dictionnaire.keys()`.** Produit un générateur.

- **Afficher les valeurs contenues dans un dictionnaire : `dictionnaire.values()`.** Produit un générateur.

- **Afficher la liste des éléments d'un dictionnaire (clef, valeur) : `dictionnaire.items()`.** Produit un générateur. S'utilise beaucoup avec des tuples :
```
for item in dict.items():
  cle, valeur = item
#permet d'assigner les éléments du tuple (contenus dans item) dans deux variables.
```

---

### Assignation (*assignment*)
L'assignation désigne le fait d'attribuer une `valeur` à une `variable`. On utilise pour cela l'opérateur `=`. Il est fondamental d'utiliser un nom qui a du sens pour nommer la variable.  
On peut définir plusieurs types de variables, dont principalement :
+ une chaîne de caractères : `str`
+ un entier : `int` ; ou un entier long : `long`
+ un nombre à virgule : `float`
+ une liste : `list` (`[]`)
+ un dictionnaire : `dict` (`{}`)
+ un tuple : `tuple` : (`(,);`)

Certains types d'objets sont `immutables` (ex : str), alors que d'autres sont dits `mutables` (ex : list). On ne peut pas utiliser la méthode "append" sur des immutables.

#### Retyper (caster)
Il est parfois nécessaire de redéfinir le type d'une variable. Pour cela, on peut assigner la valeur de cette variable à une autre variable en la précédent d'un type :
```
nombre = 22
chaine = str(nombre)
#chaine contient "22" et pas 22
```

+ str()
+ int()

---

### Manipulation d'une liste
on peut concaténer des listes en utilisant `+`.  

Formulation des listes :
```
liste = [ 1, 2, 3, 4]
liste_vide = []
```

#### Index ponctuel
La première case d'une liste est toujours indexée à partir de `0`. Pour accéder à la dernière case, on peut compter le "nombre de cases -1". Mais on peut aussi, plus simplement partir de la fin en indexant à partir de `-1`.  

#### index de tranche (*slices*)
La tranche se définit en partant de début de la tranche visée, jusqu'à l'index de la case *excluante*, c'est-à-dire avant laquelle la tranche se termine.
```
tranche = "tranche"
print(tranche[0:2])
#Affiche : "tr"
```
Dans l'exemple ci-dessus, on part de tranche[0] (t) et on s'arrête à tranche[2] (a), qui ne fait pas partie de la tranche.

Pour une tranche qui part de zéro ou de -1, on n'est pas obligé de préciser le début de la tranche :
+ `tranche[:3]` affichera **"tra"**
+ `tranche[3:]` affichera **"nche"**

On peut générer des tranches en partant de la fin selon le même principe, tout en notant bien que cela n'inverse pas le sens de lecture de la tranche : elle se lira toujours de gauche à droite :
+ on écrira `tranche[-2:-5]` et non pas `tranche[-5:-2]` ; et cela affichera : **"ach"** (c'est bien la borne à droite de la chaîne qui est excluante, même si elle se situe à gauche lorsqu'on exprime la tranche).

Pour mieux comprendre :  
| Pos    | Neg     |  
| ------ | ------- |   
| t(0)   | t(-7)   |  
| r(1)   | r(-6)   |  
| a(2)   | a(-5)   |  
| n(3)   | n(-4)   |  
| c(4)   | c(-3)   |  
| h(5)   | h(-2)   |  
| e(6)   | e(-1)   |  

#### Manipuler une chaîne de caractères

Il est possible d'accéder individuellement aux différents caractères de la chaîne car elle se comporte comme une liste.
```
variable_mot = "ceci est un mot"
print("variable_mot[0]")
#Affichage : "c"
```
Contrairement à ce qu'il est possible de faire avec une liste, on ne peut pas spécifier une "case" de la chaîne de caractères pour en changer la valeur.
```
#ERREUR :
python = "Pythen"
python[4] = "o"
```

#### Listes imbriquées
Une liste peut contenir une liste, voir des listes imbriquées.
```
liste_imbriquee = [[1,2,3], [4, 5, 6]]
```
+ `liste_imbriquee[0]` affichera `[1,2,3]`
+ `liste_imbriquee[0][0]` affichera `1`
+ `liste_imbriquee[1][2]` affichera `3`

Le principe d’indexation est donc le suivant : le premier index vise une case de la liste de niveau 1 (celle qui contient les listes), le deuxième index vise une case de la liste de niveau 2, contenu dans la liste, en partant de 0.

+ `liste_imbriquee2[2][0][1][-1]` viserait donc la dernière case d'une liste contenue dans la deuxième case d'une liste elle-même contenue dans la première case d'une liste, elle-même contenue dans la 3e case de liste_imbriquee2.

---

### Les dictionnaires
Les dictionnaires sont des types particuliers de liste. Chaque élément d'un dictionnaire est constitué d'une `clef (key)` et d'une `valeur` à laquelle elle renvoie. Les dictionnaires sont `mutables`.
```
dictionnaire = {
  "A" : "valeur1"
  "B" : "valeur2"
  "C" : "valeur3"
}
dictionnaire_vide = {}
```

On appelle la valeur d'un élément du dictionnaire en utilisant la clef :
```
print(dictionnaire["A"])
#Affiche : "valeur1"
```

On peut ajouter des éléments à un dictionnaire :
```
dictionnaire["D"] = "valeur4"
```
---

### Les générateurs (generators)
`.keys()`, `.values()` et `.items()` produisent des générateurs : ils sont des sortes de listes qui n'acceptent pas l'indexation car elles n'ont pas encore été calculées : ce sont des listes en devenir. Pour transformer un générateur en liste, on peut la `retyper (cast)` et l'attribuant à une nouvelle variable.
```
dictionnaire_liste = list(dictionnaire.keys())
```
---

### Les tuples
Ce sont des listes simplifiées et `immutables`. Les tuples sont utiles lorsque les valeurs d'une liste ne doivent plus changer dans le reste du programme. Les tuples permettent des `dézipages`, c'est-à-dire l'assignation des valeurs d'un tuple à des variables de manière très simple :
```
tuple = [
("A", "B")
]
titre, auteur = tuple[0]
# titre <- "A"
# auteur <- "B"
```
---

### Les conditions
+ `if`, `elif` et `else` permettent l'exécution de tâches si une condition particulière est `vraie`. La syntaxe de la condition `if` est très importante :
```
if True:
  then that
else:
  then this
```
L'ensemble des tâches à effectuer dans le cas où une condition est remplie (ou non) doit être indentée car c'est la fin de l'indentation qui marque la fin de la série de tâches. Et la ligne qui exprime la condition à remplir (`statement`) doit se finir par `:`. `elif` permet d'ajouter des nuances dans les statements : on peut avoir plusieurs conditions possibles pour plusieurs séries de tâches possibles.

+ `True` et `False` : les objets tels que les chaînes de caractères sont `Vrais` car ils existent. `0` vaut toujours `Faux`. Les listes, chaînes et dictionnaires **vides** sont `Faux` car d'une certaine manière ils n'existent pas.

+ `and`, `or`, `not` : ces opérateurs permettent de combiner des conditions. Il est préférables d'utiliser des parenthèses pour rendre clair les ordres de priorités entre les conditions (surtout lorsque l'on utilise `or` et `and` simultanément).

#### Les opérateurs booléens :
+ `!=` : n'est pas égal à
+ `==` : est égal à
+ `>` ou `<` : est plus grand que, ou est plus petit que
+ `>=` ou `<=` : est plus grand ou égal à, ou est plus petit ou égal à

---
### Les boucles
Il existe deux types de boucles :
+ `for` permet de répéter une séries de tâches selon un nombre de répétitions prédéterminé, et est exprimé des manières suivantes :
```
for x in range (0,3):
for lettre in "string":
for item in variable:  
```

+ `while` permet de répéter une séries de tâches tant qu'une condition n'est pas `Vraie`, et exprimée de la manière suivante :
```
while (False):
```
Certains objets sont itérables, c'est le cas des chaînes, des listes et des dictionnaires.
