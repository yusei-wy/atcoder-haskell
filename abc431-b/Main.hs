module Main where

import Control.Monad (replicateM)

updatedAt :: Int -> a -> [a] -> [a]
updatedAt n newVal list =
    take n list ++ [newVal] ++ drop (n + 1) list

main :: IO ()
main = do
    x <- readLn :: IO Int
    n <- readLn :: IO Int
    weights <- map read . words <$> getLine :: IO [Int]
    q <- readLn :: IO Int
    queries <- replicateM q readLn :: IO [Int]

    -- weights[i] が使用済みなら減算、未使用なら加算
    let usedWeights = replicate n False

    let allStates =
            scanl
                ( \(currentX, currentUsed) index ->
                    let idx = index - 1
                        used = currentUsed !! idx
                        op = if used then (-) else (+)
                        newX = currentX `op` (weights !! idx)
                        newUsed = updatedAt idx (not used) currentUsed
                     in (newX, newUsed)
                )
                (x, usedWeights)
                queries

    mapM_ print $ drop 1 $ map fst allStates
