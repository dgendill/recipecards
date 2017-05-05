module Test.Main where

import Prelude
import Test.RC.Recipe as Recipe
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log, logShow)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  Recipe.test
