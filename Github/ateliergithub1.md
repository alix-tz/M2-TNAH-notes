Atelier Projet github

1. Est-ce qu'on a besoin de forker ?
On peut forker pour ne pas avoir de problèmes de conflits sur les branches. Sinon il faut être très très organisé.

2. Comment avoir accès aux branches des collègues quand on travaille sur le même repository ?

3. Quand on fait une issue pour réintégrer un pull request après modification, comment faire si on veut "annuler" ?
On peut fermer une issue sans problème. Pour les pull requests, on peut les annuler : il y a un bouton Revert (qui fonctionne comme un pull request d'annulation, qu'il faut confirmer).

4. Comment accepter une pull request ?
Elle ne s'accepte que sur l'interface utilisateur.

5. Qu'entendez-vous par capitainiser ?
suivre des normes avec des uri, une hiérarchie de fichiers, la création d'un fichier \_\_cts\_\_.xml, et l'ajout de renvoie dans le xml d'origine.
Le textgroup c'est en général des groupes de textes qui peuvent représenter des auteurs ou des collections de textes pour lesquels il fait sens. On peut utiliser un lieu tout seul.
La plupart du temps, il faut créer des identifiants. Note : TC évalue l'effort et la réflexion derrière le nommage ; c'est pas grave s'il n'est pas parfait.
Par convention on utilise plus de 0 dans le nom du textgroup quand dans les textes, parce qu'il y a plus de textgroup possibles.
La plupart du temps dans cts on doit ajouter les métadonnées dublincore.
Dans le fichier xml d'origine, on ajoute des éléments de citation. On va s'arranger pour que le système de citation fonctionne avec des xPath simples (un niveau pour les livres, un niveau pour les chapitres, un niveau pour les vers, etc).
En xPath, `//` signifie "à partir d'ici", qu'est-ce que soit le niveau de profondeur. -> dans le refdesc.
Ensuite, on n'a plus qu'à ajouter

6. Comment utiliser Travis ?
Déjà, on n'a pas besoin d'aller sur Travis, parce que Clérice a déjà connecter les repository avec Travis.
Pour le configurer, voire le cours5. -> le code est à mettre dans un fichier.travis.yml
Remarque, on n'a pas besoin de l'intégralité du fichier travis donné en exemple.
-> en gros, faire un copier-coller ; regarder la documentation de HookedUp (github.com/capitains/hooktest) qui explique tous les paramétrages. TC ne demande que la partie test, pas la partie automatisation de versions.

## Remarques :
1. Les issues ne sont pas des mails administratifs : inutile de mettre trop de formes. On fait au plus court.
2. Les mails ne sont pas des issues. -> les issues c'est ce qui permet à TC d'évaluer nos étapes de travail.
3. 1 issue = 1 problème
4. on mentionne avec @nom_dutilisateur
5. La syntaxe pour lier des issues et des pull requests entre elles c'est #1. On n'a pas besoin de le faire dans les titres d'issues : on le fait dans le corps
6. pour du code : ``` xml \n blabla \n ```


-> utiliser les outils types projetc, wiki (pour mettre le python du petit programme pour créer les fichiers \_\_cts\_\_.xml), etc.

---

récupérer un nom de dossier (textgroup), un nom de dossier (text) et

* Contenu du fichier __cts__.xml pour textgroup :
<textgroup xmlns="http://chs.harvard.edu/xmlns/cts" urn="urn:cts:{{namespace}}:{{textgroup}}">
<groupname xml:lang="{{lang}}">{{titre du document}}</groupname>
</textgroup>

* Contenu du fichier __cts__.xml pour work :
<work xmlns="http://chs.harvard.edu/xmlns/cts"
    groupUrn="urn:cts:{{namespace}}:{{textgroup}}"
    urn="urn:cts:{{namespace}}:{{textgroup}}:{{work}}"
    xml:lang="{{langue}}">
    <title xml:lang="{{langue}}">{{Titre}}</title>
    <edition workUrn="urn:cts:{{namespace}}:{{textgroup}}:{{work}}"
      urn="urn:cts:{{namespace}}:{{textgroup}}:{{work}}.{{edition}}" xml:lang="{{langue}}">
        <label xml:lang="{{langue}}">{{Titre}}</label>
        <description xml:lang="{{langue}}">{{description de l'édition}}</description>
    </edition>
</work>
