myMin :: Ord a => [a] -> a
myMin [] = error "The list is empty"
myMin [x] = x
myMin (x:xs) = min x (myMin xs)

myReplicate :: Int -> a -> [a]
myReplicate n _ | n < 0 = error "Got a negative number"
myReplicate 0 _ = []
myReplicate n v = [v] ++ myReplicate (n - 1) v

myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

myTake :: Int -> [a] -> [a]
myTake n _ | n < 0 = error "Cannot take a negative number of elements"
myTake 0 _ = []
myTake _ [] = []
myTake n (x:xs) = x : myTake (n - 1) xs

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem v (x:xs)
  | v == x = True
  | otherwise = myElem v xs

-- Partial application.
-- Functions in Haskell technically accept at most one parameter and return one values.
-- That's why, e.g., the function type "a -> a -> a" is the same as "a -> (a -> a)".

compare100 :: (Ord a, Num a) => a -> Ordering
compare100 = compare 100

-- Notice that "compare100" was defined without a formal parameter because it's defined as "compare 100"
-- which returns a function.
compare100and105 = compare100 105

-- Partially applying infix functions using sections.
-- To partially apply a function as an infix function, surround the function and one of the parameters
-- on the side where you have a value already. This becomes a function that takes another argument
-- which will be used where the other parameter was left off.

squareIt = (^2)

multBy8 = (*8)

appendDot = (++ ".")

prependDot = ("." ++)

threeSquared = squareIt 3
fiveByEight = multBy8 5
wordAndDot = appendDot "Hi"
dotAndWord = prependDot "com"

-- This function works for positive integers (because of laziness) but will not terminate for 0 or negative integers.
isPositive = (`elem` [1..])

-- applyTwice takes a function and applies it two the second argument and then applies the function again.
applyTwice :: (f -> f) -> f -> f
applyTwice f x = f (f x)

-- This is: (5*3)*3
tripleFiveTwice = applyTwice (*3) 5

-- This is a function that takes an Integer and applies the (+7) function twice.
add7Twice = applyTwice (+7)

-- Another way to prepend to a list (using a partially applied function):
prependThreeTwice = applyTwice (3:) -- This is a function of type: [Integer] -> [Integer]

listWithThreePrependedTwice = prependThreeTwice [45, 70] -- This is: [3, 3, 45, 70]

-- This is also a function of type: [Integer] -> [Integer]
prependThreeFourTimes = applyTwice applyTwice (3:)
