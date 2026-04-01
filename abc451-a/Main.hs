module Main where

main :: IO ()
main = do
    s <- getLine
    putStr $ if (length s `mod` 5) == 0 then "Yes" else "No"
