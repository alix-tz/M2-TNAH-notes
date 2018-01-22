Notes tirées du cours XML-DTD d'OpenClassRooms
===

# DTD

Une DTD est une série de règles que doit suivre un fichier XML pour être conforme. Elle liste les éléments balises, ainsi que les attributs des balises.  
Une DTD peut être écrite dans le même fichier XML que le reste de l'encodage, ou dans un fichier à part.

1. une `DTD interne` s'écrit selon la syntaxe suivante :  
  ```
  <!DOCTYPE racine [
  <!ELEMENT ...>
  ]
  ```
  > noter que `racine` doit correspondre à l'élément racine du fichier XML.  

2. une `DTD externe` est utile quand elle est commune à plusieurs documents. L'extension du fichier contenant la DTD est `.dtd`. Elle contient directement la liste des éléments, attributs et entités, c'est à dire ce qui serait inscrit entre crochets dans une DTD interne.  
La DTD externe peut être "PUBLIC" ou "SYSTEM". Les DTD "PUBLIC" sont utilisées pour faire références aux normes, tandis que les DTD "SYSTEM" sont celles qui sont créées pour des besoins spécifiques. L'uri est donc le chemin vers le fichier dtd, exprimé de manière relative ou depuis /. Pour faire un renvoi vers une DTD externe, on utilise une ligne !DOCTYPE dans le fichier xml :  
> \<!DOCTYPE racine PUBLIC "identifiant" "url">  
> ou bien  
> \<!DOCTYPE racine SYSTEM "uri">  


## Eléments

Les éléments sont exprimés selon la syntaxe suivante : `<!ELEMENT balise (contenu)>`. Une DTD doit décrire *tous* les éléments du document.

1. Le mot-clef !ELEMENT permet de signaler une règle relative à une balise.
2. L'élément `balise` est le nom de la balise à laquelle on applique la règle.
3. Le `contenu` contient la règle syntaxique.

  > Si une balise <personne> contient toujours une balise <nom>, alors le contenu associé à la balise <personne> sera : `(nom)`.  
  > Si une balise doit contenir du plein texte, on indique : `<!ELEMENT balise (#PCDATA)>`.  
  > Si une balise ne doit rien contenir, on indique `<!ELEMENT balise EMPTY>`.  
  > Si une balise peut contenir tout (une balise, une valeur simple, ou être vide), on indique : `<!ELEMENT balise ANY>`.  

La `séquence` permet de décrire l'enchaînement imposé des balises. Elle est exprimé en tant que contenu de la règle, les balises qui doivent être contenues sont listées dans l'ordre, en étant séparées par une `,`.  
  > \<!ELEMENT balise (contenu1, contenu2, contenu3)>  
  > \<balise>\<contenu1/>\<contenu2/>\<contenu3/>\</balise>

Plutôt qu'une séquence, on peut préférer une `liste de choix`, qui implique que la balise doit contenir au moins l'un des éléments listés. Les éléments sont séparés par des `|`.  
> \<!ELEMENT balise (contenu_a | contenu_b)>  
> \<balise>\<contenu_a/>\</balise>  
> ou  
> \<balise>\<contenu_b/>\</balise>  

Pour indiquer le nombre d'occurrences possible des balises contenues, on ajoute des symboles à la suite de la balise dans le contenu :
- 0 ou 1 fois = `?`
- 0 ou plusieurs fois = `*`
- 1 ou plusieurs fois = `+`

> \<!ELEMENT balise (contenu, contenu_opt?)>  
> \<!ELEMENT balise (contenu, contenu0_inf*)>  
> \<!ELEMENT balise (contenu, contenu1_inf+)>  


## Attributs
Les attributs sont listés selon la syntaxe suivante : `<!ATTLIST balise attribut type mode>`.  

