module Main where

import Control.Monad (replicateM)
import Data.Set qualified as Set

main :: IO ()
main = do
    n <- readLn :: IO Int
    d <- replicateM n readLn :: IO [Int]
    print $ solve d

solve :: [Int] -> Int
solve xs =
    length $ Set.toList $ Set.fromList $ xs
