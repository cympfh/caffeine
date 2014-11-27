CoffeeScript with S-Expression
---

We
like to use
Scheme or Clojure as *syntax*
but
as possible as
*keywords* are borrowed by CoffeeScript.

Caffeine is a Lisp language
and
compiled to CoffeeScript.

## func apply

```coffee
f a0, a1, a2
```

```clojure
(f a0 a1 a2)
```

## lambda abstraction

```coffee
() -> something
```

```clojure
(fn () something)
```

In coffee the `()` can be ommited,
but in *Caffeine* the omitting is not allowed.

## definition vars, functions

```coffee
a = 0
f = (a0, a1, a2) -> something
```

```clojure
(= a 0)
(= f (fn (a0 a1 a2) something))
```

I wanna use a syntax-sugar as follows (MIT-notation)

```clojure
(= (f a0 a1 a2) something)
```

## for-in

```coffee
for x in lst
  something
```

```clojure
(for (in x lst)
  something)
```

## for-of

```coffee
for a of obj
  something
```

```clojure
(for (of a obj)
  something)
```

## range list

CoffeeScript has two range list notations,
`[i .. j]` and `[i ... j]`.

For these, we use

```clojure
(.. i j)
(... i j)
```

## type-annotation

In the future, i will implement type-inference.

For types of *CoffeeScript*,
I should reffer to
[the types in the v8 engine](http://izs.me/v8-docs/classv8_1_1Primitive.html)

---

In *Caffeine*,
primitive types are

- Boolean
- Number
- String

and following object types

- Array (list type in *Haskell*)
    - `(Array a)` for Array of `a` (`a` is a type)
- Date (hmm...)
- Function (from `a` to `b`)
    - `(-> a b)`
- RegExp

What the types of the other objects (= general JSONs)

- Object (previous object types are `Object`)

### forall

The name of types are always begin with a capital letter.
The name which begins small letter
is type variable.

For example

```clojure
(:: (-> a a))
```

is read that
this is a function which
takes a value with any type
and return a value which type is same with the argument's.


### from of Function

We thinks that
a argument of Function is a tuple.

```clojure
(:: f0 (-> () Number))
(= f0 (fn () 1))

(:: f1 (-> (Number) Number))
(:: f1 (-> Number Number)) ; for syntax-sugar (almost functional programmers should prefer this)
(= f1 (fn (x) 1))

(:: f2 (-> (Number Number) Number)) ; the `(Number Number)` is 2-ary tuple (or a list in lisp)
(= f2 (fn (x y) 1))
```

---

In haskell,

```haskell
n :: Int
n = 0

f :: Int -> Int
f x = x * x
```

```clojure
(:: n Number)
(= n 0)

(:: f (-> Int Int))
(= f (fn (x) (* x x)))
```

