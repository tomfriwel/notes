#!/bin/bash

# 通过PID查看进程执行时间

# 检查参数数量
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <PID>"
    exit 1
fi

# 获取传入的 PID
pid="$1"

# 使用 ps 命令显示进程信息
ps -p "$pid" -o pid,etime,pcpu,pmem,cmd