module Main where

import Data.Foldable (for_)
import Data.List ((\\))

main :: IO ()
main = do
    s <- getLine
    let chars = ['a' .. 'z']
    putStrLn [head $ chars \\ s]
