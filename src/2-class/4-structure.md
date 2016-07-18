## Tu aimes les glaces, canard ?

Un objet en Python est défini par sa structure (les attributs qu'ils contient et les méthodes qui lui sont applicables) plutôt que par son type.

Ainsi, pour faire simple, un fichier sera un objet possédant des méthodes `read`, `write` et `close`. Tout objet respectant cette définition sera considéré par Python comme un fichier.

```python
class FakeFile:
    def read(self, size=0):
        return ''
    def write(self, s):
        return 0
    def close(self):
        pass

f = FakeFile()
print('foo', file=f)
```

Python est entièrement construit autour de cette idée, appelée *duck-typing* :
« Si je vois un animal qui vole comme un canard, cancane comme un canard, et nage comme un canard, alors j'appelle cet oiseau un canard » (James Whitcomb Riley)
