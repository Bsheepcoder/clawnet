# ClawNet CLI 使用指南

---

## 📦 两种 CLI 模式

ClawNet 提供两种命令行工具：

### 1. **clawnet** - 传统命令行
快速执行单个命令，适合脚本和自动化。

### 2. **clawnet-interactive** - 交互式 CLI
友好的菜单式交互，适合日常使用。

---

## 🚀 安装

### 全局安装

```bash
npm install -g @husile/clawnet
```

### 本地安装

```bash
npm install @husile/clawnet
npx clawnet
```

---

## 💻 使用 clawnet (传统模式)

### 基本命令

```bash
# 查看帮助
clawnet help

# 系统状态
clawnet health

# 生成 Token
clawnet token
```

### 节点管理

```bash
# 创建节点
clawnet create-node bot-001 --name "客服机器人" --type bot

# 列出所有节点
clawnet list-nodes

# 查看节点详情
clawnet get-node bot-001

# 删除节点
clawnet delete-node bot-001
```

### 关系管理

```bash
# 创建关系
clawnet add-relation bot-001 bot-002 \
  --type collaborate \
  --perms "read,write"

# 列出所有关系
clawnet list-relations

# 删除关系
clawnet delete-relation <relation-id>
```

### 权限检查

```bash
# 检查权限
clawnet check-perm bot-001 bot-002 read
```

### 事件路由

```bash
# 路由事件
clawnet route bot-001 message '{"text":"Hello"}'
```

### 在线状态

```bash
# 查看在线节点
clawnet list-online
```

---

## 🎮 使用 clawnet-interactive (交互模式)

### 启动交互式 CLI

```bash
clawnet-interactive
```

### 主要功能

**1. 节点管理**
- ➕ 创建节点
- 📋 查看所有节点
- 🔍 查看节点详情
- ✏️ 更新节点
- 🗑️ 删除节点
- 📤 导出节点
- 📥 导入节点

**2. 关系管理**
- ➕ 创建关系
- 📋 查看所有关系
- ⏱️ 创建临时关系 (TTL)
- 🔍 查看关系详情
- 🗑️ 删除关系
- 🧹 清理过期关系

**3. 权限管理**
- 🔍 检查权限
- 📋 查看权限列表

**4. 实时监控**
- 📡 在线节点
- 📊 事件监控

**5. 配置管理**
- 🔧 配置服务器地址
- 🔑 配置 Token
- 📋 查看当前配置

**6. 系统状态**
- 📊 查看系统状态
- ✅ 健康检查

---

## 📋 常用场景

### 场景1：快速创建节点

```bash
# 使用传统模式
clawnet create-node bot-001 --name "客服Bot" --type bot

# 或使用交互模式
clawnet-interactive
# 选择: 节点管理 → 创建节点
```

### 场景2：批量创建关系

```bash
# 创建脚本 create-relations.sh
#!/bin/bash
clawnet add-relation user-001 bot-001 --type observe --perms "read"
clawnet add-relation user-002 bot-001 --type observe --perms "read"
clawnet add-relation admin bot-001 --type manage --perms "read,write,admin"

# 执行
bash create-relations.sh
```

### 场景3：导出/导入配置

```bash
# 导出
clawnet list-nodes --json > nodes.json
clawnet list-relations --json > relations.json

# 导入
# 使用交互模式: 节点管理 → 导入节点
clawnet-interactive
```

### 场景4：临时授权

```bash
# 使用交互模式创建临时关系
clawnet-interactive
# 选择: 关系管理 → 创建临时关系 (TTL)
# 设置 TTL: 3600 (1小时)
```

### 场景5：定期清理

```bash
# 添加到 crontab
0 0 * * * clawnet cleanup-relations
```

---

## 🔧 配置

### 环境变量

```bash
# ClawNet 服务器地址
export CLAWNET_URL="http://localhost:3000"

# API Token
export CLAWNET_TOKEN="your-token-here"
```

### 配置文件

```bash
# 使用交互模式配置
clawnet-interactive
# 选择: 配置管理 → 配置服务器地址 / 配置 Token
```

配置文件位置：`~/.clawnetrc`

---

## 📊 输出格式

### 默认格式

```bash
clawnet list-nodes
```

输出：
```
📋 节点列表 (3 个):

   bot-001
     类型: bot
     名称: 客服Bot
     创建: 2026-03-20 16:00:00
```

### JSON 格式

```bash
clawnet list-nodes --json
```

输出：
```json
[
  {
    "id": "bot-001",
    "type": "bot",
    "name": "客服Bot",
    "createdAt": 1710902400000
  }
]
```

---

## 🎨 彩色输出

交互式 CLI 提供彩色输出：

- 🟢 绿色 - 成功
- 🟡 黄色 - 警告
- 🔴 红色 - 错误
- 🔵 蓝色 - 信息

---

## 🚨 错误处理

### 常见错误

**1. 无法连接服务器**
```
❌ 连接失败: connect ECONNREFUSED
```

**解决：** 启动 ClawNet 服务
```bash
npm start
```

**2. Token 无效**
```
❌ Unauthorized
```

**解决：** 配置正确的 Token
```bash
clawnet token  # 生成新 Token
export CLAWNET_TOKEN="new-token"
```

**3. 节点不存在**
```
❌ Node not found
```

**解决：** 检查节点 ID 是否正确

---

## 💡 最佳实践

### 1. 使用脚本自动化

```bash
#!/bin/bash
# setup-bot.sh

BOT_ID=$1
BOT_NAME=$2

clawnet create-node $BOT_ID --name "$BOT_NAME" --type bot
clawnet add-relation admin $BOT_ID --type manage --perms "read,write,admin"

echo "✅ Bot $BOT_NAME 创建完成"
```

### 2. 定期备份

```bash
# backup.sh
DATE=$(date +%Y%m%d)
clawnet list-nodes --json > backup-nodes-$DATE.json
clawnet list-relations --json > backup-relations-$DATE.json
```

### 3. 使用别名

```bash
# 添加到 ~/.bashrc
alias cn='clawnet'
alias cni='clawnet-interactive'
alias cn-health='clawnet health'
alias cn-nodes='clawnet list-nodes'
alias cn-relations='clawnet list-relations'
```

---

## 🔗 快速参考

| 命令 | 说明 |
|------|------|
| `clawnet help` | 显示帮助 |
| `clawnet health` | 系统状态 |
| `clawnet create-node <id>` | 创建节点 |
| `clawnet list-nodes` | 列出节点 |
| `clawnet add-relation <from> <to>` | 创建关系 |
| `clawnet list-relations` | 列出关系 |
| `clawnet check-perm <node> <target> <action>` | 检查权限 |
| `clawnet-interactive` | 启动交互式 CLI |

---

## 📞 需要帮助？

- **文档:** https://github.com/Bsheepcoder/ClawNet
- **Issues:** https://github.com/Bsheepcoder/ClawNet/issues

---

**Happy Coding! 🚀**
