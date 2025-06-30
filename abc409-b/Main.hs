module Main where

main :: IO ()
main = do
    n <- readLn :: IO Int
    a <- getInts
    print $ solve n a

getInts :: IO [Int]
getInts = map read . words <$> getLine :: IO [Int]

{-
x 以上の値が list a に x 回以上現れる時、最大の x を返す

案1.
1. list 内包表記で一致するものを filter
2. max を取得
3. output
-}
solve :: Int -> [Int] -> Int
solve n xs =
    maximum [x | x <- [0 .. n], length [y | y <- xs, y >= x] >= x]
