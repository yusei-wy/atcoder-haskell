module Main where

main :: IO ()
main = do
    _ <- readLn :: IO Int
    s <- getLine
    t <- getLine
    print $ solve s t

solve :: String -> String -> Int
solve s t = length $ [x | (x, y) <- zip s t, x /= y]
