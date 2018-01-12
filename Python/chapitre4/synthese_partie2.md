# Python

## Chapitre 4 (suite)

### Fonctions et méthodes de base
- **installer une série de librairies/packages via un document requirements :** `pip install -r requirements.txt`. Le documents requirements.txt contient une liste de noms de libraries qu'il faudrait importer dans l'environnement.  

### Le package `requests`
La package `requests` ne fait pas partie du cœur de Python. Il faut utiliser
cf. [documentation](http://docs.python-requests.org/en/master/)  

#### GET
La fonction `get` prend en paramètre une URL. Elle renvoie un code HTTP.  
``` python
import requests
# Pour l'exemple nous utilisons l'API de Chronicling America, un projet de numérisation de journaux Américains
req = requests.get("https://chroniclingamerica.loc.gov/search/pages/results/?format=json&proxtext=ecole+nationale")
print(req)

# <Response [200]>
```

La construction d'URL pouvant poser des problèmes (échappage de caractère par exemple), `requests.get()` accepte un paramètre `params` ; ou bien des `headers`sous la forme d'un dictionnaire.

``` python
import requests

# L'adresse suivante permet de demander l'analyse morphologique d'un terme :
url = "http://morph.alpheios.net/api/v1/analysis/word?word=lasciva&lang=lat&engine=whitakerLat"

xml = requests.get(url, headers={"Accept": "text/xml"})
print(xml.text)
req_json = requests.get(url, headers={"Accept": "application/json"})
print(req_json.text)
```

##### Autres fonctions de Requests sur les résultats de `get()`  
Les objets `Response` (résultats de `get()`) ont plusieurs propriétés intéressantes :
- `.status_code` sous la forme d'un entier qui informe du succès de la requête
- `.headers` sous la forme d'un dictionnaire qui comporte l'ensemble des headers
- `.encoding` qui comprend la méthode d'encodage
- `.text` qui contient le contenu de la réponse
- `.json()` qui, si `.headers['content-type']` est `application/json`, parse lui-même le json de la réponse.  

**Exemple :**
```
print(req.status_code)
print(req.headers)
print(req.encoding)

# output :
# 200
# {'Date': 'Tue, 09 Jan 2018 13:10:17 GMT', 'Expires': 'Wed, 10 Jan 2018 13:09:30 GMT', 'Access-Control-Allow-Origin': '*', 'Content-Length': '234708', 'Connection': 'keep-alive', 'Via': '1.1 varnish-v4', 'Last-Modified': 'Tue, 09 Jan 2018 13:09:30 GMT', 'Server': 'cloudflare-nginx', 'Content-Type': 'application/json', 'Vary': 'Accept-Encoding', 'Content-Encoding': 'gzip', 'Set-Cookie': '__cfduid=df2abc613958d20e9b7e78747d28d447f1515503416; expires=Wed, 09-Jan-19 13:10:16 GMT; path=/; domain=.loc.gov; HttpOnly', 'Age': '46', 'Accept-Ranges': 'bytes', 'Access-Control-Allow-Headers': 'X-requested-with', 'Cache-Control': 'max-age=86400', 'X-Varnish': '351896550 359432730', 'CF-RAY': '3da7a2c3e9ac14df-CDG'}
# None
```

#### Autres types de requêtes
Conformément aux différentes méthodes de requêtes, le module `requests` propose les fonctions suivantes, qui prennent les mêmes paramètres que `.get()` :
- `.post()` (*qui prend en plus un paramètre `data`*)
- `.update()`
- `.delete()`
- `.put()`
- `.options()`

#### requests.raise_for_status()
Il est possible de générer une erreur afin d'éviter qu'un script s'exécute quand le statut de la page rend l'opération inutile (ex. en cas d'erreur 404). Pour cela on utilise la méthode `raise_for_status()` tirée du package `requests`.  
**exemple :**
``` python
import requests
bad_r = requests.get("http://cts.dh.uni-leipzig.de/collections/urn:cts:froLit")
bad_r.raise_for_status()
# si on n'utilise pas raise_for_status, on n'a pas de message d'erreur.
# L'utiliser permet de rendre l'erreur visible.
```

Le message d'erreur que l'on obtient est le suivant :
```
---------------------------------------------------------------------------
HTTPError                                 Traceback (most recent call last)
<ipython-input-7-5776cdbc034e> in <module>()
      1 import requests
      2 bad_r = requests.get("http://cts.dh.uni-leipzig.de/collections/urn:cts:froLit")
----> 3 bad_r.raise_for_status()
      4 # si on n'utilise pas raise_for_status, on n'a pas de message d'erreur.
      5 # L'utiliser permet de rendre l'erreur visible.

~/.cours-python/lib/python3.5/site-packages/requests/models.py in raise_for_status(self)
    933
    934         if http_error_msg:
--> 935             raise HTTPError(http_error_msg, response=self)
    936
    937     def close(self):

HTTPError: 500 Server Error: Internal Server Error for url: http://cts.dh.uni-leipzig.de/collections/urn:cts:froLit
```

### Requêtes et Réponses
Lors d'une communication HTTP avec un serveur, la communication est scindable en deux : l'envoi de la requête et la réponse du serveur. Ces deux éléments de la communication répondent à un ensemble de standards très stricts permettant le fonctionnement du web tel que nous le connaissons.

#### Requêtes
La requête, c'est-à-dire l'information envoyée au serveur, est composée à minima de trois type d'informations :
- l'URL
- la méthode
- les headers

##### URL
L'URL est l'adresse dont on requiert le contenu. Typiquement, l'adresse est divisible en plusieurs parties. Celle qui peut être importante et qui changera sûrement suivant les utilisateurs est la partie *query* qui permet d'apporter des informations supplémentaires.

Par exemple, dans http://cts.dh.uni-leipzig.de/api/cts?request=GetCapabilities&urn=urn:cts:latinLit:phi1294 , on a deux paramètres fournis :

| Nom | Valeur |
| --- | ------ |
| urn | urn:cts:latinLit:phi1294 |
| request | GetCapabilities |

###### décomposition de l'URL :

| https:// | www. | exemple | .fr | :300/ | path/resource | ?id=123 | #section-id |
| :------: | :--: | :-----: | :-: | :---: | :-----------: | :-----: | :---------: |
| 1        | 2    | 3       | 4   | 5     | 6             | 7       | 8           |

1. Schéma : définit comment la ressource sera obtenue
2. Sous-domaine : www est le plus commun mais n'est pas obligatoire
3. Domaine : une valeur unique au sein de l'extension
4. Extension (top-level domain) : il existe des centaines d'options d'extensions
5. Port : s'il n'est pas précisé, http se connecte au port 80, et https au port 443. Il y a aussi 21 pour FTP, 22 pour SSH, etc. Ce sont en quelques sortes les tuyaux par lesquels passent les communications
6. Chemin : il spécifie la ressource demandée. Il peut se terminer par une extension de type .html
7. Query String : données qui passent du côté serveur, elle correspond à la requête envoyée au serveur
8. Identifiant de fragment : assez peu utilisé, sauf pour renvoyer à des portions spécifiques de la page, ou dans des application qui utilisent java

##### Méthode
La méthode informe le serveur de ce que l'on veut faire. Elles permettent de ne pas multiplier les adresses, en ne changeant que la méthode, qui détermine le comportement possible.
90% des requêtes envoyées en navigant sur le web sont en GET : c'est-à-dire "récupérer l'information". Vient ensuite la requête POST (9.9% des cas), notamment quand on se connecte sur des comptes sur des sites.
Les autres méthodes possibles sont : `DELETE` ; `UPDATE` ; `PUT`.

cf cours sur données de G. Poupeau

##### Header
Le Header comporte des informations sur les attentes et le contexte de requêtage. Par exemple, on peut demander via les Headers un format de réponse particulier (d'après son [mimetype](https://fr.wikipedia.org/wiki/Type_MIME) : html, xml ou json par exemple :

| Headers Clé | Headers Valeur   |
| ----------- | ---------------- |
| Accept      | application/json |

##### (Optionnel) Le Corps (Body, data, etc.)

Dans le cadre de l'envoi d'un formulaire ou d'un fichier, on a un corps dans la requête. Beaucoup de formats différents sont possible dans ce cadre. De nombreuses API acceptent par exemple l'encodage en JSON des informations.

#### Réponses
La réponse envoyée par le serveur est composée que trois éléments :
- Headers
- code HTTP
- le corps

##### les Headers
Ils renvoient l'information sur la réponse.
| Headers Clé | Headers Valeur   | Note |
| ----------- | ---------------- | ---- |
| Content-type| application/json | Type Mime de la réponse |

##### le code HTTP
Le corps de la réponse informe sur le statut ou l'état de la réponse. Exemples :
- 200 : succès de la requête ;
- 301 et 302 : redirection, respectivement permanente et temporaire ;
- 401 : utilisateur non authentifié ;
- 403 : accès refusé ;
- 404 : page non trouvée ;
- 500 et 503 : erreur serveur.

##### le corps
Le corps de la réponse contient ce que l'on voit lorsque l'on fait une requête : le contenu html, plein texte, json, etc.

### Versionnement
`apparté sur les versions. ->` [Semantic Versioning](https://semver.org/)  
`2.0.0 -> le format de version de base.`  

| 2     | 0     | 0     |
| ----- | ----- | ----- |
| MAJOR | MINOR | PATCH |
