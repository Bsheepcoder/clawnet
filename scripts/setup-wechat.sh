#!/bin/bash

# 微信环境变量快速配置脚本

echo "🔧 配置微信环境变量"
echo ""

# 提示用户输入配置
echo "请输入微信配置信息："
echo ""
read -p "WECHAT_APPID: " WECHAT_APPID
read -p "WECHAT_APPSECRET: " WECHAT_APPSECRET
read -p "WECHAT_TOKEN (默认: clawnet): " WECHAT_TOKEN
WECHAT_TOKEN=${WECHAT_TOKEN:-clawnet}
read -p "WECHAT_ENCODING_AES_KEY: " WECHAT_ENCODING_AES_KEY

echo ""
echo "✅ 环境变量已设置："
echo ""
echo "   WECHAT_APPID:             $WECHAT_APPID"
echo "   WECHAT_APPSECRET:         ${WECHAT_APPSECRET:0:8}..."
echo "   WECHAT_TOKEN:             $WECHAT_TOKEN"
echo "   WECHAT_ENCODING_AES_KEY:  ${WECHAT_ENCODING_AES_KEY:0:8}..."
echo ""

# 写入 .env 文件
cat > .env << EOF
# 微信配置
WECHAT_APPID=$WECHAT_APPID
WECHAT_APPSECRET=$WECHAT_APPSECRET
WECHAT_TOKEN=$WECHAT_TOKEN
WECHAT_ENCODING_AES_KEY=$WECHAT_ENCODING_AES_KEY
EOF

echo "✅ 已保存到 .env 文件"
echo ""
echo "📝 下一步："
echo "   1. 重启 ClawNet: npm start"
echo "   2. 配置微信公众号后台"
echo "   3. 测试消息收发"
