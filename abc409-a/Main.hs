module Main where

data YesNo = Yes | No
instance Show YesNo where
    show Yes = "Yes"
    show No = "No"

main :: IO ()
main = do
    _ <- getLine
    t <- getLine
    a <- getLine
    print $ solve t a

solve :: [Char] -> [Char] -> YesNo
solve [] [] = No
solve _ [] = No
solve [] _ = No
solve (x : xs) (y : ys)
    | x == 'o' && y == 'o' = Yes
    | otherwise = solve xs ys
