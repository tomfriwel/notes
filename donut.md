# 微信多端框架Donut

- [Donut官方文档](https://dev.weixin.qq.com/docs/?utm_source=donut_header)

## Error solution

### Run the app failed：You need to provide the Tencent Location Service API Key when using LBS SDK.


去[腾讯位置服务](https://lbs.qq.com)创建key，然后填写到多端项目打开`project.miniapp.json`并进入`扩展 SDK`配置，，启用`LBS SDK`以及填写`qmapAPIKey`。

- [位置服务使用指南](https://dev.weixin.qq.com/docs/framework/guideline/devtools/lbs.html?utm_source=donut_header#_1、申请-lbs-sdk-key)

### iOS打开闪退

然后ios的现在打开就闪退了
你先升级工具，这里你要理解的是sdk版本，不是基础库版本
我升级了还是没用，有没有地方有日志可以查看原因呢？

iOS SDK 1.2.x 版本启动时crash的问题，可以先升级工具到最新的nightly，然后删除 v2-ipa 目录的内容后再重新构建。

v2-ipa 目录： 在调试器控制台上输入 openMiniapp() 后即可看到。