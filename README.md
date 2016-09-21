Haskell's `^` and `^^` operators are often used directly with number literals in the exponent, like

    Prelude> 9^2
    81

This works, but it is actually less straightforward than it looks: the type is

    (^) :: (Num a, Integral b) => a -> b -> a

The polymorphism of `a` is highly useful and not a problem since this is the _result type_ – it can thus generally be inferred from the context (except in GHCi or IHaskell).

Not so for the exponent type `b`: this doesn't occur in the result, so unless you call it with something of monomorphic number type (e.g. a variable that's already rigid from the environment), `b` is ambiguous. Now, Haskell has a special treatment for ambiguous number types: it defaults them to `Integer`. But there are a couple of problems with this:

- Type defaulting doesn't really fit in with a Hindley-Milner type system. Haskell98 is simple enough so it works out fine, but with more modern extensions GHC can often not be sure that it should default, as this might lead to incorrect type family resolution. It also seems to fail in (Rank-2) polymorphic function arguments.
- While the arbitrary-precision `Integer` type is a good default for `Num` in general (since it allows reliable exact arithmetic), it is actually overkill as an exponent type, for much the same reason it would be overkill as the result of [length](http://hackage.haskell.org/package/base/docs/Data-Foldable.html#v:length): if a number is too big to fit in a machine-sized `Int`, then there is little hope to fit a list with that length, or a number with that exponent, in the machine's memory (which, after all, usually needs to be adressed with those machine-sized ints).

The second point is less important – `Integer` exponents can still be reasonably efficient, and especially for the important case of small literal exponents the compiler should be able to inline them to fixed multiplications. Going by that argument, [numeric-prelude chooses the signature](http://hackage.haskell.org/package/numeric-prelude/docs/Algebra-Ring.html#v:-94-)

    (^) :: Ring a => a -> Integer -> a

We propose the signature

    (^) :: Num a => a -> Int -> a

in the module `Numeric.Exponent.Monomorphic.Int`. For specialty applications where big exponents might actually be needed (modular arithmetic?) we also offer `Numeric.Exponent.Monomorphic.Integer` with

    (^) :: Num a => a -> Integer -> a

They should be used thus:

    import Prelude hiding ((^))
    import Numeric.Exponent.Monomorphic.Int ((^))
