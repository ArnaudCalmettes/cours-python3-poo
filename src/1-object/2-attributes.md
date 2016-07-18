## Montre-moi tes attributs

Ensuite, nous avons dit qu'un objet était constitué d'attributs.
Ces derniers représentent des valeurs propres à l'objet.

Nos objets de type `User` pourraient par exemple contenir un identifiant (`id`), un nom (`name`) et un mot de passe (`password`).

En Python, nous pouvons facilement associer des valeurs à nos objets :

```python
class User:
    pass

# Instanciation d'un objet de type User
john = User()

# Définition d'attributs pour cet objet
john.id = 1
john.name = 'john'
john.password = '12345'

print('Bonjour, je suis {}.'.format(john.name))
print('Mon id est le {}.'.format(john.id))
print('Mon mot de passe est {}.'.format(john.password))
```

Le code ci-dessus affiche :

```text
Bonjour, je suis john.
Mon id est le 1.
Mon mot de passe est 12345.
```

Nous avons instancié un objet nommé `john`, de type `User`, auquel nous avons attribué deux attributs. Puis nous avons affiché les valeurs de ces attributs.

Notez que l'on peut redéfinir la valeur d'un attribut, et qu'un attribut peut aussi être supprimé à l'aide de l'opérateur `del`.

```python
>>> john.password = 'mot de passe plus sécurisé !'
>>> john.password
'mot de passe plus sécurisé !'
>>> del john.password
>>> john.password
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'User' object has no attribute 'password'
```
