# VS Codeの拡張機能一覧取得

VS Codeの同期機能を使えない環境に向けて、  
導入した拡張機能の一覧取得方法とインストールのコマンド生成方法  
VS Codeのcodeコマンドを利用して一覧を取得する。

## 前提条件

codeコマンドが利用可能となっていること  
VS CodeからPATHを通すオペレーションを実行すれば良い

### 参考リンク

<https://code.visualstudio.com/docs/editor/command-line>

## 実行方法

<Unix系の場合>

```bash
code --list-extensions | xargs -L 1 echo code --install-extension
```

<Windowsの場合>

```powershell
code --list-extensions | % { "code --install-extension $_" }
```

実行結果例

```bash
% code --list-extensions | xargs -L 1 echo code --install-extension
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension donjayamanne.githistory
code --install-extension dracula-theme.theme-dracula
code --install-extension eamodio.gitlens
code --install-extension foxundermoon.shell-format
code --install-extension GitHub.github-vscode-theme
code --install-extension GitHub.vscode-pull-request-github
code --install-extension GrapeCity.gc-excelviewer
code --install-extension ICS.japanese-proofreading
code --install-extension mechatroner.rainbow-csv
code --install-extension ms-azuretools.vscode-azureterraform
code --install-extension ms-azuretools.vscode-docker
code --install-extension MS-CEINTL.vscode-language-pack-ja
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension ms-python.python
code --install-extension ms-vscode.azure-account
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.Go
code --install-extension oderwat.indent-rainbow
code --install-extension patricklee.vsnotes
code --install-extension PKief.material-icon-theme
code --install-extension redhat.vscode-yaml
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension yzane.markdown-pdf
code --install-extension yzhang.markdown-all-in-one
```

## 参考

<https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list>
