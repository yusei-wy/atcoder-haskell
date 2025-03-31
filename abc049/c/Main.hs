module Main where

import Data.List (isPrefixOf)

main :: IO ()
main = do
    s <- getLine
    let reversedS = reverse s
        reversedWords = map reverse ["dream", "dreamer", "erase", "eraser"]
    if canConstruct reversedS reversedWords
        then putStrLn "YES"
        else putStrLn "NO"

canConstruct :: String -> [String] -> Bool
canConstruct "" _ = True
canConstruct s words = any (\word -> word `isPrefixOf` s && canConstruct (drop (length word) s) words) words
