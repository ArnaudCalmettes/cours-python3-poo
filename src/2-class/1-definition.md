## La classe à Dallas

On définit une classe à l'aide du mot-clef `class` survolé plus tôt :

```python
class User:
    pass
```

(l'instruction `pass` sert ici à indiquer à Python que le corps de notre classe est vide)

Il est conseillé en Python de nommer sa classe en *CamelCase*, c'est à dire qu'un nom est composé d'une suite de mots dont la première lettre est une capitale. On préférera par exemple une classe `MonNomDeClasse` que `mon_nom_de_classe`.
Exception faite des types *builtins* qui sont couramment écrits en lettres minuscules.

On instancie une classe de la même manière qu'on appelle une fonction, en suffixant son nom d'une paire de parenthèses.
Cela est valable pour notre classe `User`, mais aussi pour les autres classes évoquées plus haut.

```python
>>> User()
<__main__.User object at 0x7fc28e538198>
>>> int()
0
>>> str()
''
>>> list()
[]
```

La classe `User` est identique à celle du chapitre précédent, elle ne comporte aucune méthode.
Pour définir une méthode dans une classe, il suffit de procéder comme pour une définition de fonction, mais dans le corps de la classe en question.

```python
class User:
    def check_pwd(self, password):
        return self.password == password
```

Notre classe `User` possède maintenant une méthode `check_pwd` applicable sur tous ses objets.

```python
>>> john = User()
>>> john.id = 1
>>> john.name = 'john'
>>> john.password = '12345'
>>> john.check_pwd('toto')
False
>>> john.check_pwd('12345')
True
```

Quel est ce `self` reçu en premier paramètre par `check_pwd` ? Il s'agit simplement de l'objet sur lequel on applique la méthode, comme expliqué dans le chapitre précédent. Les autres paramètres de la méthode arrivent après.

La méthode étant définie au niveau de la classe, elle n'a que ce moyen pour savoir quel objet est utilisé.
C'est un comportement particulier de Python, mais retenez simplement qu'appeler `john.check_pwd('12345')` équivaut à l'appel `User.check_pwd(john, '12345')`. C'est pourquoi `john` correspondra ici au paramère `self` de notre méthode.

`self` n'est pas un mot-clef du langage Python, le paramètre pourrait donc prendre n'importe quel autre nom. Mais il conservera toujours ce nom par convention.

Notez aussi, dans le corps de la méthode `check_pwd`, que `password` et `self.password` sont bien deux valeurs distinctes : la première est le paramètre reçu par la méthode, tandis que la seconde est l'attribut de notre objet.
