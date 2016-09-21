-- |
-- Module      : Numeric.Exponent.Monomorphic.Int
-- Copyright   : (c) Justus Sagemüller 2016
-- License     : GPL v3
-- 
-- Maintainer  : (@) sagemueller $ geo.uni-koeln.de
-- Stability   : experimental
-- Portability : portable
-- 


module Numeric.Exponent.Monomorphic.Int where


import Prelude hiding ((^), (^^))
import qualified Prelude

{-# INLINE (^) #-}
-- | Exactly the same as 'Prelude.^', but more suited for the
--   typical use case of simply e.g. squaring a variable (@x^2@).
--   With the signature given here, the type of the small exponent
--   literal is efficiently fixed to 'Int' instead of being ambiguous
--   as in the standard version (which GHC usually, but not always
--   defaults to 'Integer').
(^) :: Num a => a -> Int -> a
(^) = (Prelude.^)

{-# INLINE (^^) #-}
(^^) :: Fractional a => a -> Int -> a
(^^) = (Prelude.^^)

