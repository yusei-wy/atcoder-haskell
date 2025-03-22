module Main where

main :: IO ()
main = do
    a <- readLn :: IO Int
    b <- readLn :: IO Int
    c <- readLn :: IO Int
    x <- readLn :: IO Int
    print $ length [() | i <- [0 .. a], j <- [0 .. b], k <- [0 .. c], i * 500 + j * 100 + k * 50 == x]
