#!/bin/bash
# ClawNet 启动脚本
# 注意：敏感配置已移至 .env 文件

# 检查 .env 文件是否存在
if [ ! -f .env ]; then
    echo "错误：.env 文件不存在"
    echo "请复制 .env.example 并填入你的配置："
    echo "  cp .env.example .env"
    exit 1
fi

# 加载环境变量
export $(cat .env | grep -v '^#' | xargs)

# 启动服务
echo "正在启动 ClawNet..."
echo "端口: $PORT"
echo "主机: $HOST"
node dist/server.js
