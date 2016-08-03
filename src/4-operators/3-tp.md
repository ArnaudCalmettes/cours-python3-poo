## TP : Arithmétique simple

Oublions temporairement nos utilisateurs et notre forum, et intéressons-nous à l'évaluation mathématique.

Imaginons que nous voulions représenter une expression mathématique, qui pourrait contenir des termes variables (par exemple, `2 * (-x + 1)`).

Il va nous falloir utiliser un type pour représenter cette variable `x`, appelé `Var`, et un second pour l'expression non évaluée, `Expr`.
Les `Var` étant un type particulier d'expressions.

Nous aurons deux autres types d'expressions : les opérations arithmétiques unaires (`+`, `-`) et binaires (`+`, `-`, `*`, `/`, `//`, `%`, `**`).
Vous pouvez vous appuyer un même type pour ces deux types d'opérations.

L'expression précédente s'évaluerait par exemple à :

```python
BinOp(operator.mul, 2, BinOp(operator.add, UnOp(operator.neg, Var('x')), 1))
```

Nous ajouterons à notre type `Expr` une méthode `compute(**values)`, qui permettra de calculer l'expression suivant une valeur donnée, de façon à ce que `Var('x').compute(x=5)` retourne `5`.

Enfin, nous pourrons ajouter une méthode `__repr__` pour obtenir une représentation lisible de notre expression.

```python
import operator

def compute(expr, **values):
    if not isinstance(expr, Expr):
        return expr
    return expr.compute(**values)

class Expr:
    def compute(self, **values):
        raise NotImplementedError

    def __pos__(self):
        return UnOp(operator.pos, self, '+')

    def __neg__(self):
        return UnOp(operator.neg, self, '-')

    def __add__(self, rhs):
        return BinOp(operator.add, self, rhs, '+')

    def __radd__(self, lhs):
        return BinOp(operator.add, lhs, self, '+')

    def __sub__(self, rhs):
        return BinOp(operator.sub, self, rhs, '-')

    def __rsub__(self, lhs):
        return BinOp(operator.sub, lhs, self, '-')

    def __mul__(self, rhs):
        return BinOp(operator.mul, self, rhs, '*')

    def __rmul__(self, lhs):
        return BinOp(operator.mul, lhs, self, '*')

    def __truediv__(self, rhs):
        return BinOp(operator.truediv, self, rhs, '/')

    def __rtruediv__(self, lhs):
        return BinOp(operator.truediv, lhs, self, '/')

    def __floordiv__(self, rhs):
        return BinOp(operator.floordiv, self, rhs, '//')

    def __rfloordiv__(self, lhs):
        return BinOp(operator.floordiv, lhs, self, '//')

    def __mod__(self, rhs):
        return BinOp(operator.mod, self, rhs, '*')

    def __rmod__(self, lhs):
        return BinOp(operator.mod, lhs, self, '*')

class Var(Expr):
    def __init__(self, name):
        self.name = name

    def compute(self, **values):
        if self.name in values:
            return values[self.name]
        return self

    def __repr__(self):
        return self.name

class Op(Expr):
    def __init__(self, op, *args):
        self.op = op
        self.args = args

    def compute(self, **values):
        args = [compute(arg, **values) for arg in self.args]
        return self.op(*args)

class UnOp(Op):
    def __init__(self, op, expr, symbol=None):
        super().__init__(op, expr)
        self.symbol = symbol

    def __repr__(self):
        if self.symbol is None:
            return super().__repr__()
        return '{}{!r}'.format(self.symbol, self.args[0])

class BinOp(Op):
    def __init__(self, op, expr1, expr2, symbol=None):
        super().__init__(op, expr1, expr2)
        self.symbol = symbol

    def __repr__(self):
        if self.symbol is None:
            return super().__repr__()
        return '({!r} {} {!r})'.format(self.args[0], self.symbol, self.args[1])

if __name__ == '__main__':
    x = Var('x')
    expr = 2 * (-x + 1)
    print(expr)
    print(compute(expr, x=1))

    y = Var('y')
    expr += y
    print(compute(expr, x=0, y=10))
```
