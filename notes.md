# GHCi

Modules from `base` are always available to import.
Do `:show imports` to see what has been imported.

To see which packages may be imported into GHCi, run `ghc-pkg list`. Any modules from the list of packages may be
imported directly.

Multiline blocks:
```
:{
let x = 5 in
  if x > 0
    then putStrLn "greater"
    else putStrLn "less than or equal"
:}
```

Enable multiline syntax in GHCi by doing `:set +m` so that a multiline block is parsed when a line ends
in a block-opening keyword like `of`, `do`, or `in`.

Enable the type application extension by doing `:set -XTypeApplications`.

# Functions

## `compare`
`compare :: Ord a => a -> a -> Ordering`

## `length`
`length :: Foldable t => t a -> Int`

## `minBound`
The lowest value of a `Bounded` type.

## `maxBound`
The greatest value of a `Bounded` type.

## `scanl`
`scanl :: (b -> a -> b) -> b -> [a] -> [b]`
Cumulative operation, similar to `foldl` but returns a list of length one greater than the length of the input
list where the values are successively reduced left to right.

Example:
```
cumulativeSum = scanl (+) 0 [1, 1, 1]
-- Result is [0, 1, 2, 3]
```

# Types and Classes

## `Ordering`
`data Ordering = LT | EQ | GT`

## `Enum`
The `Enum` class "defines operations on sequentially ordered types."

Range syntax (e.g., `[1..5]`) is available only for data types that have `Enum` instances.