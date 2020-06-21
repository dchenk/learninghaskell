{-# LANGUAGE TypeApplications #-}

import Data.Int (Int8)

allInt8s = [minBound @Int8 .. maxBound @Int8]

data Size =
    Sm
  | Med
  | Lg
  | XLg
  deriving (Show, Bounded, Enum)

allSizes = [minBound @Size .. maxBound @Size]