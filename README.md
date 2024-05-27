# awscli-ssm
このリポジトリではDockerイメージ「amazon/aws-cli」を拡張したイメージを作成します。
amazon/aws-cliをベースイメージとして、以下のリンクからsession-manager-pluginを取得してインストールします。
```
https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_arm64/session-manager-plugin.rpm
```
現時点ではmacos用のイメージにしか対応していません。
