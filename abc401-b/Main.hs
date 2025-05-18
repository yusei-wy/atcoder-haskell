jmodule Main where

import Control.Monad (replicateM)
import Debug.Trace (traceShow)

main :: IO ()
main = do
    n <- readLn
    s <- replicateM n getLine
    print $ solve s LoggedOut 0

solve :: [String] -> LoginState -> Int -> Int
solve [] _ err = err
solve (x : xs) state err =
    let newState = transition state x
        newErr = updateErrCount newState x err
     in solve xs newState newErr

data LoginState = LoggedIn | LoggedOut deriving (Eq, Show)

transition :: LoginState -> String -> LoginState
transition _ "login" = LoggedIn
transition _ "logout" = LoggedOut
transition s _ = s

updateErrCount :: LoginState -> String -> Int -> Int
updateErrCount LoggedOut "private" err = err + 1
updateErrCount _ _ err = err
