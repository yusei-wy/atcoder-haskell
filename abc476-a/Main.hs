module Main where

main :: IO ()
main = do
    s <- getLine
    if last s == 'e'
        then putStrLn $ s ++ "r"
        else putStrLn $ s ++ "er"
