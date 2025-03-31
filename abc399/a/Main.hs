module Main where

import Control.Monad

main :: IO ()
main = do
    n <- readLn :: IO Int
    s <- getLine
    t <- getLine
    print $ solve s t

solve :: String -> String -> Int
solve s t = length $ [x | (x, y) <- zip s t, x /= y]
