import qualified Data.ByteString.Char8 as BS
import Data.List (foldl')
import Data.Maybe (fromJust)

readInts :: IO [Int]
readInts = map (fst . fromJust . BS.readInt) . BS.words <$> BS.getLine

main :: IO ()
main = do
    [_, t] <- readInts
    a <- readInts

    let step (acc, openAt) x
            | openAt >= closeAt = (acc, openAt)
            | otherwise = (acc + (closeAt - openAt), x + 100)
          where
            -- 閉じる時間は a[i] or x+100
            closeAt = min x t
        -- T 確実に閉じる時間なので末尾に追加することで openAt > last x のケースでも正しく時間を計算できる
        (ans, _) = foldl' step (0, 0) (a ++ [t])

    print ans
