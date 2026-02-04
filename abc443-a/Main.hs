module Main where

main :: IO ()
main = do
  s <- getLine
  putStrLn $ (s ++ ['s'])
