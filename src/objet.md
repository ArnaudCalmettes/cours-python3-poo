Objet
=================

Tout d'abord, qu'est-ce qu'un objet ? En introduction, nous avons dit qu'un objet avait des propriétés 
et pouvait être manipulé avec des opérations, c'est bien beau tout ça mais qu'est-ce que ça peut 
bien vouloir dire concrétement ?

Pour vous éclairer, prenons le code suivant :

```python
def mk_personne(nom, prenom, age):
    return {
        'nom': nom,
        'prenom': prenom,
        'age': age
    }

def nom(personne, val=None):
    if val is not None:
        personne['nom'] = val
    return personne['nom']

def prenom(personne, val=None):
    if val is not None:
        personne['prenom'] = val
    return personne['prenom']

def age(personne, val=None):
    if val is not None:
        personne['age'] = val
    return personne['age']

def saluer(personne):
    print("Hello, {} {} !".format(prenom(personne), nom(personne))
```

Maintenant, définissons deux personnes avec leur nom, leur prénom et leur âge :

```python
personne1 = mk_personne("Poirot", "Hercule", 55)
personne2 = mk_personne("Holmes", "Sherlock", 60)
```

Puis saluons-les comme il se doit :

```python
saluer(personne1) #Affiche : 'Hello, Hercule Poirot !'
saluer(personne2) #Affiche : 'Hello, Sherlock Holmes !'
```

Si nous souhaitons en savoir un peu plus sur eux (leur prénom, leur nom et leur âge) ou même
changer ces informations, nous le pouvons aussi :

```python
print("J'ai {} ans.".format(age(personne1)))
#Affiche : 'J'ai 55 ans.'
print("Ah non, j'ai {} ans depuis hier en fait... Euh...".format(age(personne1, 56)))
#Affiche : 'Ah non, j'ai 56 ans depuis hier en fait... Euh...'
```

Si vous relisez notre définition d'objet, vous vous rendrez compte que nous venons d'en manipuler, du moins en quelque sorte.
En effet, nous avons défini (ou *instancié*) des personnes en donnant des valeurs à leurs propriétés (ou *attributs*) : nom, prénom et âge. 
Ces derniers étaient stockés dans un dictionnaire avec des couples 'nom de l'attribut : valeur'.
Ensuite, nous avons interagi avec ces personnes, notamment en utilisant la fonction (ou *méthode*) 'saluer'.

Nos personnes étaient donc comme des objets. En réalité, beaucoup de choses peuvent se modéliser par un objet et
en Python, tout est objet, mais nous en reparlerons plus tard. Pour le moment, intéressons nous à ce qui définit un objet.

## Type

Tout d'abord, un objet est l'instance d'un type. Si nous reprenons notre exemple, nos deux détectives sont deux personnes.
On dit qu'ils sont de type 'Personne'. Ce sont des instances de la classe 'Personne'.

Par bon sens, le nom du type décrit la sémantique de l'objet, ce qu'il est possible de faire avec. Si nous voyons qu'un objet est de type 'Personne', 
nous saurons intuitivement qu'il a un nom et que nous pouvons le saluer par exemple.

## Attributs

Ensuite, un objet est constitué d'attributs. Ces derniers représentent des valeurs propres à l'objet. Si nous reprenons notre code,
une personne a un nom, un prénom et un âge. Nous pouvons en général accéder et modifier facilement ces valeurs.

En Python, nous pouvons facilement donner des valeurs à nos objets :

```python
#Ne pas se soucier de cela pour le moment
class Object(object):
    pass
    
#Instanciation d'un objet de type Object
voiture = Object()
#Définition d'attributs pour cet objet
voiture.couleur = "rouge"
voiture.nombre_places = 5
#Présentation de l'objet
print("Je suis une voiture {}.".format(voiture.couleur))
print("J'ai {} places.".format(voiture.nombre_places))
```

Le code ci-dessus affiche : 

```text
Je suis une voiture rouge.
J'ai 5 places.
```

Nous avons créé un objet nommé voiture, de type 'Object', auquel nous avons attribué une couleur ainsi qu'un nombre de places. Puis nous avons affiché
ces valeurs. Vous remarquerez que bien qu'une voiture soit un objet, il aurait été plus précis que son type soit 'Voiture'.

## Méthodes

Enfin, les méthodes sont les opérations applicables sur les objets. Ce sont en fait des fonctions paramétrées avec un objet et qui peuvent
prendre d'autres paramètres. Si nous prenons l'exemple de notre fonction 'saluer', celle-ci prend bien un objet en paramètre.

De plus, les méthodes peuvent lire et modifier les attributs de l'objet suivant les cas, comme nous avons pu le faire avec la fonction 'age'.


À travers cette partie nous avons exploré et défini la notion d'objet. Un objet étant le fruit d'une classe, il est temps de
nous intéresser à cette dernière et à sa construction.


