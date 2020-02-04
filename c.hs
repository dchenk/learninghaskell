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

-- The "Eq" type class is implemented by types that support equality tests.
-- The functions an Eq implements are == and /=

-- The "Ord" type class is implemented by types that support ordering.

-- In GHC.Types there is: data Ordering = LT | EQ | GT
-- You can use the "compare" function on two Ord values to get their ordering.

orderingNums = compare 3 8

-- Almost all kinds of values can be ordered but not IO and not functions.

stringsOrder = "Awe" < "Boo"

compareInfix = 'z' `compare` 'a'

-- Members of the "Show" class can be presented as strings.

-- The function "show" takes a member of the "Show" class and returns its
-- string representation. The type of "show" is:
-- show :: Show a => a -> String

showNumsList = show [5, 62, -9]

showBoolT = show True
showBoolF = show False

-- Members of the "Read" class can be created out of a suitable string.
-- You can call "read" on a string to get the Read value out, but it helps to
-- use the call in a bigger expression from which type inference can be done
-- to determine what concrete type to read out.

readBool = read "True" || False -- This is the boolean True

readNum = (read "5") - 2

-- Or you can simply annotate the type of the expression by adding "::" and the type name.

readIntList = read "[5, -7]" :: [Int]

readAsInt = read "67" :: Int
readAsInteger = read "67" :: Integer
readAsFloat = read "67" :: Float

-- You can even read a tuple:
readTuple = read "('x', 87.2)" :: (Char, Double)
