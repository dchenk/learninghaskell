-- "let" bindings can be used to declare values scoped to a function, and if within a guard then
-- it's scoped to the function within the guard.
-- The syntax is to put "let <bindings> in <expression>" after the "=" in the function definition.
myFn x =
  let v  = x * 2 - x
      v2 = v + 1
  in v + v2

myFn2 x
  | x < 10 =
    let y = 6
    in x + y
  | otherwise =
    let y = 7
    in x + y

-- Unlike declarations under a "where" construct, "let" bindings are expressions. So you can declare
-- a "let" binding inline of an expression.
someValue = (let x = 2 in x * x + 1)

someOtherValue = let y = 'Y' in [y, 'Z', y, y]

-- Multiple "let" bindings in an expression (separated by a semicolons):
someOtherValue2 = let y = 'Y'; z = 'Z' in [y, 'Z', y, y, z]

moreLet = 4.1 + (let a = 6.7; b = 1.2 in a ^ 4 - a + b + 1) * 2

-- Or broken out by newlines:
moreLet2 = 4.1 + (let
  a = 6.7
  b = 1.2 in a ^ 4 - a + b + 1) * 2

-- You can use "let" with pattern matching:
letMatching x y z =
  let (v1, v2) = (x, y)
      f:_ = z  -- Here z must be a list.
      tot = v1 + v2 + f
  in tot + 1

-- Inside a list comprehension, you can declare functions using "let" without the "in" part.
squares = [(x, squared x) | x <- [1..10], let squared n = n * n]

-- The filters in the list comprehension go after the "let" bindings.
squaresFiltered = [(x, squared x) | x <- [1..10], let squared n = n * n, x /= 8]

-- The bindings from the "let" in a list comprehension can be used in the output function (that is,
-- before the "|") as well as in the filters.
squaresFiltered2 = [(x, squared x) | x <- [1..10], let squared n = n * n, x /= 8, squared x /= 9]

-- Case expressions allow a branch to be evaluated based on a match.
-- The matching is done top-downward, left-to-right.

-- This function should be called only with either 5 or 8 because otherwise a runtime error occurs.
mult x = case x of 5 -> 5*2
                   8 -> 9

otherNum x =
  case x of
  5 -> 8
  6 -> 11
  5 -> 3 -- This won't be reached (though it compiles).

caseWithPattern x = case x of
  [only] -> "There is only " ++ show only
  [1, b] -> "There is 1 and " ++ show b
  [a, b] -> "The two values are " ++ show a ++ " and " ++ show b
  a:_:_  -> "There are more than two values, and the first one is " ++ show a

caseWithTuplePattern x = case x of
  (1, secondVal) -> "We have one and " ++ show secondVal
  (firstVal, secondVal) -> "Two random values: " ++ show firstVal ++ ", " ++ show secondVal

caseWithinExpr x =
  "My list is " ++ case x of
    []     -> "empty"
    [v]    -> "just the one element " ++ show v
    [v, w] -> "the two elements " ++ show v ++ " and " ++ show w
    x      -> "this stuff: " ++ show x
