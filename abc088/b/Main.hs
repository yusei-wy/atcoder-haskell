module Main where

import Data.List (sortOn)
import Data.Ord (Down (..))

main :: IO ()
main = do
    _ <- getLine
    a <- map read . words <$> getLine :: IO [Int]
    print $ solve a

solve :: [Int] -> Int
solve nums =
    let sortedNums = sortOn Down nums
        (a, b) = foldl (\(a, b) (i, n) -> if even i then (a + n, b) else (a, b + n)) (0, 0) (zip [0 ..] sortedNums)
     in a - b
