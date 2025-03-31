module Main where

main :: IO ()
main = do
    n <- readLn
    scores <- map read . words <$> getLine
    mapM_ print $ solve n scores

solve :: Int -> [Int] -> [Int]
solve n p = [rank i | i <- [0 .. n - 1]] -- 0, 1, 2, 3
  where
    rank i = 1 + length [j | j <- [0 .. n - 1], p !! j > p !! i]
