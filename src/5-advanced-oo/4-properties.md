## Propriétés

Les propriétés sont une manière en Python de « dynamiser » les attributs d'un objet.
Ils permettent de générer des attributs à la volée à partir de méthodes de l'objet.

Un exemple valant mieux qu'un long discours :

```python
class Person:
    def __init__(self, last_name, first_name):
        self.last_name, self.first_name = last_name, first_name

    @property
    def long_name(self):
        return '{} {}'.format(self.first_name, self.last_name)
```

On définit donc une propriété `long_name`, qui s'utilise comme un attribut. Chaque fois qu'on appelle `long_name`, la méthode correspondante est appelée et le résultat est calculé.

```python
>>> p = Person('Doe', 'John')
>>> p.long_name
'John Doe'
>>> p.first_name = 'Roger'
>>> p.long_name
'Roger Doe'
```

Il s'agit là d'une propriété en lecture seule, il nous est en effet impossible de modifier la valeur de l'attribut `long_name`.

```python
>>> p.long_name = 'Jacques Brel'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: can't set attribute
```

Pour le rendre modifiable, il faut ajouter à notre classe la méthode permettant de gérer la modification.

```python
class Person:
    def __init__(self, last_name, first_name):
        self.last_name, self.first_name = last_name, first_name

    @property
    def long_name(self):
        return '{} {}'.format(self.first_name, self.last_name)

    @long_name.setter
    def long_name(self, value):
        self.first_name, self.last_name = value.split()
```

```python
>>> p = Person('Doe', 'John')
>>> p.long_name = 'Jacques Brel'
>>> p.long_name
'Jacques Brel'
>>> p.first_name
'Jacques'
>>> p.last_name
'Brel'
```

Enfin, on peut aussi coder la suppression de l'attribut à l'aide de `@long_name.deleter`

```python
class Person:
    def __init__(self, last_name, first_name):
        self.last_name, self.first_name = last_name, first_name

    @property
    def long_name(self):
        return '{} {}'.format(self.first_name, self.last_name)

    @long_name.setter
    def long_name(self, value):
        self.first_name, self.last_name = value.split()

    @long_name.deleter
    def long_name(self):
        del self.first_name
        del self.last_name
```
