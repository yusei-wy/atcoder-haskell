module Main where

import Data.List (find)
import Data.Maybe (fromMaybe)

data ThreeInts = ThreeInts Int Int Int
instance Show ThreeInts where
    show (ThreeInts a b c) = unwords [show a, show b, show c]

main :: IO ()
main = do
    [n, y] <- map read . words <$> getLine :: IO [Int]
    print $ solve n y

solve :: Int -> Int -> ThreeInts
solve n y = fromMaybe (ThreeInts (-1) (-1) (-1)) $ find isValid candidates
  where
    candidates = [ThreeInts a b (n - a - b) | a <- [0 .. n], b <- [0 .. n - a]]
    isValid (ThreeInts a b c) = 10000 * a + 5000 * b + 1000 * c == y
