module RC.Conversion where

import Prelude
import Quantities
import Data.Symbol
import Data.Either (Either)
import Data.Newtype (class Newtype)
import Data.Quantity (convertTo, quantity)
import RC.Ingredient (Stuff)

data ContextualQuantity a = ContextualQuantity (SProxy a) Quantity
data ContextualUnit a = ContextualUnit (SProxy a) DerivedUnit

runContext :: forall a. (IsSymbol a) => ContextualQuantity a -> Quantity
runContext (ContextualQuantity _ q) = q

cConvert :: forall a
   . (IsSymbol a)
  => ContextualUnit a
  -> ContextualQuantity a
  -> Either UnificationError (ContextualQuantity a)
cConvert (ContextualUnit prox to) (ContextualQuantity _ quantity) = ContextualQuantity prox <$> (convert to quantity)

cConvertTo :: forall a
   . (IsSymbol a)
  => ContextualQuantity a
  -> ContextualUnit a  
  -> Either UnificationError (ContextualQuantity a)
cConvertTo (ContextualQuantity _ quantity) (ContextualUnit prox to) = ContextualQuantity prox <$> (convertTo quantity to)


cQuantity :: forall a. (IsSymbol a) => Number -> ContextualUnit a -> ContextualQuantity a
cQuantity amount (ContextualUnit prox du) = ContextualQuantity prox (quantity amount du)

cUnit :: forall a b. (IsSymbol a) => SProxy a -> DerivedUnit -> ContextualUnit a
cUnit prox du = ContextualUnit prox du
