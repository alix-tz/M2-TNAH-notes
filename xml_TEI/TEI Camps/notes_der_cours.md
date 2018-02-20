# TEI

Personne n'a besoin des 600 éléments de la TEI. On a donc besoin de personnaliser notre modèle, pour avoir quelque chose de plus contraignant qui permet de mieux garantir l'intégrité du fichier. Il y a des éléments obligatoires (comme TEI, text, ...).

Définir un modèle permet de faciliter le traitement ultérieur des documents en garantissant un certain niveau d'homogénéité. Garantir l'utilisation de termes explicites et clairs pour l'humain. Un modèle doit toujours être documenté. C'est le principe même du format ODD.
Il faut que le modèle puisse évoluer pour s'adapter aux spécificités de certains documents du corpus qui n'entre pas dans le modèle conçu.  

Dans le cadre de la TEI on est contraint par ce qui existe déjà. On parle de `TEI conformance` (on préfère traduire par `validité TEI`), pour évoquer le fait que pour que la TEI réalise ce pour quoi elle a été pensée, on a besoin de certaines contraintes pour s'assurer que les modèles et personnalisation restent dans le cadre de la TEI.  
Un document est TEI conformant s'il est d'une part bien formé ; et si on peut aussi le valider contre TEI all. Cela a des implications sur ce que l'on peut faire, ou pas, sur la personnalisation : on peut toujours être plus restrictif que la TEI, mais pas plus large. Il faut aussi rester fidèle au modèle sémantique de la TEI : c'est-à-dire utiliser une balise pour ce pour quoi elle a été prévu. Il faut utiliser le namespace TEI. Et le document doit être documenté par un fichier ODD.  

`tag abuse` : fait d'altérer le sémantisme d'un élément TEI.  

**modification qu'on peut faire par rapport à TEI All** : supprimer des éléments ; renommer des éléments (mais ça pose des problèmes) ; modifier le modèle d'un contenu ; modifier une liste d'attributs ou de valeurs d'attributs, modifier un type de données ; modifier l'appartenance à une classe ; ajouter des éléments.  
On parle de modification *sale* pour la modification des noms des éléments. Une modification *propre* c'est une modification qui n'empêche pas la validité TEI.  

Si on supprime un élément obligatoire de la TEI, bien sûr c'est sale. On peut modifier les modèles de contenu tant qu'on se contente de restreindre, mais pas d'ajouter des éléments. On peut rendre un attribut obligatoire là où il est optionnel, mais pas l'inverse. On peut ajouter de nouveau élément si et seulement si on le rattache à un autre espace de nom que TEI.

`[Mathml](https://fr.wikipedia.org/wiki/MathML)` (mathématique) ; `[MEI](https://fr.wikipedia.org/wiki/Music_Encoding_Initiative)` (musique).  

ODD pour One Document Does it all : c'est à dire que le document explique de manière logique ce qui doit être fait et qui inclus du code qui contient les instructions qu'on passe à la machine. C'est en quelque sorte un renversement de ces qu'on fait traditionnellement.  

On peut créer un fichier ODD ex nihilo, mais on peut aussi utiliser des outils :
- Roma (un site qui permet de créer une première base d'ODD et de l'exporter)
- des feuilles de style

**[Roma](http://www.tei-c.org/Roma/)** : c'est un outil du consortium TEI pour créer des modèles et des personnalisation de la TEI. C'est un site qui n'est plus forcément maintenu, qui va finir par être obsolète. En quelques clics, on a déjà un fichier ODD et un schéma pour valider les documents.  
- Build up : partir du modèle le plus petit possible et ajouter des éléments
- Reduce : inverse
- Create a new customization
- Use or modify existing
- upload

Une autre méthode : oddbyexample : on utilise des documents encodés et la machine en déduit le plus petit modèle possible. l'inconvénient c'est que c'est exactement la transcription qu'on a fait. Cela rend des modèles très verbeux avec des interdictions un peu arbitraires.  

Revoir le TP pour les manips.

Les guidelines de la TEI sont écrites en ODD. On peut donc utiliser ce qui existe comme documentation dans ces guidelines pour rédiger sa propre documentation (en négatif notamment). cf. diapo pour info sur documentation. 
