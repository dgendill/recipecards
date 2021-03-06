module Test.RC.Recipe where

import Prelude
import RC
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log, logShow)

test = do
  log $ formatRecipe brownies
  log "--------------"
  log "Halfed"
  log "--------------\n"
  log $ formatRecipe $ scale 0.5 brownies

brownies :: Recipe
brownies = mkRecipe
  [ eggs' 3 `rename` "Eggs"
  , cupsOf' "Sugar" 2
  , cupsOf' "Brown Sugar" 1
  , cupsOf "Cocoa" $ m34 + m2
  , teaspoonsOf "Salt" m12
  , ouncesOf' "Butter" 8
  , cupsOf "Flour" m12
  , teaspoonsOf' "Vanilla Extract" 2
  ]

biscuitMuffins :: Recipe
biscuitMuffins = mkRecipe []
