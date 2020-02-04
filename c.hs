sumThreeInts :: Int -> Int -> Int -> Int
sumThreeInts a b c = a + b + c

sumTwoIntsAnd1 = sumThreeInts 1

-- An Integer can be used for really large integers that an Int cannot fit.

factorial :: Integer -> Integer
factorial n = product [1..n]

-- The "pi" constant is the mathematical pi (that is, 3.14159).

-- The Float type has single-precision; the Double type has double-precision.
circumference :: Float -> Float
circumference r = 2 * pi * r

circumferenceD :: Double -> Double
circumferenceD r = 2 * pi * r

-- Note that:
-- circumference 4  = 25.132742
-- circumferenceD 4 = 25.132741228718345

-- The "Eq" type class is used for types that support equality tests.
-- The functions an Eq implements are == and /=
