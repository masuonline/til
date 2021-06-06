# AWS利用開始時に最低限やっておきたいこと

## セキュリティ

 1. AWSルートアカウントは極力使用しない
 2. ユーザには最小限の権限を付与する
 3. 認証情報を埋め込まない
 4. 証跡の取得
 5. 各レイヤーでのセキュリティ対策

### 1. AWSルートアカウントは極力使用しない

- 強度の強いパスワードを設定する
- MFAを設定する
- ルートアカウントではなくIAMを利用する

### 2. ユーザには最小限の権限を付与する

- IAMユーザとIAMグループを利用する
- 最小限のアクセス権限から開始し、必要に応じて追加のアクセス権限を付与する

### 3. 認証情報を埋め込まない

- EC2にはIAMロールを利用
  - 認証情報をOSやアプリケーション側に持たせる必要がなく、認証情報の漏えいリスクを低減可能

### 4. 証跡の取得

- AWS CloudTrailによる操作ログの取得を設定する
  - AWSユーザのAPI操作などのアクションをログ取得保存するサービス
  - セキュリティインシデント発生時の分析に活用
  - CloudTrailのログをCloudWatch Logsに転送し監視することも可能 → 全リージョン有効化の上、必要に応じた期間を設定することを推奨
- その他ログも有効化する（手動での有効化が必要）
  - Amazon S3バケット
  - Amazon API Gateway
  - ELB
  - Amazon CloudFront
  - VPC Flow Logs

### 5. 各レイヤーでのセキュリティ対策

※以降は別途メンテナンス

## コスト最適化

## 信頼性

## 参考

<https://www.slideshare.net/AmazonWebServicesJapan/day-1-with-amazon-web-services-aws10>

<https://www.tdi.co.jp/miso/aws-day1-security-1>

<https://www.tdi.co.jp/miso/aws-day1-security-2>
