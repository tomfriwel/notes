# Taro 使用指南

### 配置安装

[安装及使用](https://nervjs.github.io/taro/docs/GETTING-STARTED.html)

`$ yarn global add @tarojs/cli`

### 创建新项目

`$ taro init myApp`

```shell
? 请输入项目介绍！ demo
? 是否需要使用 TypeScript ？ No
? 请选择 CSS 预处理器（Sass/Less/Stylus） 无
? 请选择模板 默认模板
```

安装依赖：`$ yarn`

开始监听修改：`$ yarn dev:weapp`

打包：`$ yarn build:weapp`

### 注意事项

- `css`单位用`px`或者`rpx`都可以，`px`会自动转为同值的`rpx`

### 目录结构

```
├── config                 配置目录
|   ├── dev.js             开发时配置
|   ├── index.js           默认配置
|   └── prod.js            打包时配置
├── src                    源码目录
|   ├── components         公共组件目录
|   ├── pages              页面文件目录
|   |   ├── index          index 页面目录
|   |   |   ├── banner     页面 index 私有组件
|   |   |   ├── index.js   index 页面逻辑
|   |   |   └── index.css  index 页面样式
|   ├── utils              公共方法库
|   ├── app.css            项目总通用样式
|   └── app.js             项目入口文件
└── package.json
```

#### 微信开发者工具 设置

- 需要设置关闭 ES6 转 ES5 功能，开启可能报错
- 需要设置关闭上传代码时样式自动补全，开启可能报错
- 需要设置关闭代码压缩上传，开启可能报错

- [开发前注意](https://nervjs.github.io/taro/docs/before-dev-remind.html#小程序)

### 页面相关

通过`this.$router.params`获取路由参数

### 生命周期

componentWillMount - onLaunch

componentDidMount - onLaunch

componentDidShow - onShow

componentDidHide - onHide


### 相关链接

- [taro初探：使用taro构建微信小程序基础教程](https://www.jianshu.com/p/6fbe80bc2ab1)