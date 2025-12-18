module Main where

import Control.Monad (replicateM)
import Data.Set (Set, member)
import Data.Set qualified as Set

toggleSet :: (Ord a) => a -> Set a -> Set a
toggleSet x set
    | Set.member x set = Set.delete x set
    | otherwise = Set.insert x set

main :: IO ()
main = do
    x <- readLn :: IO Int
    n <- readLn :: IO Int
    weights <- map read . words <$> getLine :: IO [Int]
    q <- readLn :: IO Int
    queries <- replicateM q readLn :: IO [Int]

    let allStates =
            scanl
                ( \(cur, acc) index ->
                    let idx = index - 1
                        used = Set.member index acc
                        op = if used then (-) else (+)
                        newCur = cur `op` (weights !! idx)
                        newAcc = toggleSet index acc
                     in (newCur, newAcc)
                )
                (x, Set.empty)
                queries

    mapM_ print $ drop 1 $ map fst allStates
