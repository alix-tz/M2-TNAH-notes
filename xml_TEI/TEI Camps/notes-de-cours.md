# TEI

*Jean-Baptiste Camps*

cf. syllabus
- question de la transcription des sources
- descriptions des manuscrits (métadonnées)
- établir un texte critique sur la tradition d’un texte

**Evaluation :**
Un travail d’édition XML/TEI à faire sur une source, avec possibilité de proposer une édition XSLT. Différents types de sujets.

## Cours 1
**OHCO : Ordered Hierarchy/ies of Content Objects.**
Hierarchies au pluriel parce qu’on peut faire cohabiter plusieurs hiérarchies en fonction de ce dont on veut rendre compte. OHCO est un modèle sur lequel repose XML : il y a des arborescences, des objets de contenus (nœuds de textes, de documents, etc), et un sens de lecture. Cette structure est important à comprendre pour utiliser xPath.


**Le Roland d’Oxford.**
Plus vieux témoin écrit des chansons de geste, éléments matériels à mettre en avant. Cf objet du TD :
1. édition représentant le système graphique de ce témoin
  a. les liens entre facsimilé et transcription
  b. transcription imitative et édition à visée paléographique

Plusieurs points linguistiques à éclaircir :
- édition graphématique ;
- édition halographétique ;

>  Pour travailler sur les variantes de formes de lettres, on a besoin d’installer des polices spécifiques (font). La MUFI est une initiative qui vise à compléter la variété des encodages de caractères d’Unicode. Deux fonts parmi d’autres : Junicode et Palemonas MUFI.
>	Pour installer : cf. diapo 7.


### TP sur la chanson de Roland
Du point de vue du texte, on encode les lignes, les laisses (strophes), la page (`pb` pour `page break` ou plutôt `page beginning` (puisqu’on le met au début de la première page)). On pourrait avoir `lb` (line beginning).

Mettre en correspondance le facsimilé et la transcription. La TEI n’impose pas d’unité de mesure pour la définition des coordonnées, mais elle fournit les champs pour définir les zones.
- cas simple : les zones à définir sont rectangulaire : on a besoin seulement de deux points (deux angles opposés). La TEI fournit : `@ulx`, `@uly`, `@lrx`, `@lry` (ul pour upper left, et lr pour lower right).
- cas de formes non-rectangulaires: on a besoin de tous les points. Dans ce cas on utilise qu’un seul attribut, @point, avec une série de coordonnées.

#### Exemple : Teleme100.
- on définit des zones auxquelles on donne des coordonnées.

> l’attribut facs (`@facs`) permet de pointer vers une image. Le plus logique reste de pointer vers les éléments de la structure matérielle, mais on peut les mettre un peu n’importe où. On peut renvoyer simplement vers le nom d’un fichier directement, mais on peut aussi préciser un lien url ou les identifiants de zones préalablement définies.
Les éléments seg peuvent porter le facs pour définir des zones arbitrairement, qui ne correspondent pas forcément à une élément sémantique.
On peut utiliser des linkGrp pour faire des correspondances. Permet notamment de mettre ensemble plusieurs mises en correspondances contradictoires.

### Suite du TP
1. créer un élément `facsimilé` et y définit des groupes de surfaces et des zones. Mettre en correspondance les sections de la transcription avec les zones définies (sans créer de segment).
2. L’élément `graphic` permet de renvoyer vers une image de référence, avant de définir des éléments zone qui se référent à cette image. Cela permet d’éviter qu’on utilise ensuite la mauvaise image de référence par exemple.

### 2) description du manuscrits

[…]

#### Intérêt de l’alignement
** HTR : Handwritten Text Recognition** : une application de l’OCR spécifique aux manuscrits.

L’intérêt de la liaison des facsimilés avec les fichiers xml, touche de nombreux domaine :
- permet le machine learning,
-  … .

