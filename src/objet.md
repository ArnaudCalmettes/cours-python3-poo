Objets et classes
=================

## Des données et des fonctions...

TODO: Élaborer sur cet exemple.

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
        personne['age'] = age
    return personne['age']

def saluer(personne):
    print("Hello, {} {} !".format(prenom(personne), nom(personne))
```

## Des attributs et des méthodes

TODO: Expliquer que le code précédent définit en fait des objets, avec des attributs
(les entrées du dictionnaire) et des méthodes (comme la fonction `saluer`).

## Notion de classe

```python
class Personne:
    def __init__(nom, prenom, age):
        self.nom = nom
        self.prenom = prenom
        self.age = age

    def saluer():
        print("Hello, {} {}!".format(self.prenom, self.nom)
```
