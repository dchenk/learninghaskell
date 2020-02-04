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

-- Members of the "Enum" class are considered to be enumerable (sequentially ordered).
-- The "succ" and "pred" functions can be used on "Enum" values.
-- You can use an Enum value in the starting or end position of a list range.

-- Some types that are in the Enum class: Char, Int, Float
-- The succ of False is True.

succChar = succ 'g'
succInt = succ 45
succFloat = succ 45 -- This is the Integer 46
succBoolF = succ False

-- Successors of floating point numbers:
succFloatDecimal = succ (56.8 :: Float) -- This is 57.8
succFloatDecimal2 = succ (53.7001 :: Double) -- This is 54.7001

-- Enumerating Enums:
orderingOptions = [LT .. GT] -- There need to be spaces around the ".." here.

-- Members of the "Bounded" class have a lower and upper bound.
-- The Int type is Bounded:
minIntVal = minBound :: Int
-- The type annotation is needed here because several different types have
-- a minBound values. Same goes for maxBound:
maxIntVal = maxBound :: Int

-- Chars are bounded:
minChar = minBound :: Char
maxChar = maxBound :: Char

-- So "minBound" and "maxBound" are in some sense polymorphic constants.

-- A tuple is Bounded if all its components are Bounded.
boundedTuple = maxBound :: (Int, Char)

-- Members of the "Num" class can act like numbers.

-- An integer constant can act (or go in the place of) any type that's a member
-- of the Num typeclass.
-- So if you do ":t 35" in GHCI you get: 35 :: Num p => p
-- Similarly for floating point numbers, which are Fractional:
-- If you do ":t 45.9" in GHCI you get: 45.9 :: Fractional p => p

-- The multiplication function (*) takes any two Num values.

-- Members of the "Integral" class are integer types, including Int and Integer.
-- Members of the "Floating" class are floating point numbers, including Float and Double.

-- The function "fromIntegral" takes an Integral and returns the value as the more general Num. Its type:
-- fromIntegral :: (Integral a, Num b) => a -> b

-- If you do ":t fromIntegral (5 :: Integer)" in GHCI you get:
-- fromIntegral (5 :: Integer) :: Num b => b

-- Yet checking the type of the following in GHCI gives "Integer":
num5FromInt = fromIntegral (5 :: Int)

-- Because you can't do "(length [1,5]) + 8.0" because that would be Int+Float you can
-- instead do:
usingFromIntegral = fromIntegral (length [1,5]) + 8.0
-- Here fromIntegral is being called with just an Int.
