module Main where

main :: IO ()
main = do
    [r, x] <- map read . words <$> getLine
    print $ solve x r

data YesNo = Yes | No
instance Show YesNo where
    show Yes = "Yes"
    show No = "No"

solve :: Int -> Int -> YesNo
solve x r
    | x == 1 && 1600 <= r && r <= 2999 = Yes
    | x == 2 && 1200 <= r && r <= 2399 = Yes
    | otherwise = No
