module Main where

main :: IO ()
main = do
    [h, b] <- map read . words <$> getLine :: IO [Int]
    putStrLn $ show $ max (h - b) 0