Il existe plusieurs projets autour de l’OCR appliquée aux manuscrits, beaucoup ont débuté ces dernières années.
- [ORIFLAMMS](https://oriflamms.hypotheses.org/)
- [Transkribus](https://transkribus.eu/Transkribus/)

`Ocropy` : un outil programmé en python qui intègre des algorithmes de linéarisation des images, de segmentation.
« réseaux de neuronnes » → lié au Deep Learning.

**Logiciel pour traiter les images façon ocropy :**  `Ocropus`.
→ calcule la ségmentation des images. Génère des dossiers avec des fichiers qui contiennent le texte ligne à ligne. Permet un gain de temps relatif à l’efficacité de la transcription. Parfois considérable, parfois la différence n’est pas si nette.  Ce genre de traitement (algorithme de traitement de la mise en page) permet également de générer les coordonnées des segments de texte automatiquement.

> Logiciel de prétraitement des images : scan quelque chose (demander à Aurélia).

A part [OCROPY](https://github.com/tmbdev/ocropy) : il y a [Teseract 4](https://github.com/tesseract-ocr/tesseract ; aussi sur github ; plutôt pour textes imprimés). Globalement ces deux outils fonctionnent le mieux sur Linux.

### Les édition alographétiques
Quel est le projet :
- réaliser une **transcription** du manuscrit. Une transcription **imitative** (ou **halographétique**).
→ quelle modélisation pour cela ? (diapo 26).
(aka quels éléments veut-on représenter?)
- **le système graphique :** une dimension paléographique et une dimension linguistique. Des questions de granularité vont se poser sur ces deux aspects. Par système graphique on peut comprendre l’ensemble des signes et leur fonctionnement dans la langue écrite : mais à un certain niveau des variation de la lettre n’ont pas d’utilité linguistique, dépendent d’autres critères linguistiques.


> Proposition de Morgane :
- séparer les laisses
- garder les lettrines
- résoudre les (et), résoudre les abréviations mais proposer quand même les signes abréviatifs.

La séparation des laisses dépend de la structure intellectuelle du texte.
Lettrine sont de la décoration mais jouent aussi un rôle dans la mise en page.
Abréviations, clairement dans le système graphique.
On ajouter aussi un traitement des corrections

→ il faut définir le **niveau de granularité**, mais aussi l’arrangement d’un élément par rapport à un autre.


> Cf **Guidelines chapite 11** ; notamment **11.3** qui se rapporte à la transcription du texte et aux ajouts/modifications. + cf **diapo 29 à 31**.

**Questions à se poser pour la résolution d’abréviation :**
On n’a pas forcément l’abréviation seulement au niveau du mot ; il peut être au niveau du signe qui est résolu par une chaîne de caractères, et la résolution de l’abréviation ne concerne pas le reste des caractères du mots. → c’est un choix de modélisation à faire.

La même question peut se poser pour les régularisations de lettres (allographes).
> `pc` → ponctuation

**Comment se simplifier la vie dans l’encodage ?**
(`choice`, `orig`, `reg`, c’est très répétitif). → ce sont des noms, qui vont correspondre à des contenus arbitraires, définis dans la **DTD** (|`!ENTITY`)


## cours 3
Quand on fait de l’encodage qui essaie de rendre compte de la graphie, on a trois options :
- soit le caractère existe dans unicode (on copie le caracère, ou on peut utiliser son id pour xml).
- soit on complète en utilisant ce que la MUFI propose
- soit on définit soi-même le caractère

#### Encodage :
`<w>` permet de signaler un mot.
`<space/>` permet de marquer la présence d’une espace.
→ `<w>R<space/>ichard</w>` : permet de rassembler deux partie d’un même mot qui sont graphiquement séparé en plaçant un espace.

`@rend="aggl"` : pour signaler que deux mots doivent être lus séparément mais sont graphiquement accolés :
`<w rend="aggl">li</w><w>vels</w>`

`@rend="initiale_detachee"` : on pourrait avoir ce genre de rend dont on définit plus tard qu’il signifie que l’initiale est détachée du reste du mot (xslt).


On peut simplifier l’écriture du code en définissant des `entités`.
**Rappel** : les entités sont définies dans la DTD.
**Syntaxe** :
```
<!DOCTYPE [
<!ENTITY nom ‘’contenu’’>
...
]>
```
On utilise `& `dans le code pour convoquer cette entité, terminé par `;`, en le plaçant là où on veut que le contenu de l’entité soit affiché. Attention à la longueur du nom de l’entité, surtout si c’est très fréquent dans le texte.

Ex (pour des entités nommées `et-tironien` et `i`) :
```
<lb/><l>v rſ &et-tironien; leunſ &et-tironien; ueltreſ cae&i;gnableſ.</l>
```

#### Traiter le manuscrit en lui-même :
Description des manuscrits
Deux DTD ont été élaborées pour la description des manuscrits : `MASTER` et `ENRICH` (qui se fait ensuite en **RelaxNG**).
Cf diapo.

`msDesc` → implique des connaissances en codocologie.
Ce champs est articulé autour de plusieurs éléments :
- l’identifiant (seul élément obligatoire) : `msIdentifier`
- titre : `head`
- description du contenu : `msContent`
- description physique : `physDesc`
- l’histoire du manuscrit (où est-ce qu’il a été concu, par qui, son histoire depuis) : `history`

Si un manuscrit est en fait plusieurs manuscrits (différents d’un point de vue scientifique ; recueil scientifique) : `msPart` : une subdivision du ms. qui peut contenir sa description complète. `msFrag` dépend de la perspective inverse puisqu’il permet de décrire ensemble des fragments d’un même manuscrit conservés séparément.
- `@cert` permet d’indiquer le degré de certitude d’une affirmation.
- `@resp` peut être ajouté pour préciser la personne qui a proposé une hypothèse (de date, d'attribution, etc).

## Cours 4
> rattraper la correction sur l'encodage du msDesc à partir de la notice du Roland d'Oxford.

### physDesc
`physDesc` contient l'élément `objectDesc`qui permet de décrire les caractéristiques matérielles du manuscrit.  

> [...]

Remarque sur l'utilisation de `layout` : on peut se contenter d'insérer un texte directement dans layout, mais ajouter des balises (`measure`, `dimensions`/`height` ou `width`, `locus`, etc) permet de traiter ensuite les informations qui sont données ici pour une utilisation particulière.  

Invitation à regarder de plus près la question des **formules de reglure**.

#### Description de l'écriture des mains
- `handDesc`/`handNote`
- `scriptDesc`/`scriptNote`
- `typeDesc`/`typeNote`
- `decoDesc`/`decoNote`  
cf. diapo 72.
