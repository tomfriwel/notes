
```sh
% bash <(curl -fsSL https://cdn.deepseek.com/api-docs/codex-deepseek-setup-en.sh)

Codex DeepSeek Setup  v1.0.0
Codex directory: /Users/xxx/.codex

Choose an action:
  1. Configure Codex to use the deepseek-v4-flash model
  2. Configure Codex to use the deepseek-v4-pro model (not available yet; expected early August 2026)
  3. Restore the default Codex configuration (remove deepseek settings)

Enter 1 / 2 / 3: 1

First-time install (target model: deepseek-v4-flash)

Don't have an API key yet? Create one at https://platform.deepseek.com/api_keys
Enter your DeepSeek API key (starts with sk-): [your key here]
✓ Backed up config.toml → /Users/xxx/.codex/backup-deepseek/config.toml
✓ Wrote /Users/xxx/.codex/models.json (contains deepseek-v4-flash and deepseek-v4-pro)
✓ Updated /Users/xxx/.codex/config.toml

Configuration written
  model                  = "deepseek-v4-flash"
  model_provider         = "deepseek"
  preferred_auth_method  = "apikey"
  forced_login_method    = "api"
  model_reasoning_effort = "high"
  model_catalog_json     = "~/.codex/models.json"

  [model_providers.deepseek]
  base_url  = "https://api.deepseek.com/"
  wire_api  = "responses"

Validation
✓ models.json is valid JSON
! TOML parse validation was skipped (requires Python 3.11+)

✓ Installation complete.

How to verify it took effect:
  • ChatGPT desktop app: the model picker showing "Custom" means success
    (the desktop app labels all locally configured models "Custom"; it is actually using deepseek-v4-flash)
  • Codex CLI: the startup banner shows model: deepseek-v4-flash

If the logs show "fallback model metadata" or "Unknown model",
models.json was not loaded — please reinstall.

How to switch / restore
Your original configuration was backed up to /Users/xxx/.codex/backup-deepseek
Just run this script again:

  bash <(curl -fsSL https://cdn.deepseek.com/api-docs/codex-deepseek-setup-en.sh)

  Pick 1/2 to switch between flash / pro, or 3 to restore the pre-install configuration.


```


直接说结论：**你装的"ChatGPT 桌面应用"里那个 Codex 模式，没有 ChatGPT 账号时会被卡在登录界面**；但好消息是——Codex 客户端本身就支持用 API Key 登录，而 DeepSeek 官方在 2026 年已经原生兼容 Codex 的 Responses API 协议，**不需要 ChatGPT 账号，不需要代理，国内直连就能跑** 。

下面给你两条路，**路线 A 最简单，优先试**。

## 路线 A：用 DeepSeek 官方一键脚本接入（推荐，5 分钟）

这是 DeepSeek 官方文档给的方案，原理是修改 `~/.codex/config.toml`，把模型供应商指向 DeepSeek，所有 Codex 客户端（CLI / ChatGPT 桌面应用 / VS Code 插件）共用这份配置 。

**第 1 步：准备好 Codex 配置目录**

打开 Mac 终端，确认 `~/.codex` 目录存在。如果还没有，先打开一次 Codex/ChatGPT 桌面应用（哪怕卡在登录界面也没关系），目录会自动生成。

**第 2 步：去 DeepSeek 开放平台拿 API Key**

1. 打开 https://platform.deepseek.com 
2. 注册登录 → 左侧 "API Keys" → 创建 API Key
3. **复制保存 `sk-` 开头的密钥**（只显示一次！）
4. 建议先充值 **10 元**，按量计费 

> ⚠️ 当前 DeepSeek 只有 **`deepseek-v4-flash`** 支持接入 Codex，`deepseek-v4-pro` 预计 2026 年 8 月初支持 。所以配置模型时先用 flash。

**第 3 步：终端跑一键配置脚本**

```bash
bash <(curl -fsSL https://cdn.deepseek.com/api-docs/codex-deepseek-setup-en.sh)
```

脚本会让你选模型、输入 API Key，然后自动完成 ：
- 备份原有 `~/.codex/config.toml` 到 `~/.codex/backup-deepseek/`
- 写入模型清单 `~/.codex/models.json`
- 修改 `config.toml`，加入 `[model_providers.deepseek]` 段
- 你的 MCP、项目信任等其他配置全部保留

