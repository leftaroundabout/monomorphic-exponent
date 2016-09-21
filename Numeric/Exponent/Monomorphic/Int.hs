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


import Prelude hiding ((^))
import qualified Prelude

{-# INLINE (^) #-}
(^) :: Num a => a -> Int -> a
(^) = (Prelude.^)

