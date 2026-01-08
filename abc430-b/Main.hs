module Main where

import Control.Monad
import Data.ByteString.Char8 qualified as BS
import Data.Maybe (fromJust)
import Data.Set qualified as Set

readInts :: IO [Int]
readInts = map (fst . fromJust . BS.readInt) . BS.words <$> BS.getLine

readLine :: IO String
readLine = BS.unpack <$> BS.getLine

extractSubgrid :: [[Char]] -> Int -> Int -> Int -> [[Char]]
extractSubgrid grid r c m = map (take m . drop c) (take m $ drop r grid)

main :: IO ()
main = do
  [n, m] <- readInts
  ss <- replicateM n readLine
  let mySet = Set.fromList [extractSubgrid ss r c m | r <- [0 .. n - m], c <- [0 .. n - m]]
  print $ Set.size mySet
