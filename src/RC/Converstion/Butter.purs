module RC.Conversion.Butter where

import Data.Symbol (SProxy(..))
import Quantities (gram, makeNonStandard)
import RC.Conversion (ContextualUnit(..))

stick :: ContextualUnit "butter"
stick = ContextualUnit
  (SProxy :: SProxy "butter")
  (makeNonStandard "stick" "stick" 113.0 gram)

cup :: ContextualUnit "butter"
cup = ContextualUnit
  (SProxy :: SProxy "butter")
  (makeNonStandard "cup" "cup" 226.0 gram)

tablespoon :: ContextualUnit "butter"
tablespoon = ContextualUnit
  (SProxy :: SProxy "butter")
  (makeNonStandard "tablespoon" "tablespoon" 14.175 gram)
