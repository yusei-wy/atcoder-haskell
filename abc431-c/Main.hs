module Main where

import Data.List (sort)
import Data.List qualified (sortBy)

main :: IO ()
main = do
  [n, m, k] <- map read . words <$> getLine :: IO [Int]
  heads <- sort . map read . words <$> getLine :: IO [Int]
  bodies <- sort . map read . words <$> getLine :: IO [Int]

  if match heads bodies >= k
    then
      putStr "Yes"
    else
      putStr "No"

-- sort 済みの2つの配列の要素を1つずつ比較し
-- b が a 以上なら +1 をカウントして、最終的な結果を返す
match :: [Int] -> [Int] -> Int
match [] _ = 0
match _ [] = 0
match (h : hs) (b : bs)
  -- 一致するなら両方消費できる
  | h <= b = 1 + match hs bs
  -- 一致しないなら R だけつまり bodies だけを進めることで
  -- O(N) の計算量で無駄なく比較できる
  | otherwise = match (h : hs) bs
