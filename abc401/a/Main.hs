module Main where

main :: IO ()
main = do
    s <- readLn :: IO Int
    if 200 <= s && s <= 299
        then putStrLn "Success"
        else putStrLn "Failure"
