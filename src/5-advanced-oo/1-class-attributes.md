## Attributs de classes

Nous avons déjà rencontré un attribut de classe, quand nous nous intéressions aux parents d'une classe.
Souvenez-vous de `__bases__`, nous ne l'utilisions pas sur des instances mais sur notre classe directement.

En Python, les classes sont des objets comme les autres, et peuvent donc posséder leurs propres attributs.

```python
>>> class A:
...     pass
...
>>> A.foo = 'bar'
>>> A.foo
'bar'
```

Les attributs de classe peuvent aussi se définir dans le corps de la classe, de la même manière que les méthodes.

```python
class A:
    foo = 'bar'
```

On notera à l'inverse qu'il est aussi possible de définir une méthode de la classe depuis l'extérieur :

```
>>> def A_repr(self):
...     return 'A()'
...
>>> A.__repr__ = A_repr
>>> A()
```

L'avantage des attributs de classe, c'est qu'ils sont aussi disponibles pour les instances de cette classe.
Ils sont partagés par toutes les instances.

```python
>>> a = A()
>>> a.foo
'bar'
>>> A.foo = 'baz'
>>> a.foo
'baz'
```

C'est le fonctionnement du *MRO* de Python, il cherche d'abord si l'attribut existe dans l'objet, puis si ce n'est pas le cas, le cherche dans les classes parentes.

Attention donc, quand l'attribut est redéfini dans l'objet, il sera trouvé en premier, et n'affectera pas la classe.

```python
>>> a = A()
>>> a.foo
'baz'
>>> a.foo = 'foobar'
>>> a.foo
'foobar'
>>> A.foo
'baz'
>>> b = A()
>>> b.foo
'baz'
```

Attention aussi, quand l'attribut de classe est mutable, il peut être modifié par n'importe quelle instance de la classe.

```python
>>> class A:
...     foo = []
...
>>> a, b = A(), A()
>>> a.foo.append(5)
>>> b.foo
[5]
```

L'attribut de classe est aussi conservé lors de l'héritage, et partagé avec les classes filles (sauf lorsque les classes filles redéfinissent l'attribut, de la même manière que pour les instances).

```python
>>> class B(A):
...     pass
...
>>> B.foo
[5]
>>> class C(A):
...     foo = []
...
>>> C.foo
[]
```
