## Propriétés

Les propriétés sont une manière en Python de « dynamiser » les attributs d'un objet.
Ils permettent de générer des attributs à la volée à partir de méthodes de l'objet.

Un exemple valant mieux qu'un long discours :

```python
class ProfilePicture:
    @property
    def picture(self):
        return '{}-{}.png'.format(self.id, self.name)

class UserPicture(ProfilePicture, User):
    pass
```

On définit donc une propriété `picture`, qui s'utilise comme un attribut. Chaque fois qu'on appelle `picture`, la méthode correspondante est appelée et le résultat est calculé.

```python
>>> john = UserPicture('john', '12345')
>>> john.picture
'1-john.png'
>>> john.name = 'John'
>>> john.picture
'1-John.png'
```

Il s'agit là d'une propriété en lecture seule, il nous est en effet impossible de modifier la valeur de l'attribut `picture`.

```python
>>> john.picture = 'toto.png'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: can't set attribute
```

Pour le rendre modifiable, il faut ajouter à notre classe la méthode permettant de gérer la modification.

On utilisera ici un attribut `_picture`, qui pourra contenir l'adresse de l'image si elle a été définie, et `None` le cas échéant.

```python
class ProfilePicture:
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._picture = None

    @property
    def picture(self):
        if self._picture is not None:
            return self._picture
        return '{}-{}.png'.format(self.id, self.name)

    @picture.setter
    def picture(self, value):
        self._picture = value

class UserPicture(ProfilePicture, User):
    pass
```

```python
>>> john = UserPicture('john', '12345')
>>> john.picture
'1-john.png'
>>> john.picture = 'toto.png'
>>> john.picture
'toto.png'
```

Enfin, on peut aussi coder la suppression de l'attribut à l'aide de `@long_name.deleter`, ce qui revient à réaffecter `None` à l'attribut `_picture`.

```python
class ProfilePicture:
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._picture = None

    @property
    def picture(self):
        if self._picture is not None:
            return self._picture
        return '{}-{}.png'.format(self.id, self.name)

    @picture.setter
    def picture(self, value):
        self._picture = value

    @picture.deleter
    def picture(self):
        self._picture = None

class UserPicture(ProfilePicture, User):
    pass
```

```python
>>> john = UserPicture('john', '12345')
>>> john.picture
'1-john.png'
>>> john.picture = 'toto.png'
>>> john.picture
'toto.png'
>>> del john.picture
>>> john.picture
'1-john.png'
```
