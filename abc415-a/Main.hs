module Main where

import Data.ByteString.Lazy.Char8 (readInteger)
import Data.List (elem)

main :: IO ()
main = do
    _ <- getLine
    a <- getInts
    x <- readLn :: IO Int
    print $ solve a x

getInts :: IO [Int]
getInts = map read . words <$> getLine :: IO [Int]

data YesNo = Yes | No
instance Show YesNo where
    show Yes = "Yes"
    show No = "No"

solve :: [Int] -> Int -> YesNo
solve a x = if x `elem` a then Yes else No
