module Main where

main :: IO ()
main = do
    [n, a, b] <- map read . words <$> getLine :: IO [Int]
    print $ calcSum n a b

calcSum :: Int -> Int -> Int -> Int
calcSum n a b =
    sum $ filter (\x -> let x' = sumOfDigits x in a <= x' && x' <= b) [1 .. n]

sumOfDigits :: Int -> Int
sumOfDigits n
    | n == 0 = 0
    | otherwise = n `mod` 10 + sumOfDigits (n `div` 10)
