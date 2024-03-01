#!/bin/bash

# 后台执行命令脚本（处理长时任务）

# 检查参数数量
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 \"<command>\""
    exit 1
fi

# 获取要执行的命令
command="$1"

# 输出当前时间
date +"%Y-%m-%d %H:%M:%S" >> nohup.out

# 将命令输出到 nohup.out 文件
echo "Running command: $command" >> nohup.out

# 使用 nohup 运行命令，并将输出追加到 nohup.out 文件
nohup $command >> nohup.out 2>&1 &

# 查找进程PID
pgrep -a -f "$command"