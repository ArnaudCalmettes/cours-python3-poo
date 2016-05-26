## Héritage simple

L'héritage simple est le mécanisme permettant d'étendre une unique classe.
Il consiste à créer une nouvelle classe (fille) qui bénéficiera des mêmes méthodes et attributs que sa classe mère.
Il sera aisé d'en définir de nouveaux dans la classe fille, et cela n'altèrera pas le fonctionnement de la mère.

Reprenons notre classe `Personne`, à laquelle nous souhaiterions ajouter une méthode pour dire « au-revoir » à nos personnages.

```python
class ByePersonne(Personne):
    def bye(self):
        print("Bye {} {}".format(self.prenom, self.nom))
```

```python
>>> p1 = ByePersonne('Fitzerald', 'Roger', 18)
>>> p1.saluer()
Hello, Roger Fitzerald!
>>> p1.bye()
Bye Roger Fitzerald
>>> p2 = Personne('Doe', 'John', 38)
>>> p2.saluer()
Hello, John Doe!
>>> p2.bye()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'Personne' object has no attribute 'bye'
```

Nous pouvons avoir deux classes différentes héritant d'une même mère

```python
class MajorityPersonne(Personne):
    def major(self):
        return self.age >= 18
```

`ByePersonne` et `MajorityPersonne` sont alors deux classes filles de `Personne`.

L'héritage simple permet aussi d'hériter d'une classe qui hérite elle-même d'une autre classe.

```python
class NoIdeaPersonne(ByePersonne): # Use car examples
    def no_idea(self):
        pass
```

`NoIdeaPersonne` est alors la fille de `ByePersonne`, elle-même la fille de `Personne`. On dit alors que `Personne` est une ancêtre de `NoIdeaPersonne`.

On peut constater quels sont les parents d'une classe à l'aide de l'attribut `__bases__` des classes :

```python
>>> ByePersonne.__bases__
(<class '__main__.Personne'>,)
>>> MajorityPersonne.__bases__
(<class '__main__.Personne'>,)
>>> NoIdeaPersonne.__bases__
(<class '__main__.ByePersonne'>,)
```

Que vaudrait alors `Personne.__bases__`, sachant que la classe `Personne` est définie sans héritage ?

```python
>>> Personne.__bases__
(<class 'object'>,)
```

On remarque que, sans que nous n'ayons rien demandé, `Personne` hérite de `object`.
En fait, `object` est un ancêtre de toute classe Python. Ainsi, quand aucune classe parente n'est définie, c'est `object` qui est choisi.

### Sous-typage

Nous avons vu que l'héritage permettait d'étendre le comportement d'une classe, mais ce n'est pas tout.
L'héritage a aussi du sens au niveau des types, en créant un nouveau type compatible avec le parent.

En Python, la fonction `isinstance` permet de tester si un objet est l'instance d'une certaine classe.

```python
>>> isinstance(p1, ByePersonne)
True
>>> isinstance(p1, Personne)
True
>>> isinstance(p1, MajorityPersonne)
False
>>> isinstance(p1, object)
True
```

Mais gardez toujours à l'esprit qu'en Python, on préfère se référer à la structure d'un objet qu'à son type (*duck-typing*), les tests à base de `isinstance` sont donc à utiliser pour des cas particuliers uniquement, où il serait difficile de procéder autrement.
