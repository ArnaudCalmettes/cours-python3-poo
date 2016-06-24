## TP

Vous vous souvenez de la classe `Post` pour représenter un message ?
Nous aimerions maintenant pouvoir instancier des fils de discussion (`Thread`) sur notre forum.

Qu'est-ce qu'un fil de discussion ?

* Un message associé à un auteur et à une date ;
* Mais qui comporte aussi un titre ;
* Et une liste de posts (les réponses).

Le premier point indique clairement que nous allons réutiliser le code de la classe `Post`, donc en hériter.

Notre nouvelle classe sera initialisée avec un titre, un auteur et un message.
`Thread` sera dotée d'une méthode `answer` recevant un auteur et un texte, et s'occupant de créer le post correspondant et de l'ajouter au fil.
Nous changerons aussi la méthode `format` du `Thread` afin qu'elle concatène au fil l'ensemble de ses réponses.

La classe `Post` restera inchangée.
Enfin, nous supprimerons la méthode `post` de la classe `User`, pour lui en ajouter deux nouvelles :

* `new_thread(title, message)` pour créer un nouveau fil de discussion associé à cet utilisateur ;
* `answer_thread(thread, message)` pour répondre à un fil existant.

```python
import crypt
import datetime

class User:
    def __init__(self, id, name, password):
        self.id = id
        self.name = name
        self._salt = crypt.mksalt()
        self._password = self._crypt_pwd(password)

    def _crypt_pwd(self, password):
        return crypt.crypt(password, self._salt)

    def check_pwd(self, password):
        return self._password == self._crypt_pwd(password)

    def new_thread(self, title, message):
        return Thread(title, self, message)

    def answer_thread(self, thread, message):
        thread.answer(self, message)

class Post:
    def __init__(self, author, message):
        self.author = author
        self.message = message
        self.date = datetime.datetime.now()

    def format(self):
        date = self.date.strftime('le %d/%m/%Y à %H:%M:%S')
        return '<div><span>Par {} {}</span><p>{}</p></div>'.format(self.author.name, date, self.message)

class Thread(Post):
    def __init__(self, title, author, message):
        super().__init__(author, message)
        self.title = title
        self.posts = []

    def answer(self, author, message):
        self.posts.append(Post(author, message))

    def format(self):
        posts = [super().format()]
        posts += [p.format() for p in self.posts]
        return '\n'.join(posts)

if __name__ == '__main__':
    john = User(1, 'john', '12345')
    peter = User(2, 'peter', 'toto')
    thread = john.new_thread('Bienvenue', 'Bienvenue à tous')
    peter.answer_thread(thread, 'Merci')
    print(thread.format())
```
