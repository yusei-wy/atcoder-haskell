
# abc476-a

<!-- 問題 URL -->
https://atcoder.jp/contests/abc476/tasks/abc476_a

## 解く前

### 一言で
<!-- 何を求める問題か。問題文の言い換えではなく、自分の言葉で -->

末尾に文字列を加えるプログラム

### 分割
<!-- コードを書く前に、出力側から逆算して型の列で。形: 入力 → [Int] → ??? → Int → 出力 -->

Input String
Output String

#### 状態
- 変化無し

#### 不変条件
- S は英小文字の文字列
- length S は 1 <= 10

#### 場合分け
last S == 'e' : S + 'r'
otherwise  : S + 'er'

## 解いた後

### 分割はどう変わったか
<!-- 解く前の分割とのずれ。なぜずれたか -->

### 最初の誤り
<!-- WA / 見落とし。どの部品の「境界」で漏れたか -->

- `print` は `putStrLen . show` が実行される
- つまりシンボルが文字列としてそのまま出るので `"ans"` になってしまう
- 純粋に出力する場合は `putStrLen` を使う

### 一言で（再）
<!-- 解く前と比べて、何を捨て、何を残したか -->

## パターン
<!-- [[名前]] で書く -->

## メモ

型レベルで英小文字を表現する方法

1. 値を列挙した型を作る
```haskell
data Lower = A | B | C | D | E | F | G | H | I | J | K | L | M
           | N | O | P | Q | R | S | T | U | V | W | X | Y | Z
    deriving (Show, Eq, Ord, Enum, Bounded)
```

2. newtype とスマートコンストラクタ
```haskell
newtype Lower = Lower Char
mkLower :: Char -> Maybe Lower
mkLower c
    | isAsciiLower c = Just (Lower c)
    | otherwise      = Nothing
```
