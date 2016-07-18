## Hériter en toute simplicité

L'héritage simple est le mécanisme permettant d'étendre une unique classe.
Il consiste à créer une nouvelle classe (fille) qui bénéficiera des mêmes méthodes et attributs que sa classe mère.
Il sera aisé d'en définir de nouveaux dans la classe fille, et cela n'altèrera pas le fonctionnement de la mère.

Par exemple, nous voudrions étendre notre classe `User` pour ajouter la possibilité d'avoir des administrateurs.
Les administrateurs (`Admin`) possèderaient une nouvelle méthode, `manage`, pour administrer le système.

```python
class Admin(User):
    def manage(self):
        print('I am an über administrator!')
```

```python
>>> root = Admin(1, 'root', 'toor')
>>> root.check_password('toor')
True
>>> root.manage()
I am an über administrator!
>>> john = User(2, 'john', '12345')
>>> john.manage()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'User' object has no attribute 'manage'
```

Nous pouvons avoir deux classes différentes héritant d'une même mère

```python
class Guest(User):
    pass
```

`Admin` et `Guest` sont alors deux classes filles de `User`.

L'héritage simple permet aussi d'hériter d'une classe qui hérite elle-même d'une autre classe.

```python
class SuperAdmin(Admin):
    pass
```

`SuperAdmin` est alors la fille de `Admin`, elle-même la fille de `User`. On dit alors que `User` est une ancêtre de `SuperAdmin`.

On peut constater quels sont les parents d'une classe à l'aide de l'attribut `__bases__` des classes :

```python
>>> Admin.__bases__
(<class '__main__.User'>,)
>>> Guest.__bases__
(<class '__main__.User'>,)
>>> SuperAdmin.__bases__
(<class '__main__.Admin'>,)
```

Que vaudrait alors `User.__bases__`, sachant que la classe `User` est définie sans héritage ?

```python
>>> User.__bases__
(<class 'object'>,)
```

On remarque que, sans que nous n'ayons rien demandé, `User` hérite de `object`.
En fait, `object` est un ancêtre de toute classe Python. Ainsi, quand aucune classe parente n'est définie, c'est `object` qui est choisi.

### Sous-typage

Nous avons vu que l'héritage permettait d'étendre le comportement d'une classe, mais ce n'est pas tout.
L'héritage a aussi du sens au niveau des types, en créant un nouveau type compatible avec le parent.

En Python, la fonction `isinstance` permet de tester si un objet est l'instance d'une certaine classe.

```python
>>> isinstance(root, Admin)
True
>>> isinstance(root, User)
True
>>> isinstance(root, Guest)
False
>>> isinstance(root, object)
True
```

Mais gardez toujours à l'esprit qu'en Python, on préfère se référer à la structure d'un objet qu'à son type (*duck-typing*), les tests à base de `isinstance` sont donc à utiliser pour des cas particuliers uniquement, où il serait difficile de procéder autrement.
