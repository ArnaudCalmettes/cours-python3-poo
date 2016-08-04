## Attribut es-tu là ?

Nous savons récupérer et assigner un attribut dont le nom est fixé, cela se fait facilement à l'aide des instructions `obj.foo` et `obj.foo = value`.

Mais nous est-il possible d'accéder à des attributs dont le nom est variable ?

Prenons une instance `john` de notre classe `User`, et le nom d'un attribut que nous voudrions extraire :

```python
>>> john = User('john', '12345')
>>> attr = 'name'
```

La fonction `getattr` nous permet alors de récupérer cet attribut.

```python
>>> getattr(john, attr)
'john'
```

Ainsi, `getattr(obj, 'foo')` est équivalent à `obj.foo`.

On trouve aussi une fonction `hasattr` pour tester la présence d'un attribut dans un objet.
Elle est construite comme `getattr` mais retourne un booléen pour savoir si l'attribut est présent ou non.

```python
>>> hasattr(john, 'name')
True
>>> hasattr(john, 'last_name')
False
>>> hasattr(john, 'id')
True
```

De la même manière, les fonctions `setattr` et `delattr` servent respectivement à modifier et supprimer un attribut.

```python
>>> setattr(john, 'name', 'peter') # équivalent à `john.name = 'peter'`
>>> john.name
'peter'
>>> delattr(john, 'name') # équivalent à `del john.name`
>>> john.name
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'User' object has no attribute 'name'
```
