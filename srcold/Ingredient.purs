module Ingredient where

import Prelude
import Quantities

type Stuff = String
type Description = String

data Ingredient = Ingredient Stuff Quantity

-- portionAndQuantity1 :: Const Int (Scalable (p :: Portion, q :: Measured))
-- portionAndQuantity1 = Const 5
--
-- portionAndQuantity2 :: Const Int (Scalable (p :: Portion))
-- portionAndQuantity2 = Const 5
--
-- --myadd :: forall a. Const Int (Scalable a) -> Const Int (Scalable a) -> Int
-- --myadd a b = (unwrap a) + (unwrap b)
--
-- myadd :: forall b
--    . Ingredient "eggs" (Scalable (|b))
--   -> Ingredient "eggs" (Scalable (|b))
--   -> Maybe (Eith UnificationError Quantity)
-- myadd (Exact _ q1) (Exact _ q2) = Just $ qAdd q1 q2
-- myadd _ _ = Nothing
--
-- egg :: Ingredient "eggs" (Scalable ( p :: Portion, q :: Measured ))
-- egg = Exact "eggs" (Q.quantity (1/4) cup)
--
-- eggs :: Number -> Ingredient "eggs" (Scalable ( p :: Portion, q :: Measured ))
-- eggs n = Exact "eggs" (Q.quantity (n * (1/4)) cup)
-- --
-- data Ingredient (sym :: Symbol) a
--   = Exact Stuff Q.Quantity
--   | Inexact Stuff Description
-- --
-- -- -- derive instance gIng :: Generi Ingredient _
-- --
-- instance showIng :: (IsSymbol a) => Show (Ingredient a b) where
--   show (Exact stuff n) = (show n) <> " " <> stuff -- reflectSymbol stuff
--   show (Inexact stuff desc) = stuff



-- instance monoidIng :: Monoid Ingredient where
--   append Measured a Quantity Measured a Quantity
