module Main where

import Data.List

main :: IO ()
main = do
    [_, m] <- getInts
    a <- getInts

    let conds = reverse $ inits a

    print $ length $ filter id $ map (isOK m) conds

getInts :: IO [Int]
getInts = map read . words <$> getLine :: IO [Int]

isOK :: Int -> [Int] -> Bool
isOK n a = n == l
  where
    l = length $ group $ sort a
