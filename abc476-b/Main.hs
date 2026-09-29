module Main where

import qualified Data.ByteString.Char8 as BS

main :: IO ()
main = do
    input <- BS.getContents
    let [_, s, t] = BS.unpack <$> BS.lines input
    BS.putStrLn $ BS.pack $ same s t

same :: String -> String -> String
same [] [] = "Yes"
same (x : xs) (y : ys)
    | x == y = same xs ys
    | y == '*' = same xs ys
    | otherwise = "No"
same _ _ = "No"
