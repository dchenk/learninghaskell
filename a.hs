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
