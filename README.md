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

### mikutter起動時に通知を投げる

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

### 通知にModelを使う

fcmイベントは、任意の Diva::Model インスタンスを取ることができます。

| Modelキー     | 意味                          |
|---------------|-------------------------------|
| `title`       | 通知のタイトル                |
| `description` | 通知の本文                    |
| `perma_link`  | 通知をタップしたときに開くURL |

```
on_boot do
  on_favorite do |world, user, message|
    Plugin.call(:fcm, message)
  end
end
```

## ライセンス
MIT License
