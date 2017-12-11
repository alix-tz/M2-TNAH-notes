# Slide 2

- Ne pas parler de FRBR
- Essayer de faire construire des identifiants
	- Parler de la base Jonas, du catalogue de Perseus, voir le fichier stoa https://docs.google.com/spreadsheets/d/1RHN6KBulDGbpKATLU6PtwU4o5xVsaBB6xbQRtKjMyWE/edit#gid=0
	- Victor Hugo, Les Misérables, Éditions Ecole des Chartes
		- Traduction en anglais
	- Molière, Misanthrope, Labex Obvil
		- https://github.com/dramacode/moliere/blob/gh-pages/moliere_misanthrope.xml
	- Autres auteurs
		- https://github.com/oeuvres


# Ajout pendant le cours
- `urn:cts` : ça ne change pas (urn c'est comme http)
- `froLit` :
- `textgroup` : le group de textes, les auteurs
- `work` : l'oeuvre au niveau contextuelle
- `version` : l'édition
- `passage` : on ne le met pas quand on parle seulement du texte.

Démonstration sur Perseus Digital Library : http://cts.dh.uni-leipzig.de/text/urn:cts:latinLit:phi1294.phi002.perseus-lat2/passage/2.73
-> lien sur le coté permet d'accéder à l'API qui, à partir de l'identifiant de passage. Un autre site a été généré rien qu'à partir du GetPassage sans avoir à héberger tous les textes.

## Slide 3
un dossier `corpus` -> un dossier `data` (attention à la casse) -> un dossier par textgroup (identifié par un code ex : jns915) -> un dossier par oeuvre (ex jns1856) -> les fichiers édités en TEI.

Le dossier de textgroup et le dossier de work contiennent toujours un dossier de métadonnées, qui s'appelle `__cts__.xml`

## Slide 4
Si on doit recomposer le chemin vers le fichier html :
`corpus/data/jns915/__cts__.xml`. C'est l'urn qui permet de recomposer ce chemin.

Peu d'éléments obligatoires dans le fichier de métadonnées du textgroup :
- identifiant urn
- groupname
- (autre chose ?)

## Slide 5
Chemin :
`corpus/data/jns915/jns1856/__cts__.xml`

Métadonnées du work et de l'édition :
- urn
- langue d'écriture de l'oeuvre
- un titre
- noeuds edition, commentary, translation. Avec à chaque l'id du texte, et l'id de l'oeuvre à laquel le noeud appartient. Ces trois noeuds ont toujours un label.

## Slide 5bis
le noeud cpt correspond à capitains. On va voir ça un peu plus avec G. Poupeau.

## Exercice sur Perceval
textgroup : chrétien de troyes (id: jns135) (on se base sur la base Jonas pour les autorités en ancien français (cf les guidelines de CapiTainS)). [http://capitains.org/pages/guidelines].
work : Perceval (id: jns5280) (on se base aussi sur Jonas).
langue : fro (ancien français)
version : on met normalement l'identifiant du projet ; ex : dect-fro1.xml

-> on crée un dossier Corpus ; un dossier data ; un dossier jns135 ; un dossier jns5280.
Dans le dosser jns135, on crée un \_\_cts\_\_.xml. Pareil dans le dossier jns5280. On rempli comme il faut les métadonnées (à partir d'un modèle qu'on peut copier-coller)
cf. Corpus DECT dont T.Clérice se sert pour l'exemple.

jns135/\_\_cts\_\_.xml :
```
<textgroup xmlns="http://chs.harvard.edu/xmlns/cts" urn="urn:cts:froLit:jns135">
    <groupname xml:lang="fre">Chrétien de Troyes</groupname>
</textgroup>
```
jns135/jns5280/\_\_cts\_\_.xml :
```
<work xmlns="http://chs.harvard.edu/xmlns/cts"
    groupUrn="urn:cts:froLit:jns135"
    urn="urn:cts:froLit:jns135.jns5280"
    xml:lang="fro"
    xmlns:cpt="http://purl.org/capitains/ns/1.0#"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    >
    <title xml:lang="fre">Perceval</title>
    <title xml:lang="fre">Le conte du Graal</title>
    <edition
        workUrn="urn:cts:frolit:jns135.jns5280"
        urn="urn:cts:froLit:jns135.jns5280.dect-fro1"
        >
        <label xml:lang="fre">Perceval (DECT)</label>
        <description xml:lang="fre">
            Balisage grammatical et sémantique du Perceval par DECT
        </description>
        <cpt:structured-metadata>
            <dc:source>http://www.atilf.fr/dect/</dc:source>
        </cpt:structured-metadata>
    </edition>
</work>
```

nom du fichier contenant le texte : jns135.jns5280.dect-fro1.xml

## Slide 7
cf. Slide à la fin du cours 5 qui contient toute la configuration pour Travis.

http://capitains-validator.herokuapp.com/ -> permet de valider la capitainisation du texte. (Mais ne vérifie pas tout !)

## Slide 9
le système de citation :
livre.poeme.vers : système de citation de poèmes de Martial. ex : 2.74.5-2.74.6 = le livre 2, le poème 74 du vers 5 au vers 6.

xPath : méthode pour atteindre des noeuds dans un document XML.
exemple : /TEI/text/body/div/div[@n="1"]/div[@n="pr"]/l[@n="2"]
remarque : la première div n'a pas besoin d'une précision sur l'attribut parce que c'est en epidoc et qu'en epidoc il y a toujours une seule div dans le niveau qui suit body (type="edition"). On doit spécifier l'élément visé grâce au n donné en attribut.
