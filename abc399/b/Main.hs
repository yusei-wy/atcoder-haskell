module Main where

main :: IO ()
main = do
    n <- readLn
    scores <- map read . words <$> getLine
    mapM_ print $ solve n scores

{-
4
3 12 9 9

3 > 3 = false
12 > 3 = true
9 > 3 = true
9 > 3 = true
= 4

3 > 12 = false
12 > 12 = false
9 > 12 = false
9 > 12 = false
= 1

3 > 9 = false
12 > 9 = true
9 > 9 = false
9 > 9 = false
= 2

3 > 9 = false
12 > 9 = true
9 > 9 = false
9 > 9 = false
= 2

= 4 1 2 2
-}
solve :: Int -> [Int] -> [Int]
solve n p = [rank i | i <- [0 .. n - 1]] -- 0, 1, 2, 3
  where
    rank i = 1 + length [j | j <- [0 .. n - 1], p !! j > p !! i]
