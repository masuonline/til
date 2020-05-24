# 中央値の取り方

標準ライブラリstatisticsのmedianメソッドを利用する。

`statistics.median()`

使用例

```python
import statistics

l = [10, 1, 3, 7, 1]

median = statistics.median(l)
print(median)

# 3
```

## データの個数が偶数の場合

データの個数が偶数の場合、`statistics.median()`では中央2個の値の算術平均が返される。

```python
import statistics
l_even = [10, 1, 3, 7, 1, 6]

median = statistics.median(l_even)
print(median)

# 4.5
```

2値それぞれを指定するには、
`statistics.median_low()`か`statistics.median_high()`を利用する。  
奇数個のデータの場合に`statistics.median_low()`か`statistics.median_high()`を使用した場合、`statistics.median()`と同じ値を返す。

```python
import statistics
l_even = [10, 1, 3, 7, 1, 6]

median = statistics.median_low(l_even)
print(median)

# 3

median = statistics.median_high(l_even)
print(median)

# 9
```

## 参考

<https://note.nkmk.me/python-statistics-mean-median-mode-var-stdev>
<https://docs.python.org/ja/3/library/statistics.html#module-statistics>
