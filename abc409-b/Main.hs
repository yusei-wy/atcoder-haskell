module Main where

import Data.List (find, sortBy)
import Data.Maybe (fromMaybe)

main :: IO ()
main = do
    n <- readLn :: IO Int
    a <- getInts
    let sorted = (sortBy (flip compare) a)
        xs = [1 .. n]
        asn = fromMaybe 0 $ find (\x -> sorted !! (x - 1) >= x) [n, n - 1 .. 1]
    print asn

getInts :: IO [Int]
getInts = map read . words <$> getLine :: IO [Int]