**第 4 步：重启 Codex 客户端**

完全退出 ChatGPT/Codex 桌面应用（包括后台进程），重新打开。此时登录界面的强制账号校验会被绕过，**直接进入操作界面** ，底部模型选择器里能看到 `deepseek-v4-flash`。

测试：输入"帮我写一个快速排序"，能输出代码就成功了。

---

## 路线 B：用 Codex++ / CC Switch 图形化工具（新手友好）

如果你不想碰终端命令，可以用第三方增强工具，本质是本地起一个代理，把 Codex 的 Responses API 请求翻译成 DeepSeek 的 Chat Completions 格式 。

**Codex++ 方案**（Mac 用户反馈较多）：

1. 下载 Codex++：https://github.com/BigPizzaV3/CodexPlusPlus/releases
   - Apple 芯片选 `CodexPlusPlus-x.x.x-macos-arm64.dmg`
   - Intel 选 `CodexPlusPlus-x.x.x-macos-x64.dmg`
   - **两个 dmg 都要装**：「Codex++ 管理工具」+「Codex++ app」
2. 解除 macOS 隔离：
   ```bash
   sudo xattr -cr /Applications/Codex++.app
   sudo xattr -cr /Applications/Codex++\ 管理工具.app
   ```
3. 打开「Codex++ 管理工具」→ 供应商配置 → 添加供应商：
   - 接入模式：**纯 API**
   - Base URL：`https://api.deepseek.com`
   - Key：你的 DeepSeek API Key
   - 上游协议：**Chat Completions**（关键，DeepSeek 不支持 Responses）
   - 测试模型：`deepseek-v4-flash`
4. 保存 → 点"使用" → 通过「Codex++ app」启动 Codex（**必须从这个快捷方式打开**，普通双击 Codex 无效）
5. 界面右上角出现 Codex++ 绿点，模型选择器里有 DeepSeek 即成功 

> 💡 CC Switch 是另一个同类工具，Homebrew 一键装：`brew tap farion1231/ccswitch && brew install --cask cc-switch`，配置逻辑相同 。

---

## ⚠️ 几个必须知道的坑

**1. ChatGPT 桌面应用 vs 纯 Codex 桌面应用**
你下的是合并后的 ChatGPT 桌面应用，理论上走路线 A 修改 `~/.codex/config.toml` 后，Codex 模式应该能直连 DeepSeek。**但如果登录界面仍然强制跳 ChatGPT 账号**，建议直接从 https://openai.com/codex 下载独立的 Codex 桌面端，那个对 API Key 登录的支持更干净 。

**2. 用 API Key 登录的功能取舍**
即便你用 OpenAI 自己的 API Key 登录（而不是 DeepSeek），**云端会话（cloud threads）等功能也不可用**，只有本地任务执行正常 。接 DeepSeek 同理——你得到的是一个完全本地运行的代码 Agent，会话历史不会跨设备同步。

**3. 协议不匹配会报错**
DeepSeek 当前**只**兼容 Chat Completions 协议，而 Codex 默认发 Responses API 请求。这就是为什么：
- 路线 A 用官方脚本能成（脚本会写好协议转换配置）
- 路线 B 必须在"上游协议"里手动选 Chat Completions
- 直接改 `base_url` 而不做协议转换，必报错 

**4. DeepSeek 余额**
新账号余额是 0，**不充值 API Key 调不通** ，先在平台充值 5-10 元。

---

## 给你的操作顺序

1. 先去 platform.deepseek.com 注册 + 充值 10 元 + 创建 API Key
2. 终端跑 DeepSeek 官方一键脚本（路线 A）
3. 重启 Codex 桌面端，看能否进界面
4. 能进 → 完事；不能进（仍卡登录）→ 下载独立 Codex 桌面端重来，或换 Codex++（路线 B）

按这个顺序，**30 分钟内能在 Mac 上用 DeepSeek 驱动 Codex 写代码**，全程零代理、零 ChatGPT 账号、零海外信用卡。

卡在哪一步告诉我，我帮你定位。