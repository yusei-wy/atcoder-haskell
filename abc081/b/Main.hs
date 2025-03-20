module Main where

import Control.Monad (replicateM)

main :: IO ()
main = do
    _ <- getLine
    a <- map read . words <$> getLine :: IO [Int]
    print $ solve a 0

solve :: [Int] -> Int -> Int
solve nums cnt
    | any odd nums = cnt
    | otherwise = solve (map (`div` 2) nums) (cnt + 1)
