## Encapsulation

Au sein d'un objet, les attributs peuvent avoir des sémantiques différentes.
Certains attributs vont représenter des propriétés de l'objet et faire partie de son interface (tels que le prénom et le nom de nos objets `Personne`). Ils pourront alors être lus et modifiés depuis l'extérieur de l'objet, on parle dans ce cas d'attributs publics.

D'autres vont contenir des données internes à l'objet, n'ayant pas vocation à être accessibles depuis l'extérieur, les attributs privés.
Par exemple, notre classe `Personne` pourrait générer un identifiant unique à la création d'une personne, cet identifiant ne devrait jamais être utilisé en dehors de l'objet.

De la même manière que pour les attributs, certaines méthodes vont avoir une portée publique et d'autres privée (on peut imaginer une méthode interne de la classe pour générer notre identifiant unique).
On nomme encapsulation cette notion de visibilité des attributs et méthodes d'un objet.

Certains langages^[C++, Java, Ruby] implémenent dans leur syntaxe des outils pour gérer la visibilité des attributs et méthodes, mais il n'y a rien de tel en Python.
Il existe à la place des conventions, qui indiquent aux développeurs quels attributs/méthodes sont publics ou privés.
Quand vous voyez un nom d'attribut ou méthode débuter par un `_` au sein d'un objet, il indique quelque chose d'interne à l'objet (privé).

```python
import uuid

class Personne:
    def __init__(self, nom, prenom, age):
        self.nom = nom
        self.prenom = prenom
        self.age = age
        self._id = self._generate_id()

    def _generate_id(self):
        return str(uuid.uuid4())
```

On note toutefois qu'il ne s'agit que d'une convention, l'attribut `_id` étant parfaitement visible depuis l'extérieur.

```python
>>> p = Personne('Doe', 'John', 34)
>>> p._id
'81e0c460-f628-438f-9499-448a31eec3c3'
```

Il reste possible de masquer un peu plus l'attribut à l'aide du préfixe `__`. Ce préfixe a pour effet de renommer l'attribut en y insérant le nom de la classe courante.

```python
class Personne:
    def __init__(self, nom, prenom, age):
        self.nom = nom
        self.prenom = prenom
        self.age = age
        self.__id = str(uuid.uuid4())
```

```python
>>> p = Personne('Doe', 'John', 34)
>>> p.__id
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'Personne' object has no attribute '__id'
>>> p._Personne__id
'd728fef5-830d-4c38-8b7f-4a2622fc83a1'
```

Ce comportement pourra surtout être utile pour éviter des conflits de noms entre attributs internes de plusieurs classes sur un même objet, que nous verrons lors de l'héritage.
