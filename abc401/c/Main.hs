module Main where

import Control.Monad (forM_)
import Control.Monad.ST (ST, runST)
import Data.Array.ST (STArray, newArray, readArray, writeArray)
import Data.STRef (modifySTRef', newSTRef, readSTRef)

modulo :: Integer
modulo = 10 ^ 9

main :: IO ()
main = do
    [n, k] <- getInts
    print $ kBonacci n k

getInts :: IO [Int]
getInts = map read . words <$> getLine :: IO [Int]

kBonacci :: Int -> Int -> Integer
kBonacci n k = runST $ do
    -- 配列の初期化
    arr <- newArray (0, n) 1 :: ST s (STArray s Int Integer)

    -- 初期の累積和を計算
    accRef <- newSTRef (fromIntegral k)

    -- スライディングウィンドウの計算
    forM_ [k .. n] $ \i -> do
        acc <- readSTRef accRef
        writeArray arr i acc
        a <- readArray arr (i - k)
        b <- readArray arr i
        let newAcc = (acc - a + b) `mod` modulo
        modifySTRef' accRef (const newAcc)
    -- 最終値を読み出して返す
    readArray arr n
