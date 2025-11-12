# 企画書班用のリポジトリ

GitHub上で企画書を作成しろと言われましたので、GitHub上で管理するための環境です。

班長(眞鍋)自体もGitHub全然使ったことないので、このREADMEを見て頑張ってください。
作業方法の箇所は、絶対に見てください。

## 必要なツール

以下のツールがローカルPCにインストールされている必要があります。

1.  **Git**
2.  **WSL (Windows Subsystem for Linux)**
      * Windows ユーザーのみ。Mac/Linux ユーザーは不要です。
3.  **VSCode (Visual Studio Code)**
      * [公式ダウンロードサイト](https://code.visualstudio.com/)
      * 拡張機能「**Remote - WSL**」をインストールしてください。

## 構築手順 (初回のみ)

1.  **プロジェクトのクローン**
    WSLのターミナルを開き、任意の作業ディレクトリで以下のコマンドを実行します。

    ```bash
    git clone https://github.com/270375e/Welcome_Party.git
    cd Welcome_Party
    ```

2.  **VSCodeで開く(WSLで実行)**
    Welcome_Partyのフォルダ内で以下のコマンドを実行すると、VSCode(Remote-WSLモード)が起動します。

    ```bash
    code .
    ```


これで環境構築は完了です。


## 作業方法

みなさんにお配りしたtexファイルを編集してもらった後にそれを追加？あげる手順です。

**1. 最新化**
ます、ローカルの `develop` ブランチを最新の状態にします。

```bash
# developブランチに切り替え
git checkout develop

# リモート (GitHub) の最新情報を取得
git pull origin develop
```

**2. 作業ブランチの作成**
`develop` ブランチから、 `feature/〇〇` のブランチを切ります。

```bash
# 'feature/update-01_morning' という名前でブランチを作成し、そこに移動するときの例
git checkout -b feature/update-01_morning
```

**3. 作業**
作業し終わったら、コミットします。

```bash
# 変更したファイルをステージング
git add .
# もしくは01_morningという名前のtexファイルだけをaddしたい場合
git add 01_morning.tex

# 変更内容をコミット
git commit -m "feat: 朝の動きを変更"
```

**4. リモートにPush**
作業ブランチをリモート (GitHub) にPushします。

```bash
git push origin feature/update-01_morning
```

**5. プルリクエスト (Pull Request) の作成**

  * GitHubのサイトを開き、 `feature/update-01_morning` ブランチから `develop` ブランチに向けて**プルリクエストを作成**します。
  * チームメンバーにレビューを依頼します。今回のチームメンバーは眞鍋にしてください。

**6. マージ**

  * レビューが完了し、承認(Approve)されたら、プルリクエストをマージします。
  * これで、編集した文章が `develop` ブランチに反映されます。

-----

ここからはブランチの説明です。

## ブランチ戦略 (Git Flow)

このプロジェクトでは、Gitのブランチを以下のように管理していきます。
作業を開始する前、またはPushする前に必ず確認してください。

```bash
# 現在のブランチの確認方法
git branch
```

### 基本ブランチ

  * **`main`** (または`master`)
    
      * 常に**本番リリース可能**な状態を保つブランチです。(ver1.0やver2.0の切り替わり用)
      * このブランチに直接コミット(Push)することは**厳禁**です。
      * `develop` ブランチからのみマージされます。

  * **`develop`**

      * 作業の中心となるブランチです。
      * チームメンバーが変更・追加したものは、すべてこのブランチにマージされます。

### 作業ブランチ(命名規則)

作業ブランチは、**必ず** `develop` ブランチから切ってください。
作業か完了したら、 `develop` ブランチに対して **プルリクエスト(Pull Request)** を作成します。

  **追加・変更時: `feature/`**
  * 新しい文章を追加したり、編集したりする場合に使います。 
  * **例:** `feature/update-01_morning` (朝の動きの箇所を変更)