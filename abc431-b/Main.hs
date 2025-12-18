module Main where

import Control.Monad (replicateM)
import Data.Set (Set)
import Data.Set qualified as Set

toggleSet :: (Ord a) => a -> Set a -> Set a
toggleSet x set
    | Set.member x set = Set.delete x set
    | otherwise = Set.insert x set

main :: IO ()
main = do
    x <- readLn :: IO Int
    _ <- readLn :: IO Int
    weights <- map read . words <$> getLine :: IO [Int]
    q <- readLn :: IO Int
    queries <- replicateM q readLn :: IO [Int]

    let allStates =
            scanl
                ( \(cur, acc) index ->
                    let used = Set.member index acc
                        op = if used then (-) else (+)
                        newCur = cur `op` (weights !! (index - 1))
                        newAcc = toggleSet index acc
                     in (newCur, newAcc)
                )
                (x, Set.empty)
                queries

    mapM_ print $ drop 1 $ map fst allStates
