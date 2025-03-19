module Main where

main :: IO ()
main = do
  [a, b] <- map read . words <$> getLine :: IO [Int]
  putStr $ solve a b

solve :: Int -> Int -> String
solve a b
  | even $ a * b = "Even"
  | otherwise = "Odd"
