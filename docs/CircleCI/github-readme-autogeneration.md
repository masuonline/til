# GitHubのreadme自動生成

## ※後で設定手順を書く

## 躓いたところ1

- 事象：環境設定で処理がコケる。（Spin Up Environment）
- 原因：dockerのイメージ指定が不適切であった。  
参考にしたyamlファイルのimageの指定が`circleci/<使うやつ>`となっていた。
- 対処：dockerイメージを正しく指定。

config.yml

```yml
version: 2
jobs:
  build:
    docker:
#     変更前：docker imageを正しく指定できていない
#     - image: circleci/<使うやつ>
#     変更後：node:4.8.2を指定
      - image: circleci/node:4.8.2
    steps:
      - checkout
      - run: bash generate-readme.sh
      - run: git config user.name "CircleCI"
      - run: git config user.email "circleci@gh.com"
      - run: git add README.md
      - run: git commit -m 'Update README.md [ci skip]'
      - run: git push origin master
workflows:
  version: 2
  build_and_test:
    jobs:
      - build
```

## 躓いたところ2

- 事象：シェルスクリプトが実行できない。（bash generate-readme.sh）
- 原因：yamlファイルで指定しているファイル名と、シェルスクリプトのファイル名が一致していなかったため。
- 対処：シェルスクリプトのファイル名を修正

## 躓いたところ3

- 事象：GitHubにプッシュできない。（git push origin master）
- 原因：デフォルトで作成されるsshは読み込み専用
- 対処：書き込み可能な鍵を設定する

## 躓いたところ4

- 事象：CircleCI側のSSH鍵登録時に、`Add SSH Key`ボタンを押すと下記のメッセージが出る。  
`It looks like this private key is invalid. Please check if you have pasted the right key. If you are sure your key is valid, please contact support for assistance.`  
- 原因：PEMを指定して鍵が作成できていなかったから（？）
鍵作成の実行コマンド
`ssh-keygen -t rsa -b 4096 -m pem -C "CircleCI" -f id_rsa_circleci -N ""`
- 対処：
下記コマンドで鍵を再生成。問題なく登録完了。  
`ssh-keygen -m PEM -t rsa -C "CircleCI"`  
- 実行環境：
  - OS：macOS Catalina 10.15.4（19E287）
  - /usr/bin/ssh-keygen

## 参考にしたサイト

<https://codezine.jp/article/detail/11208>
<https://qiita.com/boushi-bird@github/items/6b6eb1d1ed6f6d3341e4>
<http://pandorina463.hatenablog.com/entry/2019/02/26/131436>
