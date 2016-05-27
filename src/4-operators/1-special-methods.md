## Méthodes spéciales

Nous avons vu précédemment la méthode `__init__`, permettant d'initialiser les attributs d'un objet.
On appelle cette méthode une méthode spéciale, il y en a encore beaucoup d'autres en Python. Elles sont reconnaissables par leur nom débutant et finissant par deux *underscores*.

Vous vous êtes peut-être déjà demandé d'où provenait le résultat affiché sur la console quand on entre simplement le nom d'un objet.

```python
>>> class A:
...     pass
...
>>> A()
<__main__.A object at 0x7fefd77fae10>
```

Il s'agit en fait de la représentation d'un objet, calculée à partir de sa méthode spéciale `__repr__`.

```python
>>> A().__repr__()
'<__main__.A object at 0x7fefd77fae10>'
```

À noter qu'une méthode spéciale n'est presque jamais directement appelée en Python, on lui préférera dans le cas présent la fonction *builtin* `êepr`.

```python
>>> repr(A())
'<__main__.A object at 0x7fefd77fae10>'
```

Il nous suffit alors de surcharger cette méthode `__repr__` pour définir notre propre représentation.
Il est courant en Python que la représentation corresponde à l'expression à entrer sur l'invite de commande pour recréer l'objet en question.

```python
>>> class A:
...     def __repr__(self):
...         return 'A()'
...
>>> A()
A()
```

Une autre opération courante est la conversion de notre objet en chaîne de caractères afin d'être affiché via `print` par exemple.
Par défaut, la conversion en chaîne correspond à la représentation de l'objet, mais elle peut être surchargée par la méthode `__str__`.

```python
>>> class A:
...     def __repr__(self):
...         return 'A()'
...     def __str__(self):
...         return 'Objet de type A'
...
>>> a = A()
>>> a
A()
>>> repr(a)
'A()'
>>> str(a)
'Objet de type A'
>>> print(a)
Objet de type A
```
