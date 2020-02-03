-- Num is a type class.
-- Fractional is a type class.

{-
> :info Num
class Num a where
  (+) :: a -> a -> a
  (-) :: a -> a -> a
  (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
  {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}
        -- Defined in ‘GHC.Num’
instance Num Word -- Defined in ‘GHC.Num’
instance Num Integer -- Defined in ‘GHC.Num’
instance Num Int -- Defined in ‘GHC.Num’
instance Num Float -- Defined in ‘GHC.Float’
instance Num Double -- Defined in ‘GHC.Float’
-}

-- There's no such thing as a single-element tuple. That'd just be one value, since you can wrap
-- a value in parentheses and nothing about it changes.
thisIsTrue = 5 == (5)

-- Tuples can be compared with one another if each of their components can be compared component-wise.
-- This is true:
compareTuples = (5, 'a', "hello") == (5, 'a', ['h', 'e', 'l', 'l', 'o'])

-- The function "fst" takes a tuple (pair) and returns its first component.
tupFst = fst ('x', 'y')

-- The function "snd" takes a tuple (pair) and returns its second component.
tupSnd = snd ('x', 'y')

tups = fst (5, 'u') > snd ("hello", 4)

-- The function "zip" takes two lists and returns a list (of that same length) of tuples having one
-- component from the first list and the second component from the second list at the same index.
-- The resultant list will have the length of the shorter of the two argument lists (the remaining
-- elements of the longer list are ignored).
zippedLists = zip [1, 3, 5] ['a', 'b', 'c']

zippedLists2 = zip ["Sun", "Mon", "Tue", "Wed", "Thr", "Fri", "Sat"] [1..7]

-- You can even zip a finite list with an infinite list.
zipFinInf = zip [5, 62, 89] [1..]
