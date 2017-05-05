module RC.Units where

import Prelude
import Quantities
import Control.Alternative (class Applicative)
import Data.Const (Const(..))
import Data.Generic (class Generic, gShow)
import Data.Maybe (Maybe(..))
import Ingredient (Ingredient(..))

amountOf :: DerivedUnit -> Number -> String -> Ingredient
amountOf du amount i = Ingredient i (quantity amount du)

cupsOf :: Number -> String -> Ingredient
cupsOf = amountOf cup

tablespoonsOf :: Number -> String -> Ingredient
tablespoonsOf = amountOf tablespoon

teaspoonsOf :: Number -> String -> Ingredient
teaspoonsOf = amountOf teaspoon

ouncesOf :: Number -> String -> Ingredient
ouncesOf = amountOf ounce
