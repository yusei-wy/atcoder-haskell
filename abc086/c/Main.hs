module Main where

import Control.Monad (replicateM)
import Data.ByteString.Char8 qualified as BS

data YesNo = Yes | No
instance Show YesNo where
    show Yes = "Yes"
    show No = "No"

data Plan = Plan {time :: Int, x :: Int, y :: Int} deriving (Show, Eq)

main :: IO ()
main = do
    n <- readLn
    plans <- replicateM n $ do
        [t, x, y] <- map read . words <$> getLine
        return $ Plan t x y
    print $ solve (Plan 0 0 0) plans

solve :: Plan -> [Plan] -> YesNo
solve _ [] = Yes
solve prev [curr] = if isReachable prev curr then Yes else No
solve prev (curr : xs)
    | isReachable prev curr = solve curr xs
    | otherwise = No

isReachable :: Plan -> Plan -> Bool
isReachable prev curr =
    let mDistance = abs (x curr - x prev) + abs (y curr - y prev)
        t = time curr - time prev
     in mDistance <= t && even mDistance == even t
