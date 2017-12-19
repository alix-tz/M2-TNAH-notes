# L'éco-système de la data
## Objectifs :
- mieux connaître le vocabulaire
- comprendre comment ça fonctionne en théorie

## Approche historique
Les informaticiens s'intéresse assez peu à la donnée, même s'ils s'intéressent éventuellement aux tuyaux par où elle passe. Parce que leur formation passe par le processus, par l'usage, avant de passer par la compréhension des informations manipulées. Ca ne pose pas de problème avec des systèmes de gestion, mais pas forcément quand on manipule des données patrimoniales.  

*Comment en est-on arrivé à un intérêt pour les données ?*  
Au milieu des années 2000 : énorme masses de données disponibles. Avant, les algo et les corpus étaient souvent séparés : on a besoin de corpus pour les usage, et des usage pour les corpus. En plus, en 2000 on a de plus en plus de données nativement numériques. Les géants du web s'intéressent à ces masses de données. Se pose alors la question des vérou technologique qui se posent quand on a des données en masse. On appelle l'adaptabilité technologique (capacité de "monter en charge") la `scalabilité`.

A partir des années 2000, les couts des programmes et des technologies vont être diminués grâve à la mise à disposition de programmes opensources (ex : hadoop). Les coûts pour traiter la donnée en masse deviennent *raisonnables*.  

Grâce à la production/au traitement plus massif des données, les usages de ces données deviennent plus "intéressants": on développe des algorithmes matures pour le traitement des données. Les algo utilisés aujourd'hui existent généralement depuis très longtemps finalement, mais ils n'avaient pas de corpus pour être testés.  

Il y a également des raisons économiques derrière ce développement : c'est la fin des budgets infinis dans les DSI. Avant 2000, les projets de DSI n'invoquaient jamais la question du coût d'un projet par rapport à ce qu'il apporte à l'entreprise. Par la suite, les DSI doivent fournir des justificatifs de budgets, avec le ROI (retour sur investissement).  

Les DSI ont commencé à s'intéresser à ce qu'il y avait déjà en terme de données dans les systèmes : question de la mise en valeur du capital informationnel de l'organisation, et question de savoir à quoi servent finalement les données qui sont déjà produites.  

Big Blue (la machine qui a gagné aux échecs contre Kasparov) : projet de montrer l'intérêt des machines en terme de calcul.  
Watson (machine qui a gagné à Jeopardy) : matériel spécifique : une machine énorme puisqu'il fallait une grosse capacité de calcul. Prémices de l'intelligence artificielle puisqu'il s'agissait d'atteindre un degré de compréhension de la langue. Par ailleurs, il fallait à Watson un accès à une base de connaissance (wikipédia) et une compréhension du langage.  
Moralité : le mouvement autour de la data a été rendu possible par la mise à disposition de données et de bases de connaissance libres, de matériel techno, et d'algo matures.   

## Terminologie : Big data, open data, linked data
Il y a eu une sorte d'idéal d'eldorado autour de la data, tout en isolant parfois chacun des protagnistes dans son coin.  

### Big data
C'est avant tout un "buzzword marketing" inventé par de brillants esprits pour continuer à faire vendre du matos informatique. Il recouvre tout de même une réalité qu'ils définit. Le `big data` n'est pas une technologie, c'est plutôt un mouvement informe mais qui caractérise quelque chose : la rencontre entre une très gde masse de données numériques, des capacités de traitement des données en masse, et des algorithmes de traitement de données matures et accessibles.  

#### Créer de la donnée

