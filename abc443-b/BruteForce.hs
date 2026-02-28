{-# LANGUAGE BangPatterns #-}

module Main where

import Data.ByteString.Char8 qualified as BS
import Data.Maybe (fromJust)

readInts :: IO [Int]
readInts = map (fst . fromJust . BS.readInt) . BS.words <$> BS.getLine

solve :: Int -> Int -> Int
solve n k = go 0 n 0
 where
  go !idx !age !acc
    | acc' >= k = idx
    | otherwise =
        go (idx + 1) (age + 1) acc'
   where
    acc' = acc + age

main :: IO ()
main = do
  [n, k] <- readInts

  print $ solve n k
