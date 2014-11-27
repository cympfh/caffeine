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

## type-annotation

In the future, i will implement type-inference.
For types of *CoffeeScript*,
I should reffer to
[the types in the v8 engine](http://izs.me/v8-docs/classv8_1_1Primitive.html)

In haskell,

```haskell
n :: Int
n = 0

f :: Int -> Int
f x = x * x
```

In *Caffeine*, primitive types are

- Boolean
- Number
- String
- Value (anything!)

and
we must think of a list of something and a function from `a` to `b`

```clojure
(:: n Number)
(= n 0)

(:: f (-> Int Int))
(= f (fn (x) (* x x)))
```

