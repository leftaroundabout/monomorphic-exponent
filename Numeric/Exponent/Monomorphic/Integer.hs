-- |
-- Module      : Numeric.Exponent.Monomorphic.Integer
-- Copyright   : (c) Justus Sagemüller 2016
-- License     : GPL v3
-- 
-- Maintainer  : (@) sagemueller $ geo.uni-koeln.de
-- Stability   : experimental
-- Portability : portable
-- 


module Numeric.Exponent.Monomorphic.Integer where


import Prelude hiding ((^), (^^))
import qualified Prelude

{-# INLINE (^) #-}
(^) :: Num a => a -> Integer -> a
(^) = (Prelude.^)

{-# INLINE (^^) #-}
(^^) :: Fractional a => a -> Integer -> a
(^^) = (Prelude.^^)

