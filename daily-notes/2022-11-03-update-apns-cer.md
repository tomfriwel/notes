### APNS证书过期更新

- [How to renew the Apple Push Notification Service Certificate](https://nowplayingapps.com/renewing-apple-push-notification-certificate/)

### 如何生成CSR

- [Create a certificate signing request](https://help.apple.com/developer-account/#/devbfa00fef7)

上传`.certSigningRequest`文件，生成certificate并下载`cer`文件。

安装后发现证书不受信任

- [苹果推送证书不受信任解决办法](https://www.jianshu.com/p/9b019562b858)

到[Apple PKI](https://www.apple.com/certificateauthority/)下载G4证书，安装好后就会变成信任状态了。

- [AppleWWDRCAG4.cer](https://www.apple.com/certificateauthority/AppleWWDRCAG4.cer)


### 加声音震动

payload:
```json
{
    "aps":{
        "alert"{
            "title":"nick",
            "body":"content"
        },
        "sound":"default",
        "badge":1
    }
}
```