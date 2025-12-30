module Main where

import Data.ByteString.Char8 qualified as BS
import Data.Maybe (fromJust)

readInts :: IO [Int]
readInts = do
  line <- BS.getLine
  return $ map (fst . fromJust . BS.readInt) (BS.words line)

main :: IO ()
main = do
  [a, b, c, d] <- readInts
  if c >= a && d < b
    then
      BS.putStrLn $ BS.pack "Yes"
    else
      BS.putStrLn $ BS.pack "No"
