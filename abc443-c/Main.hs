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
        | openAt >= t = (acc, openAt)
        | openAt > x = (acc, openAt)
        | otherwise = (acc + (x - openAt), openAt + 100)
      (ans, _) = foldl' step (0, 0) a

    print $ ans
