## Surcharge de méthodes

Nous savons hériter d'une classe pour y insérer de nouvelles méthodes, mais nous ne savons pas étendre les méthodes déjà présentes dans la classe mère.

Nous voudrions une classe `GenderPersonne`, qui nous permettrait de définir un genre à nos personnages. Celle-ci devra modifier la méthode `__init__` pour ajouter la gestion du paramètre de genre.

On ne peut pas à proprement parler étendre le contenu d'une méthode, mais on peut la redéfinir :

```python
class GenderPersonne(Personne):
    def __init__(self, nom, prenom, age, gender):
        self.nom = nom
        self.prenom = prenom
        self.age = age
        self.gender = gender

    def saluer(self):
        print("Hello, {} {} {}!".format(self.gender, self.prenom, self.nom))
```

Cela fonctionne comme souhaité, mais vient avec un petit problème, le code de la méthode `__init__` est répété.
En l'occurrence il ne s'agit que de 3 lignes de code, mais lorsque nous voudrons apporter des modifications à la méthode de la classe `Personne`, il faudra les répercuter sur `GenderPersonne`, ce qui donne vite quelque chose de difficile à maintenir.

Heureusement, Python nous offre un moyen de remédier à ce mécanisme, et c'est super !
Oui, `super`, littéralement, une fonction un peu spéciale en Python, qui nous permet d'utiliser la classe parente (*superclass*).

`super` est une fonction qui prend initialement en paramètre une classe et une instance de cette classe. Elle retourne un objet *proxy* qui s'utilise comme une instance de la classe parente.

```python
>>> p = GenderPersonne('Doe', 'John', 38, 'M.')
>>> p.saluer()
Hello, M John Doe!
>>> super(GenderPersonne, p).saluer()
Hello, John Doe!
```

Au sein de la classe en question, les arguments de `super` peuvent être omis, ce qui nous permet de simplifier notre méthode `__init__` et d'éviter les répétitions.

```python
class GenderPersonne(Personne):
    def __init__(self, nom, prenom, age, gender):
        super().__init__(nom, prenom, age)
        self.gender = gender
```
