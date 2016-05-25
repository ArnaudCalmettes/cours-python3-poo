## Définition

On définit une classe à l'aide du mot-clef `class` survolé plus tôt :

```python
class Personne:
    pass
```

(l'instruction `pass` sert ici à indiquer à Python que le corps de notre classe est vide)

Il est conseillé en Python de nommer sa classe en *CamelCase*, c'est à dire qu'un nom est composé d'une suite de mots dont la première lettre est une capitale. On préférera par exemple une classe `MonNomDeClasse` que `mon_nom_de_classe`.
Exception faite des types *builtins* qui sont couramment écrits en lettres minuscules.

On instancie une classe de la même manière qu'on appelle une fonction, en suffixant son nom d'ne paire de parenthèses.
Cela est valable pour notre classe `Personne`, mais aussi pour les autres classes évoquées plus haut.

```python
>>> Personne()
<__main__.Personne object at 0x7fc28e538198>
>>> int()
0
>>> str()
''
>>> list()
[]
```

Notre classe `Personne` est ici identique à celle du chapitre précédent, elle ne comporte aucune méthode.
Pour définir une méthode dans une classe, il suffit de procéder comme pour une définition de fonction, mais dans le corps de la classe en question.

```python
class Personne:
    def saluer(self):
        print("Hello, {} {}!".format(self.prenom, self.nom)
```

Notre classe `Personne` possède maintenant une méthode `saluer` applicable sur tous ses objets.

```python
>>> p = Personne()
>>> p.prenom, p.nom = 'John', 'Doe'
>>> p.saluer()
Hello, John Doe!
```

Quel est ce `self` reçu en premier paramètre par `saluer` ? Il s'agit simplement de l'objet sur lequel on applique la méthode.
La méthode étant définie au niveau de la classe, elle n'a que ce moyen pour savoir quel objet est utilisé.
C'est un comportement particulier de Python, mais retenez simplement qu'appeler `p.saluer()` équivaut à l'appel `Personne.saluer(p)`. C'est pourquoi `p` correspondra ici au paramère `self` de notre méthode.

`self` n'est pas un mot-clef du langage Python, le paramètre pourrait donc prendre n'importe quel autre nom. Mais il conservera toujours ce nom, par convention.
