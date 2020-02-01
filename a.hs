nums = [872, -3, 19]

-- The "cons operator"
alsoNums = 872:(-3):19:[]

-- The first element in the list nums
numsHead = head nums

-- The elements in the list nums after the head
numsTail = tail nums

-- The last element in the list nums
numsLast = last nums

-- All but the last element of the list nums
numsInit = init nums

-- A string is just a list of Char elements.
-- So "abc" is syntactic sugar for ['a', 'b', 'c']
stringIsList = "abc" == ['a', 'b', 'c']

-- So "head", "tail", "last", and "init" work for strings.
sHead = head "friend"
sTail = tail "friend"
sLast = last "friend"
sInit = init "friend"

{-
    HEAD  ------TAIL------
   [ 'w' , 'x' , 'y' , 'z' ]
    ------INIT------   LAST
-}

-- In GHCI you can ":doc thing" to get a doc comment about "thing".

-- The length function returns the length of the given list.
lengthFriend = length "friend"

-- The type of "length" is actually: Foldable t => t a -> Int

-- The function "null" returns true if and only if the list it's called with is empty.
emptyIsnull = null []

listWithStuffIsNotNull = null "0" -- False.

-- You can compare lists (and therefore strings) for equality and inequality if the element
-- types can be compared. The comparison is done lexicographically.
compareStrings = "abc" < "abcd"
compareStrings2 = "b" < "cd"

compareLists = [] < [-4] -- This is True.

-- Reverse a list.
numsReversed = reverse nums
strReversed = reverse "abcde"

-- The function "take" returns the first specified number of elements from the list given.
-- Call "take" with an integer an a list. If the integer is greater than the length of the list,
-- then the entire list is returned.
first3 = take 3 "Happy"
first0 = take 0 "Happy"
takeTons = take 32423523523 "Happy"

first3b = take 3 [56, 8283, 9, 654]

-- The function "drop" returns all but the first specified number of elements in the list given.
-- If the number given is greater than the length of the list, an empty list is returned.
drop3 = drop 3 "Friend"
dropAll = drop 800 "Friend"

-- The greatest value in the list.
maxOfList = maximum [56, 23525, 0, -5, 4]

minOfList = minimum [56, 23525, 0, -5, 4]

maxOfStr = maximum "xyzaaa" -- This is the Char 'z'

-- Sum of numbers.
sumOfNums = sum [5, 7, 1]
sumOfNone = sum [] -- This is 0

-- You cannot "sum" a list of Char.
-- Type of "sum":
-- sum :: (Foldable t, Num a) => t a -> a

-- Product of numbers.
productOfNums = product [3, 5, 2]

-- Type of "product":
-- product :: (Foldable t, Num a) => t a -> a

-- The function "elem" returns whether the first argument is found in the list given as the second argument.
isInList = elem 'x' "hexagon"
-- It's cleaner to call elem as an infix function:
isInList2 = 'x' `elem` "hexagon"

negativeThreeElemNums = -3 `elem` nums -- This is True

-- Type of "elem":
-- elem :: (Foldable t, Eq a) => a -> t a -> Bool

-- Range syntax:
oneToTwenty = [1..20] -- This is 20 elements, first one being 1 and last one 20.

-- Characters can be in a sequence:
charsSeq = ['a'..'n']

-- Going from capital 'A' to lowercase 'z' includes ASCII characters between the two cases:
-- Here is "ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz"
allLetters = ['A'..'z']

-- Ranges with a step: Specify the first two elements (separated by a comma) and then .. and the last element.
-- This list starts at 1, then has 3 and every other number until an including 17.
rangeWithStep = [1,3..17]

-- In a range with a step, the upper bound number need not actually end up in the resultant list, if
-- it is not a multiple of the offset step.
range2 = [2,4..9] -- This is [2,4,6,8]

-- To get a decreasing list using a range, give the first two elements and then the range to the lowest element.
decreasingRange = [20,19..1]

-- An infinite list can be specified using a range without an upper bound:
-- Don't try to evaluate it in GHCI.
unboundedList = [5..]

-- Laziness on display: Call the "take" function with an infinite list, but ask for only some of the elements.
-- This returns just the first 7 elements:
takeOnlySome = take 7 [5..]

-- The function "cycle" takes a list and repeats it infinitely.
-- Don't try to evaluate this in GHCI.
cycleMyList = cycle [2, 67, 23]

-- But if you take only some elements, it does what you expect:
cycleTakeSome = take 15 (cycle [2, 67, 23])

cycleWord3 = take (length "Wow " * 3 - 1) (cycle "Wow ") -- This is "Wow Wow Wow"

-- The function "repeat" takes a value and returns an infinite list of that element.
-- Don't try to evaluate this in GHCI.
infinite7 = repeat 7

infinite7taken = take 40 infinite7

infiniteEmptyListTaken = take 3 $ repeat []

-- Instead of "take" with "repeat" you should just use "replicate" which repeats an element a
-- specified number of times.
replicate7 = replicate 40 7 -- This is a 40-element list of the value 7.

-- The type of "replicate":
-- replicate :: Int -> a -> [a]

-- List comprehensions.
-- The following is a list taking values from 1..10 that satisfy condition x*2 >= 12 and then doubled.
doublesFrom1to10filtered = [x*2 | x <- [1..10], x*2 >= 12]

-- You can omit the predicate (the last term, after comma).
numsPlus3 = [x + 3 | x <- [1..10]]

-- List comprehensions are useful when a range isn't sufficient because the predicate or operation
-- done on the elements is non-trivial.
oddsBetween50and80 = [x | x <- [50..80], (x `mod` 2) /= 0]

listComprehensionWithConditional =
  [if x < 10 then ("small", x) else ("big", x) | x <- [1..25], odd x]

-- The function "odd" returns whether the integer it's called with is odd.

fizzBuzz :: (Integral e, Show e) => [e] -> IO ()
fizzBuzz xs =
  mapM_ (\x -> putStrLn (
    if x `mod` 3 == 0 && x `mod` 5 == 0 then "FizzBuzz"
      else if x `mod` 3 == 0 then "Fizz"
      else if x `mod` 5 == 0 then "Buzz"
      else (show x))) xs

nonZero n = n /= 0

-- compactCount returns the count of non-zero numbers.
compactCount numbers = sum [1 | n <- numbers, nonZero n]

-- A list comprehension may have multiple predicates, and only elements that satisfy all predicates
-- will be fed to the output function.
listMultiConditions = [x | x <- [1..20], x /= 11, x /= 14, (odd x || x >= 7)]

-- A list comprehension may have multiple source lists, separated by commas. The cartesian product of
-- the lists is used for the predicates and output.
listMultiSources = [(x,y) | x <- [1,2,3], y <- [5,6]]

adjectivesNouns = [adj ++ " " ++ noun | adj <- ["silly", "jovial", "empty"], noun <- ["book", "engineer"]]

elemCount numbers = sum [1 | _ <- numbers]
