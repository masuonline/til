# findコマンド

## findコマンドで指定条件のファイルを＜除外＞したい時

除外は`-not -name pattern`オプションをつけると良い

```bash
find -type f -not -name '*jpg'
```

## 参考

<https://takuya-1st.hatenablog.jp/entry/2016/08/06/032454>
