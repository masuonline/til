# Dockerのイメージ削除について

イメージを削除するときは

`docker image rmi IMAGE_NAME`

で削除可能だが、消せないパターンがある。

## image is referenced in multiple repositories

```docker
Error response from daemon: conflict: unable to delete xxxxxxxxxxxx (must be forced) – image is referenced in multiple repositories
```

複数のリポジトリから参照されているイメージだから削除できないよ。消すなら強制削除して。とのメッセージ。  
消したかったら、メッセージ通り強制削除（-fオプション）しましょう。

## mage has dependent child images

```docker
Error response from daemon: conflict: unable to delete xxxxxxxxxxxx (cannot be forced) - image has dependent child images
```

イメージには依存する子イメージがあるから削除できないよ。のメッセージ。
こいつも消すなら強制削除（-fオプション）で消せる。

## 一斉に削除するなら

`docker images -a -q`コマンドですべてのイメージのIDを表示することができる。  
こいつの結果を`docker image rmi -f`の引数に与えることで、イメージの一斉削除が可能である。

``docker rmi  -f `docker images -a -q` ``