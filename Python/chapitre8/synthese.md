# Python
## Chapitre 8 : formulaire et recherche dans une application Flask

### Commandes et fonctions

### Création d'un formulaire
Pour créer un formulaire en html, on utilise l'élément `<form />` qui contient l'ensemble des champs et des boutons qui composent le formulaire. On lui donne en attribut `method` (par exemple "get" ou "post"), et `action` dont la valeur est l'url vers laquelle ces données sont envoyées.  
La balise `<form />` contient toujours au moins un bouton que l'on crée avec la balise `<input type="submit"/>` ou bien (et c'est préférable) `<button type="submit">Envoyer</button>`.  
Les autres éléments `<input />` ont des attributs `name` (pour identifier l'élémnent du formulaire), `type` (pour préciser le type de champ à afficher), et éventuellement `placeholder` (pour afficher un exemple de contenu de champ).

| type de champs | | | |
| - | - | - | - |
| color | date | datetime-local | email |
| month | number | range | search |
| tel | time | url | week |

Pour revoir tout ça : cf. https://www.alsacreations.com/tuto/lire/1372-formulaires-html5-nouveaux-types-champs-input.html  

#### Adapter la méthode du formulaire à son usage
** `get` ajoute les informations du formulaire dans la barre URL.**  
- Dans le cadre d'un **formulaire de recherche** , on utilise `get` qui permet à l'utilisateur de partager/sauvegarder les résultats de sa recherche de manière très simple.  
- Dans le cadre d'un **formulaire à données sensibles**, on utilise `post` (pour ne pas ajouter dans la barre url adresses email, mots de passe, etc).  

### Flask et les formulaires

Pour créer une barre de recherche simple dans l'en-tête de la page web, on a le code html suivant dans les templates :  

``` html
<form method="get" action="#">
  <input type="search" name="keyword" placeholder="Recherche rapide">
  <button type="submit">Rechercher</button>
</form>  
```

#### request
La variable `flask.request` permet de récupérer les informations de formulaire.
> cf. Documentation : [simple](http://flask.pocoo.org/docs/0.12/quickstart/#accessing-request-data) | [complexe](http://flask.pocoo.org/docs/0.12/api/#incoming-request-data)

La variable `flask.request` possède un attribut `args` qui fonctionne comme un dictionnaire (cf. [chapitre 5](https://github.com/alix-tz/M2-TNAH/blob/master/Python/chapitre5/synthese.md)) et qui récupère les valeurs disponibles dans l'url.  

**exemple :**  
Pour l'url `http://localhost/une_page?i=0&recherche=quelque%20chose `, on aura :  
``` python
from flask import Flask, request

request.args == {
    "une_page": "0",
    "recherche": "quelque chose"
}
>>> True
```

Pour récupérer ces informations, on crée une route supplémentaire dans le fichier routes.py de l'application :  
``` Python
@app.route("/recherche")
def recherche():
    # On préfère utiliser .get() ici
    #   cela nous permet d'éviter un if long (if "clef" in dictionnaire and dictonniaire["clef"])
    motclef = request.args.get("keyword", None)

    # On crée une liste vide de résultat (qui restera vide par défaut si on n'a pas de mot clé)
    resultats = []

    titre = "Recherche"

    if motclef: # s'il y a bien eu une requête
        resultats = Place.query.filter(
            Place.place_nom.like("%{}%".format(motclef))
        ).all()
        titre = "Résultat pour la recherche `" + motclef + "`"
    return render_template("pages/recherche.html", resultats=resultats, titre=titre)

```
> 1. .get() permet de récupérer une valeur à la clef. Si cette valeur n'existe pas, elle est remplacée par une valeur par défaut.  
> 2. rappel : .format() permet de remplacer `{}` par une valeur donnée entre (). (cf. [chapitre 4](https://github.com/alix-tz/M2-TNAH/blob/master/Python/chapitre4/synthese_partie1.md))  
> 3. le template vers lequel renvoie cette route a été créé pour afficher la page de résultat.

La valeur donnée à l'attribut "action" de l'élément "form" sera `url_for("recherche")` ; qui permet donc d'envoyer la requête vers la route "/recherche" qu'on a ainsi paramétrée.  

#### utiliser plusieurs formulaires
Les formulaires sont autant de points d'entrées vers une même type de requête, tant qu'ils sont rattachés à la même valeur pour "action". Il peut donc y avoir plusieurs point d'entrée (plusieurs formulaires à différents endroits du site/de l'application) pour réaliser une requête donnée. En revanche, un formulaire ne peut pas conduire à plusieurs endroits différents : un élément form n'a qu'un seul attribut "action".

---

### Percent-encoding
Les percent-encoding permette d'écrire des caractères réservés. Les principaux `%-encoding` sont :

| caractère | `%-encoding` | *entité XML* |  
| - | - | - |  
| ` ` | %20 | *&nbsp* |  
| `!` | %21 |  .  |  
| `#` | %23 |  .  |  
| `&` | %26 | *&amp* |  
| `$` | %24 |  .    |  
| `'` | %27 | *&apos* |  
| `"` |  .  | *&quot* |  
| `(` | %28 |  .  |  
| `)` | %29 |  .  |  
| `*` | %2A |  .  |  
| `+` | %2B |  .  |  
| `,` | %2C |  .  |  
| `/` | %2F |  .  |  
| `:` | %3A |  .  |  
| `;` | %3B |  .  |  
| `=` | %3D |  .  |  
| `?` | %3F |  .  |  
| `@` | %40 |  .  |  
| `[` | %5B |  .  |  
| `]` | %5D |  .  |  
| `<` |  .  | *&lt* |  
| `>` |  .  | *&lg* |  
