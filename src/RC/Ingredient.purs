module RC.Ingredient where

import Prelude
import Data.Quantity (Quantity)

type Stuff = String
type Description = String

data Ingredient = Ingredient Stuff Quantity

instance discardIng :: Discard Ingredient where
  discard = bind

instance showIng :: Show Ingredient where
  show (Ingredient name q) = (show q) <> " " <> name
