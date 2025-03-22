main :: IO ()
main = do
    print $ pure (*2) <*> Just 5
    print $ pure (*2) <*> [1, 2, 3]
