module Main where

import Data.List

main :: IO ()
main = do
    [_, m] <- map read . words <$> getLine :: IO [Int]
    a <- map read . words <$> getLine :: IO [Int]

    -- a の全ての接頭辞（初期部分リスト）のリストを生成し、逆順にする
    -- [n, m] = 5 3
    -- a = 3 2 3 1 2
    -- conds = [[3,2,3,1,2],[3,2,3,1],[3,2,3],[3,2],[3],[]]
    let conds = reverse $ inits a

    -- conds の各要素（各初期状態の候補）に対して isOK m を適用
    -- isOK m が True を返すものだけを抽出し、その数を表示
    print $ length $ filter id $ map (isOK m) conds

{-
Q. isOK の引数は2個だが `map (isOK m)` をみると1つしか渡されていない気がする
A. カリー化されて f = (isOK 3) のように優先的に処理され、f conds で各要素にたいして f が適用される

Q. なぜ unique ではなく group が使われている？
A. ユニーク化関数の `nub` は単純なリスト操作で実装されているので計算量が $O(N2)$ となるため
- sort の計算量は一般的に $O(N log N)
- group には sort によって同じ値が連続して渡されるため非常に効率的に $O(N)$ で動作する
group
-}
isOK :: Int -> [Int] -> Bool
isOK n as = n == l
  where
    -- as を sort し group で連続する同じ要素をグループ化し、そのグループの数を数える
    l = length $ group $ sort as
