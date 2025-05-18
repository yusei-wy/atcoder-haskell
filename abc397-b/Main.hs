module Main where

main :: IO ()
main = do
    s <- getLine
    let (ans, target) = foldl processChar (0, 'i') s
        ans' = if target == 'o' then ans + 1 else ans
    print ans'

processChar :: (Int, Char) -> Char -> (Int, Char)
processChar (ans, target) c
    | c == target = (ans, nextTarget target)
    | otherwise = (ans + 1, target)

nextTarget :: Char -> Char
nextTarget 'i' = 'o'
nextTarget _ = 'i'
