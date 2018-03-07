# JAVASCRIPT

## Note du cours 2

### DOM
DOM c'est la modélisation de l'ensemble des noeuds d'une page. Le DOM c'est l'interprétation par la machine de la hiérarchie du document (parsé).  
En javascrit, on peut sélectionner des éléments à partir de différentes informations : l'ID, les balises (tagname), les classes. On peut enchaîner ce genre d'information.  

Remarque : le `>` s'utilise en CSS pour désigner les éléments enfants directs.  

`querySelector` permet de ne pas avoir à accumuler des selectbyID, etc.  
Ex :
``` JAVASCRIPT
document.querySelector('#foo > div.bar')
// où document est une variable
```  

`.style` permet d'appliquer une règle CSS à une élément  
Ex:
``` JAVASCRIPT
var div = document.getElementById('#ma_div');
div.style.backgroundColor = "red";
```
> Remarque les propriétés CSS sont données en **CamelCase** !

`.innerHTML` permet de modifier le contenu d'une balise HTML.  
Ex :
``` JAVASCRIPT
var div = document.getElementById('#ma_div');
div.innerHTML = `<a href="#">
Ajouter un lien
</a>`; // On utilise ` pour faire des chaînes multilignes;
```

`.innerText` permet de modifier le contenu d'un noeud de texte.  
Ex :  
``` JAVASCRIPT
div.innerText = "Bonjour le monde !";
```
---

Exercice :  
``` JAVASCRIPT
// première manip
var titre = document.querySelector("#article_2 header");
titre.innerText = "Un joli titre";

// deuxième manip
var article = document.querySelector("#article_2");
article.style.margin = "150px";

// troisième manip
var body = document.querySelector("body");
body.innerHTML = `<article id="article_3">
     <header class="sub-info">Titre 3</header>
     <section>Lorem Ipsum 3</section>
     <footer class="sub-info">Auteur 3</footer>
   </article>`
```

---

## Etre développeur.se c'est une fainéant.e

JQuery permet de simplifier toute la chaîne de travail. Est apparu en 2006, gros boom. Le principe de jQuery c'était à la base de s'assurer qu'une fonction était valable quelque soit le développeur. jQuery UI : une librairie supplémentaire encore en développement, mais quand même utilisé pour simplifier certaines choses (ex: sélectionner des dates sur un calendrier). On peut hésiter à parler de frameworks pour jQuery parce que c'est vraiment un outil qui ne cadre pas ce qu'on va faire ensuite.  
A l'époque, jQuery propose un outil de sélecteur CSS, qui n'existait pas en JAVASCRIPT. Ces sélecteurs sont exprimés avec la syntaxe : `$(selecteur...)`. jQuery apporte aussi AJAX, mais on va voir ça plus tard.  

jQuery est souvent symbolisé par le `$`.

Insérer jQuery dans le script :  
``` html
<html>
 <body>
  <article id="article_1">
    <header class="sub-info">Titre</header>
    <section>Lorem Ipsum</section>
    <footer class="sub-info">Auteur</footer>
  </article>
  <script
     src="https://code.jquery.com/jquery-3.3.1.min.js">
  </script>
  <script type="text/javascript">
    $(document).ready(function($){
      // Votre code ici !
    });
  </script>
 </body>
</html>
```

> `$(document).ready(function($){...})` : permet de s'assurer que le script se lance quand la page est prête.  

**Sélecteurs** :  
- $("article")
- $(".article")
- $("#article")
- etc

Pour voir tous les sélecteurs possibles : https://oscarotero.com/jquery/

**fonctions** :
- .css("propriété-css", "valeur") : appliquer une propriété css
- .hide() : cacher un élément
- .show() : faire réapparaître un élément
- .attr() : pour modifier un attribut

Il est important d'utiliser des séléecteurs très précis et de bien comprendre sur quels éléments telle ou telle modification va porter.  

---

## Callback

La notion de callback, c'est une fonction qu'on donne comme paramètre à une autre fonction. Au lieu de donner un objet de programmation en paramètre, on donne une fonction à l'autre fonction. Cette fonction sera exécutée dans cette autre fonction. C'est très souvent utilisé quand on veut faire des vérifications entre deux manipulations, quand on veut se connecter à une ressources entre 2 manip, etc.  

Ca se donne en paramètre exactement comme un autre paramètre. On donne simplement le nom de la fonction. On n'a pas besoin de l'appeler "callback".  

---
## Fonction anonyme
Une fonction anonyme ne porte pas de nom. Elle est en quelque sorte "jetable". Elles sont souvent utilisées dans les callbacks.  

``` JAVASCRIPT
// Javascript
ma_fonction(5, function(z) { return z*5; });
```

En Python pour créer une fonction anonyme on utilise "lambda". Elles s'utilisent peu en Python.

``` Python
# Python
ma_fonction(5, lambda z: z*5)
```

Dans le code sur l'insertion du script jQuery, ready() prenait donc en paramètre une fonction anonyme :

``` html
<script type="text/javascript">
    $(document).ready(function($){
      // Votre code ici !
    });
</script>
```

---

Exercice  

``` JAVASCRIPT
var ma_fonction = function(x, mon_callback) {
  return mon_callback(x);
}

var q1 = ma_fonction(
    7, function(y){return "Blanche Neige et les " + y + " Nains";}
) === "Blanche Neige et les 7 Nains";

var q2 = ma_fonction(
	9, function(z) {return z*2;}
) === 18;

console.log(q1);
console.log(q2);
```

---

## Les événements

Les événements sont à la source de toutes les intéractions en javascript.  

En jQuery, les événement sont liés aux éléments via ".on("evenement", fonction_callback) { }.  

Les boutons comme les liens sont des événements par défauts. Quand on travaille avec des boutons ou des liens, et qu'on ne veut pas que l'événement "normal/par défaut" se passe, on l'annule.  


```
$(".btn").on("click", function (event) {
  // On annule l'action par défaut du bouton
  event.preventDefault();
  // on utilise $(this) pour faire une action sur l'élément courant (celui qui déclenche la fonction)
  $(this).addClass("btn-success");
});
```
> this ici est un peu l'équivalent de "self" ; on ne peut pas l'appeler autrement.  

- .addClass permet d'ajouter une classe à une objet.  
- .append() : ajouter du html après l'élément courant
- .prepend() : ajouter du html avant l'élément courant

---

Exercice :

Le document de base pour travailler doit ressembler à ça :  

``` HTML
<html>
  <head>
  </head>
  <body>

  <script scr="https://code.jquery.com/jquery-3.3.1.min.js">
  </script>
  <script type="text/javascript">
    $(document).ready(function($){
    });
    </script>
  </body>
</html>
```

Remarques :
> souvent l'évenemnt dans la fonction anonyme qu'on pourrait nommer "event" est écrit "e" pour aller plus vite.  
> Quand on stocke un ensemble de code html dans une variable, (ou dans le doc), on le stocke dans $(`...`) pour que JS/JQ le prenne bien comme un ensemble de nouveaux éléments et pas comme une chaine de caractères.  
> .parent() permet de cibler l'élément parent ; si on le met au pluriel, ça cible tous les éléments parents. On peut combiner avec une classe pour limiter la porter d'un événement, notamment dans le cas d'une suppression d'éléments.  
> .remove() permet de supprimer un élément html.  
>
