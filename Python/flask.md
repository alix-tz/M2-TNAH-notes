tiré du cours-python.  

# Flask

Dans le cadre du cours sur Flask, nous construirons un petit [Gazetteer](https://en.wikipedia.org/wiki/Gazetteer). Un Gazetteer est un index de lieux avec des descriptions quand disponibles de ceux-ci

## Introduction

Flask est un framework pour le développement d'application web en Python. Son concurrent principal, Django, est un peu plus utilisé mais pose le problème de sa taille. Flask est parfait pour de petits projets ou des projets simples en général.

**Recommendation** : Le Tutorial de Miguel Grinberg est une référence ( https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world ). Son tutorial est en cours de publication open-access (fin de publication le 8 Mai 2018), il est disponible en entier (moyennant finance) à l'achat ( https://learn.miguelgrinberg.com/ ). *L'auteur de ce cours ne profite en rien de l'achat. Il s'agit de rendre à César ce qui est à César*.

Flask est un package python, et comme beaucoup de package Python, il est disponible au téléchargement via PyPI (**Py**thon **P**ackage **I**ndex) et s'installe via la commande `pip install flask`. 

### Travailler sur son propre projet : recommendations

*Il est important de revenir à ce passage plus tard dans votre cours quand il s'agira de rendre des devoirs*

Quand vous commencerez vos propres projets, nous vous recommandons de procéder toujours avec un *environnement virtuel* : une installation en vase clos de python qui permet de ne pas interférer avec d'autres projets. En effet, les packages python ont des version spécifiques (Flask existe ainsi en 0.12.2, 0.12.1, 0.11, 0.10, *etc*.) et suivant les projets, peut-être que différentes versions seront utilisées. Les environnement virtuels permettent cette cohabitation en faisant des installations limitées à un dossier en particulier.

#### Exemple

Disons que vous commencez un projet simple de veille technologique avec une sorte de micro-blog. Voici les commandes que nous ferions (avec le commentaire)

- `cd ~` *vous met dans votre dossier utilisateur*
- `mkdir veille-micro-blog` *crée un dossier appelé veille-micro-blog* (**A exécuter une fois seulement**)
- `cd veille-micro-blog` *vous déplace dans ce dossier*
- `python3 -m venv env` *crée un environnement virtuel dans un sous-dossier. Alternative à `virtualenv -p python3 env` (**A exécuter une fois seulement**)
- `source env/bin/activate` *remplace dans votre session de terminal le lien vers le python 3 global par un lien vers le python 3 de votre environnement virtuel*
- `pip install flask` *installe flask dans votre environnement virtuel* (**A exécuter une fois seulement**)

Soit si l'on sépare entre le à-faire-pour-mettre-en-place et le à-faire-à-chaque-fois :

```sh
cd ~
mkdir veille-micro-blog
cd veille-micro-blog
python3 -m venv env
source env/bin/activate
pip install flask
```

et 

```sh
cd ~/veille-micro-blog
source env/bin/activate
```

#### Note : Suis-je dans un environnement virtuel ?
Si un environnement virtuel est chargé, votre terminal affiche généralement son nom entre parenthèse. Sur ma machine, cela correspond à cela :

```
thibault@pompei:~$ source env/bin/activate
(env) thibault@pompei:~$
```

On peut tapper la commande `which python` pour savoir où se trouve notre python :

```
thibault@pompei:~$ which python
/usr/bin/python
thibault@pompei:~$ source env/bin/activate
(env) thibault@pompei:~$ which python
home/thibault/env/bin/python
```

*Pour savoir quels packages sont installés, vous pouvez taper `pip freeze` dans votre terminal sous votre environnement virtuel*

### Une application simple

Voyons comment faire un site simple. Le code qui suit a été copié dans un fichier python au chemin `cours-flask/exemple1/app.py`. **Important**: Vous devez avoir votre environnement virtual *sourcé* et tapez `python cours-flask/exemple1/app.py` depuis le dossier racine de ce cours. Une fois le code lancé, allez sur [http://127.0.0.1:5000/](http://127.0.0.1:5000/)
