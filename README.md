# mikutter_fcm
## これなん
Firebase Cloud Messagingを使って通知を投げるイベントを追加します．

## 使い方
以下より通知を受け取るアプリをDLしてインストールします．  
[Andorid版](https://github.com/yuzumone/mikutter_fcm_for_android)  
アプリを起動するとTokenが表示されるので，mikutterの設定にコピペします．  
あとはPlugin#callすると通知が飛びます．

## インストール
```
$ mkdir -p ~/.mikutter/plugin/ && \
git clone https://github.com/yuzumone/mikutter_fcm.git ~/.mikutter/plugin/fcm
```

## 例
mikutter起動時に通知を投げる例を以下に示します．  
なおtitle，body，urlはすべて任意です．
```
on_boot do
  data = {
    :title => 'on_boot',
    :body => 'mikutterが起動(^O^)／',
    :url => 'https://mikutter.hachune.net/'
  }
  Plugin.call(:fcm, data)
end
```

## ライセンス
MIT License
