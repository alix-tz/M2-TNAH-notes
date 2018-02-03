# python
## Chapitre 9 : Requêtes SQLAlchemy et astuces


### Commandes et fonctions
- `.limit(#)`
- `.first()`
- `.db.and_()`
- `.db.or_()`
- `.get_or404(#)`
- `.paginate(page=#, per_page=#)`

### Gérer l'affichage des résultats

#### Eléments de requête :
- `.limit()` permet de ne récupérer que les n premiers résultats (n étant un nombre entier indiqué entre `()`).
- `.first()` permet de n'afficher que le premier résultat
*remarque : cela renvoie un élément et non pas une liste comme le ferait une requête ordonnée dont on afficherait seulement 1 résultat).*
- `db.and_()` et `db.or_()` permettent de combiner des conditions avec les opérateurs AND et OR. Les conditions, elles, sont collées avec des `,`.  
*exemple :*
``` python
data = Place.query.filter(db.and_(
    Place.place_longitude.between(minLong, maxLong),
    Place.place_latitude.between(minLat, maxLat),
)).order_by(Place.place_nom.desc()).all()
```
> ce genre de requête permet de cibler les résultats en fonctions d'une zone géographique rectangulaire.

On peut bien entendu combiner plusieurs éléments de requêtes :  
``` Python
data = Place.query.filter(Place.place_type=="settlement").order_by(Place.place_nom.desc(), Place.place_description.desc()).all()
for lieu in data:
    print(lieu.place_nom)
```

#### Faire une pagination : .paginate()
Réaliser une pagination pour des résultat nécessite de jongler, difficilement, entre les requêtes "limit", "max", "offset", etc, tout en prévoyant un calcul du nombre de page à afficher pour ne pas avoir d'erreur.  

SQL Alchemy propose de gérer cela derrière la méthode `.paginate()` que l'on insère dans une requête à la place de `.all()`.  

> [Documentation](http://flask-sqlalchemy.pocoo.org/2.1/api/?highlight=pagination#flask.ext.sqlalchemy.Pagination)

`.paginate()` prend deux paramètres principaux :
- `page=` pour indiquer le numéro de page
- `per_page=` pour indiquer le nombre de réponse maximale à récupérer pour une page.  

Pour afficher la page 2 d'une requête où on limite à 5 résultats par page, on écrira donc :  
```
Table.query.filter(Table.Field=="value").order_by(Table.otherfield).paginate(page=2, per_page=5)
```

La méthode `.paginate()` renvoie un objet de "Pagination" qui contient plusieurs propriété qui peuvent être utilisées avec plusieurs finalités :  
- `.items` permet de retrouver tous les résultats de la page actuelle
- `.page` retourne le numéro de la page actuelle
- `.pages` retourne le nombre total de pages
- `.total` retourne le nombre total de résultats
- `.has_next` ou `.has_prev` renvoie "True" s'il existe une page précédente ou une page suivante
- `.pre_num` et `.next_num` retourne le numéro de la page suivante ou précédente
- `.iter_pages()` permet de construire l'apparence de la pagination en précisant combien de page autours de la page actuelle et combien de pages "extrêmes" on souhaite afficher

**Exemple :**
``` python
print("Il y a {total_resultats} résultats soit {pages} pages".format(
    total_resultats=pagination.total,
    pages=pagination.pages
))
print("La page suivante est la " + str(pagination.next_num))
```
> output :  
> Il y a 8 résultats soit 4 pages  
> La page suivante est la 3

##### .iter_pages()
La méthode .iter_pages() est très efficace car elle permet de générer automatiquement le numéros des pages que l'on souhaite afficher avec seulement 4 paramètres :  
- `left_edge=#`
- `left_current=#`
- `right_current=#`
- `right_edge=#`
Les pages qui ne correspondent pas à ces paramètres sont quand même prises en compte mais renvoient la valeur "None". Dans le cadre d'un template, on peut facilement remplacer ces pages "None" par "..." pour signifier l’interval de pages non affichées.

**Exemple de template :**
``` html
<div class=pagination>
{%- for page in pagination.iter_pages() %}
{% if page %}
  {% if page != pagination.page %}
    <a href="{{ url_for("recherche", keyword=keyword, page=page) }}">{{ page }}</a>
  {% else %}
    <strong>{{ page }}</strong>
  {% endif %}
{% else %}
  <span class=ellipsis>…</span>
{% endif %}
{%- endfor %}
</div>
```
> remarque (à comprendre) : Avez-vous remarqué ? Quand les paramètres de url_for ne font pas partie de la fonction de base, elles sont transformées en paramètres GET (et sont donc récupérables via request.args !)

### Lancer une erreur de type 404
`get_or404(clef primaire)` permet d'avoir l'équivalent d'un .get() mais qui lance une erreur 404 si l'objet n'est pas trouvé.  

### Boucler sur des listes de manière simplifiée
La méthode qu'on a vu jusqu'à présent :
``` python
data = Place.query.filter(Place.place_type=="settlement").order_by(Place.place_nom).all()
noms_lieux = []
for lieu in data:
    noms_lieux.append(lieu.place_nom)
print(noms_lieux)
```

La méthode **zen** :
``` python
noms_lieux_2 = [lieu.place_nom for lieu in data]
print(noms_lieux_2)
```
On peut donc inscrire la formule directement entre [] et éviter d'utiliser 4 lignes de code pour ce genre de requête. Elle permet également d'ajouter des if (mais seulement des if). Si on multiplie les if, on peut sauter des lignes pour avoir une meilleure lisibilité :  
``` python
lieux_avec_un_a = [lieu.place_nom for lieu in data if "a" in lieu.place_nom]
print(lieux_avec_un_a)
```

> rappel : niveau zen, cette ligne de commande utilise aussi le fait qu'on peut écrire, par exemple, `lieux[0].nom` plutôt que `lieux[0]["nom"]`.
