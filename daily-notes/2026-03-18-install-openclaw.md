
```sh
node -v
# v22.22.1

npm install -g openclaw@latest
openclaw -v
# OpenClaw 2026.3.13 (61d171a)

# openclaw 提供的初始化向导
openclaw onboard --install-daemon

# npm 全局安装（推荐）
npm install -g clawhub

# 验证安装
clawhub --version

# tavily-search 是 ClawHub 下载量 Top 的核心技能，专为 AI Agent 优化的实时联网搜索能力，解决大模型知识 cutoff 问题，支持深度搜索、学术搜索、新闻搜索等场景。
clawhub search tavily-search


# 停止核心网关服务（最常用）
openclaw gateway stop

# 如果配置了守护进程，也一并停止
openclaw daemon stop

openclaw gateway status

pkill -f openclaw

openclaw status

# 再启动
openclaw gateway start
```

## Refs

- [OpenClaw 完全指南：这可能是全网最新最全的系统化教程了！（3.2W字，建议收藏）](https://mp.weixin.qq.com/s/zHQ70aXe5aoC_wodLglmPg)