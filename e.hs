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
