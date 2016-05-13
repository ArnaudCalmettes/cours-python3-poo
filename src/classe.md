Classe
=================

```python
class Personne:
    def __init__(nom, prenom, age):
        self.nom = nom
        self.prenom = prenom
        self.age = age

    def saluer():
        print("Hello, {} {}!".format(self.prenom, self.nom)
```

+ Les classes définissent un type, la structure des objets de ce type

## Définition

+ Mot-clef class et conventions de nommage
+ Définir des méthodes dans une classe
+ Variable self

## Initialisation

+ Méthode spéciale __init__
+ Permet d'intervenir suite à la création d'un objet pour l'initialiser dans un état stable (initialiser les attributs de l'objet)
+ Paramètres de la méthode __init__


## Encapsulation


+ Notion de « visibilité » des attributs/méthodes, qui peuvent représenter des états/actions internes de l'objet ou des informations/opérations publiques
+ Convention de nommage pour les attributs et méthodes internes


## Structure d'un objet

+ L'objet est défini par ses attributs et ses méthodes (sa structure) plus que par son type
+ Différents exemples : un fichier serait un objet possédant des méthodes read, write et close
+ Python construit autour de cette idée que tout objet peut correspondre à ce qui est attendu pour peu qu'il adopte la même structure/interface
-> duck-typing
