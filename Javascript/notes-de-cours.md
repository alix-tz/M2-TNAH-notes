# Javascript

source : [https://github.com/PonteIneptique/cours-javascript](https://github.com/PonteIneptique/cours-javascript)  

## Objectifs du cours

- **Cours 1**
  - Comprendre ce qu’est le javascript
  - Le javascript dans le HTML
  - Comment déboguer du javascript
  - Syntaxe du javascript (par rapport à python)
- **Cours 2**
  - Le DOM
  - L'usage de bibliothèques
  - Ajout de champs en HTML
- **Cours 3**
  - Le concept d'Ajax
  - Le concept de fonctions anonyme et de callback
  - Utilisation d'une librairie
    - Faire un pop-up à partir de données Ajax
- **Cours 4 et suivants**
  - Faire une carte avec Leaflet

---

Outil : [Stackoverflow](https://stackoverflow.com/) : sorte de forum technique très utile.

---

ES 6 et ES 7 sont des versions du langages beaucoup plus propres de Javascript. Mais une majorité du web est encore écrite en ES 5. A nous d'apprendre à faire la transition.  

---

**Rappel :** `Java` et `Javascript`, ce n'est pas la même chose. Ce sont deux langages qui n'ont rien à voir.  
Les versions de javascript s'appellent EcmaScript (pourquoi pas Javascript, plus simplement, on sait pas...).  
Il y a eu à un moment donné un gros boom des applications écrites entièrement en javascript, y compris côté serveur, mais on ne verra pas ça dans le cadre de ce cours, puisqu'on se concentre sur javascript pour améliorer l'expérience utilisateur.  

Créer des applications en n'utilisant que du Javascript et des APIS : quelque chose très à la mode, qu'on verra un peu dans le cours. Ce n'est valable que pour des applications : on ne peut pas faire de vrai site (surtout qui impliquent du SEO) avec uniquement du Javascript en front end. Remarque si on se trouve dans la position d'un chef de projet : les outils javascript ont tendance à vieillir très très vite, et quand il s'agit d'outils nouveau, cela veut dire qu'il y a peu de compétences sur le marché pour la maintenance. *(ex: AngularJS, vuJS, Reac)*.  
`javascript-fatigue` : un terme pour désigner la fatigue des développeur à rester à jour avec les technologies liées à Javascript. Derrière ces frameworks, il y a des grosses entreprises.  

Javascript est apparu en 1997, il y a eu plusieurs mise à jour (2 et 3), puis rien pendant 9 ans. ES4 était une révision en profondeur de Javascript, mais on a considéré le projet comme trop profond il a donc été abandonné. ES5 est donc arrivé 10 ans après ES3, et ES5 n'apporte quasiment rien par rapport à ES3. Entre ES5 et ES6 on bascule dans une autre philosophie.  

Actionscript : le langage utilisé dans flash ; il ressemblait beaucoup à ES4.  

---

Javascript est présent dans énormément d'applications et de site web :
- menu déroulant
- messagerie instantanée (90% de facebook est généré en javascript)
- framapps et googleapps, etc, codé à 99% en javascript, sauf le serveur. (*remarque : javascript c'est puissant si on est capable de reproduire word en javascript!*)  

---

On peut mettre le javascript partout, dans le `<head>`, dans le `<body>`. Historiquement, pour éviter les erreurs avec Internet Explorer, on met le script à la fin du body, avec éventuellement un chargement des libraries dans le head.  

Le code se met dans la balise `<script>` à laquelle on donne l'`@src` dont la valeur est le chemin relatif ou absolu vers le fichiers javascript qui contient le script.  

---

Pour débuguer du javascript : firefox ou chrome.  
Un debugger est une console qui fait apparaître une fenêtre.  
Prendre le temps de regarder comment elle fonctionne.  

---

Pour développer du javascript : Webstorm (équivalent de Pycharm ou Oxygen pour Javascript) ;  
Ou utiliser un éditeur de texte avancé (sublime, atom, bracket).

---

Remarques générales sur la syntaxe :  
- une ligne se termine par un `;`
- on commente avec `//` pour une ligne ; `/* */` pour un commentaire multiligne
- on initie une variable en la précédent de `var`
- alors qu'en python on utilise des tabulations pour définir des bloc, en javascript comme dans beaucoup de langage, on utilise des `{ }`
- if_elif : devient `if ; else if`
  - les conditions sont exprimées entre `()`
  - `or` c'est `||`, `and` c'est `&&`
  - les égalitées sont : `==`, `!=`, etc. cf. diapo.  
  remarque sur `===` et `!==` : ils vérifient à la fois le type de la variable et la chaine de caractères, ce qui permet de ne pas avoir d'égalité entre `3` et `"3"`.  
  - `not` n'existe pas, on met un `!` devant une condition entre `()` pour exprimer "l'inverse de cette condition"

> Bien regarder le détail des fonctions listées dans le cours.
> ===

les objets en python sont des dictionnaires avancés en javascript. On ne peut pas comparer des listes et/ou des dictionnaires en javascript : le résultat sera toujours False. L'accès aux éléments d'une liste se fait par contre de la même manière.  

---

Pourquoi faire du Javascript plus par (`vanilla javascript`) : pour optimiser le poids d'une application : en utilisant jQuery et ses librairies on ajoute du poids, et on ignore que Javascript peut déjà faire ces choses en quelques lignes de plus.

---

Attention à la syntaxe pour boucler, qui change en fonction de l'objet :
`for item in dictionnaire ;`  
`for item of liste ;`

---

---

## DOM : Document Object Modele  

On a besoin de penser la page comme un arbre de noeuds (text, html, etc). Le DOM standardise la manière dont l'ordinateur représente cet arbre de manière à faciliter la modification d'un élément de l'arbre.  

La sélection du DOM en javascript utilise les mêmes sélecteurs de CSS : `#id`, `.class`, `nom_de_balise`.  

3 fonctions principales :
- `getElementById("id")` (attention au singulier : on ne vise qu'un seul élément avec un ID).
- `getElementsByTagName("nom_de_balise")`
- `getElementsByClasses("class")`

On peut aussi utiliser une requête query :
*exemple* : `#foo < div.bar` = tous les éléments div de classe bar contenu dans l'élément dont l'id est 'foo' ; `<` signifie 'enfant direct'.  
