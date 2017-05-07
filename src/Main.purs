module Main where

import Prelude
import RC
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log, logShow)
import Data.Array (foldMap)
import Data.List (fromFoldable)

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  log "running"
