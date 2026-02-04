{-# LANGUAGE BangPatterns #-}

module Main where

import Data.ByteString.Char8 qualified as BS
import Data.Maybe (fromJust)
import Data.Vector qualified as V

readInts :: IO [Int]
readInts = map (fst . fromJust . BS.readInt) . BS.words <$> BS.getLine

readLine :: IO String
readLine = BS.unpack <$> BS.getLine

-- rA と rB の2つの独立した尺取りで O(N) を実現
solve :: V.Vector Char -> Int -> Int -> Int
solve v a b = go 0 0 0 0 0 0
 where
  !n = V.length v

  -- rA   : a を A 個集めた区間の exclusive end
  -- rB   : b を B 個集めた区間の exclusive end
  -- cntA : [l, rA-1] に含まれる a の個数
  -- cntB : [l, rB-1] に含まれる b の個数
  -- ans  : 累積の答え
  go !l !rA !rB !cntA !cntB !ans
    | l >= n = ans
    | otherwise =
        let (!rA', !cntA') = advA rA cntA
            (!rB', !cntB') = advB rB cntB
            -- b が B 個に達しない場合は末尾まで全て有効なので n+1
            !upper = if cntB' >= b then rB' else n + 1
            !cnt = if cntA' >= a then max 0 (upper - rA') else 0
            !cl = v V.! l
            !cntA'' = if cl == 'a' then cntA' - 1 else cntA'
            !cntB'' = if cl == 'b' then cntB' - 1 else cntB'
         in go (l + 1) rA' rB' cntA'' cntB'' (ans + cnt)

  -- rA を進めて a を A 個集める
  advA !r !cnt
    | r >= n || cnt >= a = (r, cnt)
    | otherwise =
        let !c = v V.! r
            !cnt' = if c == 'a' then cnt + 1 else cnt
         in advA (r + 1) cnt'

  -- rB を進めて b を B 個集める
  advB !r !cnt
    | r >= n || cnt >= b = (r, cnt)
    | otherwise =
        let !c = v V.! r
            !cnt' = if c == 'b' then cnt + 1 else cnt
         in advB (r + 1) cnt'

main :: IO ()
main = do
  [_, a, b] <- readInts
  ss <- readLine
  print $ solve (V.fromList ss) a b
