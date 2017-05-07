module RC.Recipe where

import Prelude
import Prelude as P
import Quantities
import Data.Decimal as D
import Control.Alternative (class Applicative)
import Data.Array (foldl)
import Data.Foldable (class Foldable)
import Data.Int (toNumber)
import Data.List (List, foldMap, fromFoldable, singleton)
import Data.Newtype (class Newtype)
import Data.String (length)
import Data.Tuple (Tuple(..))
import RC.Ingredient (Ingredient(..))
import RC.Units (largeEgg)
import Text.Format (format, width)

newtype RecipeNT a = RecipeNT (List a)

type Recipe = RecipeNT Ingredient

derive instance newtypeRecipe :: Newtype (RecipeNT a) _
derive newtype instance applicRecipe :: Applicative RecipeNT
derive newtype instance bindRecipe :: Bind RecipeNT
derive newtype instance foldableRecipe :: Foldable RecipeNT

instance showRecipe :: (Show a) => Show (RecipeNT a) where
  show (RecipeNT l) = show l

runRecipe :: forall a. RecipeNT a -> List a
runRecipe (RecipeNT a) = a

formatRecipe :: Recipe -> String
formatRecipe recipe =
  foldMap (append "") $ runRecipe $ do
    (Ingredient name quantity) <- recipe
    pure $ (padName name) <> " - " <>  (mprettyPrint quantity) <> "\n"
  where
    maxstr = foldl (\maxlength (Ingredient name quantity) -> do
        P.max (length name) maxlength
      ) 0 recipe
    padName = format (width maxstr)


mprettyPrint :: Quantity -> String
mprettyPrint q =
  case prettyPrint' q of
    Tuple v u -> v <> " " <> u

mkRecipe :: Array Ingredient -> Recipe
mkRecipe = RecipeNT <<< fromFoldable

scale :: Number -> Recipe -> Recipe
scale amount recipe = RecipeNT $ foldMap (\(Ingredient name quantity) -> do
    singleton (Ingredient name (qMultiply (scalar amount) quantity))
  ) recipe

pluralize :: Number -> String -> String
pluralize n s =
  if n == 0.0 || n > 1.0
    then s <> "s"
    else s

eggs :: Number -> Ingredient
eggs amount = Ingredient (pluralize amount "egg") (quantity amount largeEgg)

eggs' :: Int -> Ingredient
eggs' = eggs <<< toNumber

amountOf :: DerivedUnit -> String -> Number -> Ingredient
amountOf du i amount = Ingredient i (quantity amount du)

cupsOf :: String -> Number -> Ingredient
cupsOf = amountOf cup

cupsOf' :: String -> Int -> Ingredient
cupsOf' n = cupsOf n <<< toNumber

tablespoonsOf :: String -> Number -> Ingredient
tablespoonsOf = amountOf tablespoon

tablespoonsOf' :: String -> Int -> Ingredient
tablespoonsOf' n = tablespoonsOf n <<< toNumber

teaspoonsOf :: String -> Number -> Ingredient
teaspoonsOf = amountOf teaspoon

teaspoonsOf' :: String -> Int -> Ingredient
teaspoonsOf' n = teaspoonsOf n <<< toNumber

ouncesOf :: String -> Number -> Ingredient
ouncesOf = amountOf ounce

ouncesOf' :: String -> Int -> Ingredient
ouncesOf' n = ouncesOf n <<< toNumber
