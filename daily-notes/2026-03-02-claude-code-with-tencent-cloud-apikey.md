# 安装claude code并使用第三方（腾讯云deepseek）


## Steps

```sh
npm install -g @anthropic-ai/claude-code
export ANTHROPIC_BASE_URL=https://api.lkeap.cloud.tencent.com/anthropic
export ANTHROPIC_AUTH_TOKEN=${API_KEY}
export API_TIMEOUT_MS=600000
export ANTHROPIC_MODEL=deepseek-v3.1-terminus
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1


cd my-project
claude

/create a html game
```

## 参考

- [腾讯云 DeepSeek Anthropic 兼容接口](https://cloud.tencent.com/document/product/1772/126272)