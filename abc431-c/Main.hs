{-# LANGUAGE BangPatterns #-}

module Main where

import Data.ByteString.Char8 qualified as BS
import Data.List (sort)
import Data.List qualified (sortBy)
import Data.Maybe (fromJust)

readInts :: IO [Int]
readInts = do
  line <- BS.getLine
  return $ map (fst . fromJust . BS.readInt) (BS.words line)

main :: IO ()
main = do
  [n, m, k] <- readInts
  heads <- readInts
  bodies <- readInts

  if match (sort heads) (sort bodies) >= k
    then
      BS.putStrLn $ BS.pack "Yes"
    else
      BS.putStrLn $ BS.pack "No"

-- sort 済みの2つの配列の要素を1つずつ比較し
-- b が a 以上なら +1 をカウントして、最終的な結果を返す
match :: [Int] -> [Int] -> Int
match hs bs = go 0 hs bs
 where
  go !cnt [] _ = cnt
  go !cnt _ [] = cnt
  go !cnt (h : hs) (b : bs)
    -- 一致するなら両方消費できる
    | h <= b = go (cnt + 1) hs bs
    -- 一致しないなら R だけつまり bodies だけを進めることで
    -- O(N) の計算量で無駄なく比較できる
    | otherwise = go cnt (h : hs) bs
