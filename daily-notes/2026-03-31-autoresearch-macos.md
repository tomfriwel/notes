```sh
# 安装 uv
curl -LsSf https://astral.sh/uv/install.sh | sh
# 下载 Mac 适配版仓库
git clone https://github.com/miolini/autoresearch-macos.git
cd autoresearch-macos
# 安装依赖（uv 会自动处理虚拟环境）
uv sync

# 下载数据集和分词器（约1-2分钟）
uv run prepare.py
# 跑一轮 5 分钟训练（看终端是否正常输出日志）
uv run train.py
```

4. 唤醒 AI Agent（10秒）

AutoResearch 本身只是一个“舞台”，需要配合 Claude Code、Cursor 或 Aider​ 等支持代码生成的 AI 助手来充当“演员”。
操作方式：
在 Cursor 或 Claude Code 中打开 autoresearch-macos项目文件夹。
发送指令给 AI：

Hi have a look at program.md and let's kick off a new experiment! let's do the setup first.

```sh
# claude code 没在默认的nvm版本里装过，但是在之前的版本里有，迁移过来
nvm reinstall-packages 20.19.3
cd ~/your-path/autoresearch-macos
claude
>Hi have a look at program.md and let's kick off a new experiment! let's do the setup first.
```