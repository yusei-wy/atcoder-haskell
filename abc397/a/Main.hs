module Main where

main :: IO ()
main = do
    x <- readLn :: IO Float
    print $ solve x

solve :: Float -> Int
solve x
    | x >= 38 = 1
    | x < 38 && x >= 37.5 = 2
    | otherwise = 3
