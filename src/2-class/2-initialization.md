## Initialisation

+ Méthode spéciale __init__
+ Permet d'intervenir suite à la création d'un objet pour l'initialiser dans un état stable (initialiser les attributs de l'objet)
+ Paramètres de la méthode __init__

Nous avons vu qu'instancier une classe était semblable à un appel de fonction.
Dans ce cas, comment passer des paramètres à une classe, comme on le ferait pour une fonction ?

Il faut pour cela comprendre les bases du mécanisme d'instanciation de Python.
Quand on appelle une classe, un nouvel objet de ce type est construit en mémoire, puis initialisé. Cette initialisation permet d'assigner des valeurs à ses attributs.

L'objet est initialisé à l'aide d'une méthode spéciale de sa classe, la méthode `__init__`. Cette dernière recevra les arguments passés lors de l'instanciation.

```python
class Personne:
    def __init__(self, nom, prenom, age):
        self.nom = nom
        self.prenom = prenom
        self.age = age

    def saluer(self):
        print("Hello, {} {}!".format(self.prenom, self.nom)
```

Nous retrouvons ici le paramètre `self`, qui peut donc aussi être utiliser pour modifier les attributs de l'objet.

```python
>>> p = Personne('Doe', 'John', 34)
>>> p.saluer()
Hello, John Doe!
```
