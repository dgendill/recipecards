module RC.Units where

import Prelude
import Data.Units.SI
import Data.Int (toNumber)
import Data.Units (DerivedUnit, makeNonStandard, (.^))

largeEgg :: DerivedUnit
largeEgg = makeNonStandard "egg" "egg" 0.00005914706 (meter .^ 3.0)

m :: Int -> Number
m = toNumber

m1 :: Number
m1 = 1.0

m2 :: Number
m2 = 2.0

m12 :: Number
m12 = 0.5

m14 :: Number
m14 = 1.0 / 4.0

m34 :: Number
m34 = 3.0 / 4.0

m18 :: Number
m18 = 1.0 / 8.0

m38 :: Number
m38 = 3.0 / 8.0

m58 :: Number
m58 = 5.0 / 8.0

m78 :: Number
m78 = 7.0 / 8.0
