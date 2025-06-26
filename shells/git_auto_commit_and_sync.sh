#!/bin/bash

# 进入你的项目目录（如果需要的话）
# cd /path/to/your/project

# 检查当前目录是否是一个 Git 仓库
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "错误：当前目录不是一个 Git 仓库。"
    exit 1
fi

# 获取当前分支名称
CURRENT_BRANCH=$(git branch --show-current)

echo "当前分支：$CURRENT_BRANCH"

# 检查是否有未暂存的更改或未提交的更改
HAS_CHANGES=false

if ! git diff-index --quiet HEAD --; then
    echo "检测到已修改但未提交的更改。"
    HAS_CHANGES=true
fi

# 检查是否有未追踪的文件
UNTRACKED_FILES=$(git ls-files --others --exclude-standard)
if [ -n "$UNTRACKED_FILES" ]; then
    echo "检测到未追踪的文件："
    echo "$UNTRACKED_FILES"
    HAS_CHANGES=true
fi

# 如果有更改（已修改或未追踪），则添加并提交
if $HAS_CHANGES; then
    echo "正在添加所有更改（包括未追踪文件）到暂存区..."
    git add .

    # 提交更改（使用时间戳作为提交信息）
    git commit -m "自动提交：$(date '+%Y-%m-%d %H:%M:%S')"
    echo "已提交更改。"
else
    echo "没有需要提交的更改（已修改或未追踪的文件）。"
fi

# 拉取远程最新更改（避免冲突）
echo "正在拉取远程 $CURRENT_BRANCH 分支的最新更改..."
git pull origin "$CURRENT_BRANCH"

# 推送本地更改到远程
echo "正在推送本地 $CURRENT_BRANCH 分支到远程..."
git push origin "$CURRENT_BRANCH"

echo "同步完成。"