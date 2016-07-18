## Des méthodes un peu spéciales

Nous avons vu précédemment la méthode `__init__`, permettant d'initialiser les attributs d'un objet.
On appelle cette méthode une méthode spéciale, il y en a encore beaucoup d'autres en Python. Elles sont reconnaissables par leur nom débutant et finissant par deux *underscores*.

Vous vous êtes peut-être déjà demandé d'où provenait le résultat affiché sur la console quand on entre simplement le nom d'un objet.

```python
>>> john = User(1, 'john', '12345')
>>> john
<__main__.User object at 0x7fefd77fae10>
```

Il s'agit en fait de la représentation d'un objet, calculée à partir de sa méthode spéciale `__repr__`.

```python
>>> john.__repr__()
'<__main__.User object at 0x7fefd77fae10>'
```

À noter qu'une méthode spéciale n'est presque jamais directement appelée en Python, on lui préférera dans le cas présent la fonction *builtin* `êepr`.

```python
>>> repr(john)
'<__main__.User object at 0x7fefd77fae10>'
```

Il nous suffit alors de surcharger cette méthode `__repr__` pour définir notre propre représentation.

```python
class User:
    ...

    def __repr__(self):
        return '<User: {}, {}>'.format(self.id, self.name)
```

```python
>>> User(1, 'john', '12345')
<User: 1, john>
```

Une autre opération courante est la conversion de notre objet en chaîne de caractères afin d'être affiché via `print` par exemple.
Par défaut, la conversion en chaîne correspond à la représentation de l'objet, mais elle peut être surchargée par la méthode `__str__`.

```python
class User:
    ...

    def __repr__(self):
        return '<User: {}, {}>'.format(self.id, self.name)

    def __str__(self):
        return '{}-{}'.format(self.id, self.name)
```

```python
>>> john = User(1, 'john', 12345)
>>> john
<User: 1, john>
>>> repr(john)
'<User: 1, john>'
>>> str(john)
'1-john'
>>> print(john)
1-john
```
