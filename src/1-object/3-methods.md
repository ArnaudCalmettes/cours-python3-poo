## Discours de la méthode

Enfin, les méthodes sont les opérations applicables sur les objets.
Ce sont en fait des fonctions qui recoivent notre objet en premier paramètre.

Nos objets `User` ne contiennent pas encore de méthode, nous découvrirons comment en ajouter dans le chapitre suivant.
Mais nous pouvons déjà imaginer une méthode `check_pwd` (*check password*) pour vérifier qu'un mot de passe entré correspond bien au mot de passe de notre utilisateur.

```python
def user_check_pwd(user, password):
    return user.password == password
```

```python
>>> user_check_pwd(john, 'toto')
False
>>> user_check_pwd(john, '12345')
True
```

Les méthodes recevant l'objet en paramètre, elles peuvent en lire et modifier les attributs.
Souvenez-vous par exemple de la méthode `append` des listes, qui permet d'insérer un nouvel élément, elle modifie bien la liste en question.
