{-# LANGUAGE BangPatterns #-}

module Main where

import qualified Data.ByteString.Char8 as BS
import Data.Maybe (fromJust)

data Plan = Plan {time :: Int, x :: Int, y :: Int} deriving (Show, Eq)
data YesNo = Yes | No
instance Show YesNo where
    show Yes = "Yes"
    show No = "No"

main :: IO ()
main = do
    input <- BS.getContents
    let ls = BS.lines input
        n = readInt (head ls)
        plans = map ((\[t, x, y] -> Plan t x y) . map readInt . BS.words) (take n (tail ls))
    print $ solve (Plan 0 0 0) plans

readInt :: BS.ByteString -> Int
readInt = fst . fromJust . BS.readInt

solve :: Plan -> [Plan] -> YesNo
solve _ [] = Yes
solve prev [curr] = if isReachable prev curr then Yes else No
solve prev (curr : xs)
    | isReachable prev curr = solve curr xs
    | otherwise = No

isReachable :: Plan -> Plan -> Bool
isReachable prev curr =
    let !mDistance = abs (x curr - x prev) + abs (y curr - y prev)
        !t = time curr - time prev
     in mDistance <= t && even mDistance == even t