1. **!ATTLIST** : c'est le mot-clef qui permet de signaler une règle relative à un attribut.
2. **balise** : c'est le nom de la balise qui possède l'attribut.
3. **attribut** : c'est le nom de l'attribut.
4. **type** : un attribut peut avoir plusieurs type :
  - liste de valeurs (exprimées entre `()`, les valeurs sont séparées par des `|`)
  - un contenu libre (exprimé par CDATA)
  - un identifiant unique (exprimé par ID)
  - une référence à un identifiant unique (exprimé par IDREF)
5. **mode** : permet de donner une information supplémentaire sur l'attribut, notamment :
  - `#REQUIRED` = l'attribut est obligatoire
  - `#IMPLIED` = l'attribut n'est pas obligatoire
  - `#FIXED` "valeur" = permet de restreindre la valeur d'un attribut à la valeur qui est donnée à la suite de cette règle.
  - "valeur" = si on indique une chaîne de caractères après CDATA, alors la valeur de l'attribut sera cette chaîne, par défaut.

## Entités
Une entité est une sorte de raccourci qui permet de signaler que l'entité, quand elle est utilisée dans le texte, doit être remplacée par l'ensemble de balise et de texte qu'elle représente.  
Il existe trois types d'entités : les `entités générales`, les `entités paramètres` et les `entités externes`.  

1. Les entités générales permettent d'associer un alias à une information.
    1. **!ENTITY** : le mot-clef qui signale une règle concernant une entité.  
    1. **nom** : le nom de l'entité
    1. **"valeur"** : ce que représente l'alias.
> \<!ENTITY nom_de_lentité "valeur">  
> dans le corps du texte on la convoque en utilisant :  
> `&nom_de_lentité;`

2. les entités paramètres n'apparaissent que dans les définitions DTD. Elle permettent d'associer un alias à une partie de la déclaration de la DTD.  
Elles sont utiles pour ne pas avoir à répéter plusieurs fois une même liste de balises ou d'attributs dans le DTD.
> \<!ENTITY % nom "valeur">  
> on la convoque dans la DTD en utilisant :  
> `%nom;`
>
> exemple :  
> \<!ENTITY % langue "lang (fre | all | eng)">  
> \<!ATTLIST texte %langue;>  
> équivaut à  
> \<!ATTLIST texte lang (fre | all | eng)>

3. les entités externes peuvent être analysées ou non analysées. Les entités externes non analysées sont similaires aux entités générales, mais elles renvoient à des informations qui sont stockées dans un fichier séparé.
> <!ENTITY nom SYSTEM "uri">
> on la convoque en utilisant :  
> `&nom;`
>
> exemple :  
> \<!ENTITY exemple SYSTEM "fichiers/exemple.xml">

---

# Schéma XML
Les schéma XML permettent d'aller plus loin qu'une DTD en précisant notamment le type de données qui sont inscrites, voire de créer des types. Un schéma XML est exprimé en XML, dans un fichier séparé dont l'extension est `.xsd`.  
Le schéma XML doit contenir un prologue, comme un fichier XML régulier :  
> \<?xml version="1.0" encoding="UTF-8" ?>  

Le corps du schéma est par ailleurs contenu dans un élément racine appelé `xsd:schema`:  
> \<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">  
> \</xsd:schema>  

L'attribut `xmlns` permet de définir un espace de nom.  


On référence le schéma XML dans un fichier XML dans l'élément racine avec d'une part l'espace de nom (xmlns) et d'autre part la location, c'est-à-dire le chemin vers le fichier schéma, ou bien son url avec les deux syntaxes suivantes possibles :  
> xsi:schemaLocation="chemin_vers_fichier.xsd"  
> ou bien :  
> xsi:noNamespaceSchemaLocation="chemin_vers_fichier.xsd"  

Le premier concerne un schéma XML qui décrit un espace de nom, alors que le second n'en décrit pas.  

## Syntaxe
1. `éléments simple` : les éléments simples sont des balises qui ne contiennent pas d'autres balise et qui ne possèdent pas d'attributs. Cependant, un attribut d'une balise peut aussi être un type simple.  
> \<xsd:element name="nom_de_balise" type="xsd:type">  

`type` peut être remplacé par `int`, `string`, etc.
