module Main where

import Control.Monad (forM_)
import Control.Monad.ST (ST, runST)
import Data.Array.ST (STArray, newArray, readArray, writeArray)

main :: IO ()
main = do
    n <- readLn
    print $ fib n

-- 無限リスト
{-
fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

fib :: Int -> Integer
fib n = fibs !! n
-}

-- | ボトムアップでフィボナッチ数を計算
fib :: Int -> Integer
fib n = runST $ do
    -- (0..n) の範囲で Integer を格納する STArray を作成し、初期値 0
    arr <- newArray (0, n) 0 :: ST s (STArray s Int Integer)
    -- 初期条件
    writeArray arr 1 1
    -- 2 から n まで順に計算
    forM_ [2 .. n] $ \i -> do
        a <- readArray arr (i - 1)
        b <- readArray arr (i - 2)
        writeArray arr i (a + b)
    -- 最終値を読み出して返す
    readArray arr n
