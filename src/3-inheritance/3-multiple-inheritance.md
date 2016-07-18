## Une classe avec deux mamans

Avec l'héritage simple, nous pouvions étendre le comportement d'une classe.
L'héritage multiple va nous permettre de le faire pour plusieurs classes à la fois.

Il nous suffit de préciser plusieurs classes entre parenthèses lors de la création de notre classe fille.

```python
class A:
    def foo(self):
        return '!'

class B:
    def bar(self):
        return '?'

class C(A, B):
    pass
```

Notre classe `C` a donc deux mères : `A` et `B`. Cela veut aussi dire que les objets de type `C` possèdent à la fois les méthodes `foo` et `bar.

```python
>>> c = C()
>>> c.foo()
'!'
>>> c.bar()
'!'
```

### Ordre d'héritage

L'ordre dans lequel on hérite des parents est important, il détermine dans quel ordre les méthodes seront recherchées dans les classes mères.
Ainsi, dans le cas où la méthode existe dans plusieurs parents, celle de la première classe sera conservée.

```python
class A:
    def foo(self):
        return '!'

class B:
    def foo(self):
        return '?'

class C(A, B):
    pass

class D(B, A):
    pass
```

```python
>>> C().foo()
'!'
>>> D().foo()
'?'
```

Cet ordre dans lequel les classes parentes sont explorées pour la recherche des méthodes est appelé *Method Resolution Order* (*MRO*).
On peut le connaître à l'aide de la méthode `mro` des classes.

```python
>>> C.mro()
[<class '__main__.C'>, <class '__main__.A'>, <class '__main__.B'>, <class 'object'>]
>>> D.mro()
[<class '__main__.D'>, <class '__main__.B'>, <class '__main__.A'>, <class 'object'>]
```

C'est aussi ce *MRO* qui est utilisé par `super` pour trouver la classe suivante : étant donnée la classe en premier paramètre (ou la classe courante si appelée sans paramètres), il se charge de localiser la classe juste à sa droite dans le *MRO*.

```python
>>> c = C()
>>> super(C, c).foo() # A.foo
'!'
>>> super(A, c).foo() # B.foo
'?'
```

Les classes parentes n'ont ainsi pas besoin de se connaître les unes les autres pour se référencer.

```python
class A:
    def __init__(self):
        print("Initialisation d'un objet de type A")
        super().__init__()

class B:
    def __init__(self):
        print("Initialisation d'un objet de type B")
        super().__init__()

class C(A, B):
    def __init__(self):
        print("Initialisation d'un objet de type C")
        super().__init__()

class D(B, A):
    def __init__(self):
        print("Initialisation d'un objet de type D")
        super().__init__()
```

```python
>>> C()
Initialisation d'un objet de type C
Initialisation d'un objet de type A
Initialisation d'un objet de type B
<__main__.C object at 0x7fe7e8fd3198>
>>> D()
Initialisation d'un objet de type D
Initialisation d'un objet de type B
Initialisation d'un objet de type A
<__main__.D object at 0x7fe7e8fd32b0>
```

### Mixins

Les *mixins* sont des classes dédiées à une fonctionnalité particulière, utilisable en héritant d'une classe de base et de ce *mixin*.

Par exemple, plusieurs types que l'on connaît sont appelés séquences (`str`, `list`, `tuple`). Ils ont en commun le fait d'implémenter l'opérateur `[]` et de gérer le *slicing*.
On peut ainsi obtenir l'objet en ordre inverse à l'aide de `obj[::-1]`.

Un *mixin* qui pourrait nous être utile serait une classe avec une méthode `reverse` pour nous retourner l'objet inversé.

```python
class Reversable:
    def reverse(self):
        return self[::-1]

class ReversableStr(Reversable, str):
    pass

class ReversableTuple(Reversable, tuple):
    pass
```

```python
>>> s = ReversableStr('abc')
>>> s
'abc'
>>> s.reverse()
'cba'
>>> ReversableTuple((1, 2, 3)).reverse()
(3, 2, 1)
```

Ou encore nous pourrions vouloir ajouter la gestion d'une photo de profil à nos classes `User` et dérivées.

```python
class ProfilePicture:
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.picture = '{}-{}.png'.format(self.id, self.name)

class UserPicture(ProfilePicture, User):
    pass

class AdminPicture(ProfilePicture, Admin):
    pass

class GuestPicture(ProfilePicture, Guest):
    pass
```

```python
>>> john = UserPicture(1, 'john', '12345')
>>> john.picture
'1-john.png'
```