##### L'infrastructure de traitement
C'est la couche la plus basse du système d'information (cf. schéma du 1er cours). Le `verrou technologique` c'est la scalabilité (montée en charge à la fois en quantité de données et en nombre d'utilisateurs). Il est necessaire de casser ce verrou technologique. Il y a deux manière de le gérer.
- **une scalabilité verticale :** plus j'ai des données, plus j'ai des utilisateurs, plus ma machine est grosse (ça va tant que la loi de Moore n'est pas contredite). Le problème de cette scalabilité, c'est l'augmentation exponentielle du prix. La plupart de nos systèmes d'information fonctionnenet encore sur ce modèle, mais c'est aussi parce que peu ont besoin d'un autre modèle : peu sont confronté à ces limites technologiques pour les capacités de calcul.
- **une scalabilité horizontale :** ajouter des machines qui travaillent entre elles. Ca parait logique, mais ça pose des problèmes technologiques. Google est le premier à l'avoir mis en place. Remplacer plus régulièrement des petites machines coûte moins cher que de remplacer moins souvent des grosses machines (possible de faire jouer la concurrence dans ce cas-là).  

Le problème, c'est qu'un programme ne tourne que sur un processeur à la fois. Comment `paralléliser` les opérations. `Map reduce` : un algorithme qui permet de simplifier le codage de programmes informatique : il sépare le problème en mini-problèmes qui sont répartis entre les différent micro-processeurs. C'est très dur à programmer en informatique. Map Reduce est un framework qui permet de simplifier ce codage informatique.  

Autre problème : chaque machine a son propre système de fichier. C'est-à-dire que pour chaque fichier, l'adresse peut varier. Tout l'enjeu du `partitionnement/clustering`, c'est de faire croire à une machine qu'on a un seul système de fichier, mais qui est en réalité composé de plusieurs machines. Le problème, c'est qu'il faut savoir exactement quelles sont les données localisées sur telle machine. Par ailleurs le temps de réplication entre les machines, fait que le cluster n'est pas toujours dans le même état à un moment ou à un autre (ex: sur Google on peut avoir 2 résultats différents à une même requêtes à 30 secondes d'interval). Faire du clustering, c'est accepter qu'on n'a pas toutes les mêmes données sur un cluster (on n'est pas capable de garantir l'intégrité des données). Ca ne plait pas forcément aux banques ou aux assurances qui ne tolèrent pas l'erreur. Par contre pour d'autres types de données, on peut accepter que les données ne soient pas intègres.  

Ce sont les deux principaux enjeux/problèmes de la montée en puissance horizontale.  

Cela fait intervenir des questions concernant le stockage de la donnée. Arrivée des bases de données relationnelles (rappel : [Propriétés ACID d'une bdd](https://fr.wikipedia.org/wiki/Propri%C3%A9t%C3%A9s_ACID)).  
NoSQL : capacité de stockage qui s'appuie sur les systèmes de clustering et de parallélisation.  

#### Les algorithmes
Pour manipuler de la donnée, il faut qu'elle existe sous forme electronique :
- `OCR` : l'idée étant de créer du texte à partir de l'image numérisée ; l'OCR pose à nouveau la question de l'acceptation de l'erreur.  
- `speech to text` : transcription parole-texte ; elle est assez connue mais n'est pas encore totalement démocratisée car elle coûte encore assez cher par rapport à l'OCR. Le problème du speech to text c'est qu'en fonction de la langue, de la tonalité, de l'accent, de la qualité du son, on n'a pas le même résultat. Ca marche très bien pour les journaux télévisés, mais pour les débats ça ne marche pas : dès qu'il y a deux personnes qui parlent, c'est fini. Ce sont des systèmes d'entraînement : ils doivent encore être poussés. Mais les plus gros consommateurs de speech to text c'est l'armée et le ministère de l'intérieur (les services de renseignements quoi). Dans le speech to text, les entités nommées posent problème : pour les noms de lieux ça va, parce qu'il existe des dictionnaires, mais pour les noms de personnes, c'est pas encore ça.  

L'une des questions qui se pose c'est : qu'est-ce qu'on fait avec toutes ces données ? Comment seront-elles mises à disposition des chercheurs ?  

Extraire les données : c'est à dire les annoter de manière automatique. Inscription de ces termes dans un référentiel. Ça s'appelle notamment le `pattern matching`. Ca pose aussi des difficultés puisque ça peut provoquer des erreurs : associations de termes inadéquats, ambiguité entre les termes homographes, etc. Evaluation nécessaire de l'équilibre entre le bruit et le silence que ces annotations génèrent.  

Pour l'extraction des entités nommée, il est nécessaire de prendre en compte le contexte de la phrase + règles grammaticales, règles morphologiques, dictionnaires. On peut parfois se contenter de localiser une entité nommée, par forcément de l'identifier, ça dépend des besoins, et des moyens dont dispose un projet.  

- `Reconnaissance d'entité visuelle dans les images` qu'elles soient animées ou fices. cf [projet INA](http://diginpix.ina.fr) : permet d'identifier les logos, les oeuvres d'art, etc. Ca marche toujours avec des dictionnaires.  

Sans référenctiel, sans données, ces algo ne fonctionnent pas. `Données, apprentissage, algo` : un trio nécessaire pour ce genre de technologie. Ce qui pose un gros enjeu, ce n'est pas tant l'algo ou l'apprentissage, c'est bien le référentiel, et donc les données.  

- `Reconnaissance de locuteur` : cf. [speechtrax](http://speechtrax.ina.fr/). Fonctionne à partir de 3 minutes de parole.
- `Deep Learning` : systèmes qui fonctionnent sur des réseaux de neurones. Modèles mathématiques qui apprennent à la machine à reconnaître quelque chose, à l'associer à quelque chose. cf. [Google Video Intelligence](https://cloud.google.com/video-intelligence/).

Les enjeux autour de la reconnaissance du son sont fondamentaux en ce moment avec la développement des assistants personnels, etc.
 - `catégorisation automatique des textes` : peut reposer sur une classification (ex IPTC). On associe à chaque mot un vecteur de label. La présence d'un mot et sa fréquence est associé à un label. Technologie aussi utilisée sur Isidore.

 - `Marchin learning supervisé` : on a appris à la machine ce qu'elle devait apprendre. Le moteur utilise les documents déjà classés pour apprendre, puis il utilise la base d'indicateurs statistiques pour catégoriser les documents du corpus.

- `Text Mining et Lexicographie` : L'objectif est de faire une analyse du texte à partir d'un comptage. Par exemple, analyser le vocabulaire, analyser l'évolution d'un vocabulaire. cf un outil : `ngramm viewer.`

- `statistiques et data viz` : l'objectif est de raconter une histoire à partir des données pour qu'elles puissent accrocher l'oeil.

-----

#### Créer du lien
- L'analyse des métadonnées permet la `mise en relation automatique de contenus`. On ne gère pas le sens des mots : c'est uniquement une analyse systaxique des mots.  
- L'analyse des contenus permet de créer des clustering de documents (basé sur du machine learning non supervisé). Ces systèmes de clustering ne sont jamais destiné à des utilisateurs finaux.
- L'analyse des comportements (tracking d'utilisateurs). Recommandation par `analyse prédictive`. Exemple d'Amazon qui fait des suggestions en comparant l'historique d'un utilisateur à l'ensemble des autres historiques et à leur comportement. L'analyse prédictive ne se base absolument pas sur le contenu ou les métadonnées. Elle a des données, possède un modèle et essaie de produire un prochain modèle.   

La théorie de la longue traîne s'applique aussi aux systèmes prédictifs : la plus grosses masse de résultats est généralement déjà prédite. Mais la deuxième partie, la longue traîne, est plutôt de l'ordre du prescriptif dans les stratégie d'analyse qui peuvent être mises en place. Pour un service public : faut-il être prédictif ou prescriptif ? Ca tout de même dépend du service proposé.

- `AlphaGo de DeepMind` (Google) : une machine qui a gagné au jeu de Go, parce que le système apprend seul. C'est une application du machine learning. Le système auto-apprend en jouant contre lui-même : plus il joue, plus il affront d'autres joueurs, plus il est fort. A la différence de Big Blue qui était programmé ex nihilo, et qui n'apprenait puisqu'il était basé sur un ensemble de modèles fixes. Le `Machine learning`, c'est l'apprentissage continu de la machine par l'expérience. Il part de données et crée des modèles. Tout n'est pas modélisable, donc le robot n'est a priori pas encore près de remplacer l'humaine.  

Tous ces systèmes de traitement de la données, ne fonctionnent que si la donnée est propre. Donc le rôle des ingénieurs de la donnée est primordial : la machine est capable de tout mais elle ne fonctionne qu'avec l'aide de l'humain pour la création des données sur lesquelles elle travaille.

Les apports du Big data
- **apports technologique** : `scalabilité` et `maturité des algorithmes`
- **apports organisationnels :** `décloisonnement des silos` : nécessité de ne pas avoir des systèmes séparés les uns des autres, et de créer des liens transverses, avec une harmonisation des données et des systèmes. On parle de silos de données, de lacs de données. Un autre enjeu qui se pose : c'est celui de la `gouvernance des données`.
- **apports pour la gestion de l'information :** `libération des données` (à l'extérieur, mais aussi par rapport à leurs usages initiaux. Ex: les logs sont faits pour vérifier que le système fonctionne, mais on les utilise aujourd'hui pous faire des analysées comportementales).

----

### Open Data
L'objectif de l'open Data c'est de mettre à disposition des données en utilisant les capacité de partage du web, et en y associant une licence de réutilisation. Ce qui fait l'open data, c'est uniquement l'utilisation d'une licence, qui permet d'encadrer la réutilisation des données.  
Le premier grand dirigeant à avoir pris ce pas c'est B. Obama, qui avait promis dès son premier mandat de mettre à disposition les données de l’État Fédéral pour garantir une transparence (enjeux politiques de re-légitimation des actions des organisations fédérales vis-à-vis des citoyens).  
Il y a plusieurs acteurs impliqués autour de l'open data : les citoyens, les collectivités, les entrepreneurs, tout autour de la donnée.  

La problématique de la transparence est effectivement importante. Ces données transparentes sont effectivement essentielles. Elle implique tout un travail d'accessibilité et de visibilité de l'action de l’État. Malgré tout, quand on ouvre ces données, on est pas tous capables de les comprendre. Il est toujours nécessaire d'avoir un truchement pour manipuler la donnée : on a besoin d'une caste de personne qui savent comprendre ces données, donc n'importe quel citoyen ne peut pas aller sur data.gouv.fr et accéder (intellectuellement) aux données de l’État  
Du point de vue économique, l'Open Data n'a pas du tout généré l'élan économique qu'on annonçait. Il y a des sociétés qui se sont emparé de ces données, il y a des applications qu'on a créées et qui sont intéressantes. Mais il n'y a pas de ras-de-marée économique. Pourquoi ? Parce que les données mises en ligne sont pourries. Elles ont besoin d'être mises à jour, mises au propre, avec un mécanisme constant. Or les systèmes d'information des institutions n'étaient pas et ne sont pas au point pour cela. Par contre, ça a permis une meilleure coopération transversale entre différentes institutions (gain de temps et de procédure ; donc permet des économies d'échelle).  
Même s'il y a peu de volonté politique au sein des institutions pour l'open data (parce que ça coûte des sous), il y  a au moins une obligation légale de mise à disposition (avec exceptions pour organismes commerciaux, et données personnelles (Information et Liberté)). Rappel : un nom et une prénom sont des données personnelles. Les organisations se pressent peu parce que les décrets ne sont toujours pas parus.

#### Les licences
Les licences sont un encadrement de la réutilisation des données pour permettre la protection du producteur et du ré-utilisateur (droit d'auteur). En France on ne peut pas abandonner son droit d'auteur (inaliénable), on peut juste le déléguer.
NC-BY-SA.
=====

- **NC :** Non-Commercial : n'a pas vraiment de valeur juridique.
- **BY :** mention d'origine.
- **SA :** ShareAlike : si on utilise des données, on est obligé de remettre à disposition les données générées à partir des données avec la même licence. Évite l'`enclosure de données` (qu'on peut appeler canibalisation). Le problème c'est que ça implique pour une institution de prendre une responsabilité morale vis-à-vis des données, ce que toutes les institutions ne sont pas capables de faire.
(...)

#### Résultats
Le gouvernement a un portail qui permet de rechercher et de naviguer parmi les set de données. C'est grosso-modo une GED avec des set de données à télécharger.

#### Les apports de l'open data (dans une perspective patrimoiniale)
- La visibilité des fonds, plus simples à manipuler.
- transparence des activités (même si cette question n'a pas suffisamment été travaillée, manque de médiation).
- simplifier la réutilisation des données (notamment les référentiels qui sont très utilisés).

Retour constatés pour les institutions patrimoniales :
il y a assez peu d'usage des données de signalement (alors qu'elles ont été très bichonnées...), par contre les référentiels et les données d'usage sont très réutilisées.

#### bonnes pratiques pour l'open data
Tim Berners-Lee classe les pratiques d'open data, pour promouvoir un open data de qualité. Il a mis en place une typologie par les étoiles qui détermine la qualité des données ouvertes. Les deux dernières catégories sont liées au technologie du web sémantique.

- \* : Rendre les données disponibles sur le Web (quelque soit le format) avec une licence ouverte.
- \*\* : Rendre disponible les données dans un format structurées, par exemple Excel, plutôt que des images sacnnées de tableaux)
- \*\*\* : Utiliser des formats ouverts (CSV plutôt que Excel)

(90% des données en ligne ne vont pas au-delà de ces trois catégories)

- \*\*\*\* : Utiliser des URI pour identifier les choses pour que d'autres puissent pointer vers vos données
- \*\*\*\*\* : Lier les données aux autres personnes pour fournir du contexte

Ces deux derniers niveaux donnent lieu au `linked open data` : c'est la mise à disposition de données en utilisant une licence, tout en respectant les préconisations de Berners-Lee.

### Linked Data
(... cf cours ?)
