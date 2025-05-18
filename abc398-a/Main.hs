module Main where

main :: IO ()
main = do
    n <- readLn :: IO Int
    putStrLn $ solve n

solve :: Int -> String
solve 1 = "="
solve 2 = "=="
solve n =
    let x = if even n then 2 else 1
        equal = replicate x '='
        halfDash = replicate ((n - x) `div` 2) '-'
     in halfDash ++ equal ++ halfDash
