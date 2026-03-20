# ClawNet CLI 升级指南

## 🎉 新版 CLI 特性

基于 OpenClaw 和 OpenCode CLI 设计，完全重构 ClawNet 命令行工具。

---

## ✨ 新特性

### 1. **双模式支持**

**传统模式** - 快速命令
```bash
clawnet node create bot-001 --name "客服机器人"
clawnet node list
clawnet health
```

**交互模式** - 友好界面
```bash
clawnet interactive
# 或
clawnet i
```

---

### 2. **命令分组**

```
📦 节点管理
  clawnet node create <id>
  clawnet node list
  clawnet node get <id>
  clawnet node delete <id>
  clawnet node export [file]

🔗 关系管理
  clawnet relation create <from> <to>
  clawnet relation list
  clawnet relation cleanup

🔐 权限管理
  clawnet check <node> <target> <action>

📊 系统管理
  clawnet health
  clawnet token
  clawnet online

⚙️ 配置管理
  clawnet config set <key> <value>
  clawnet config get <key>
  clawnet config list
  clawnet config url [url]

🎮 交互模式
  clawnet interactive
  clawnet i

🚀 快速开始
  clawnet init
  clawnet quick

📚 帮助
  clawnet docs
  clawnet --help
```

---

### 3. **增强的用户体验**

**彩色输出**
- 🟢 绿色 - 成功
- 🟡 黄色 - 警告
- 🔴 红色 - 错误
- 🔵 蓝色 - 信息

**进度提示**
```
⠋ 创建节点...
⠙ 加载节点列表...
⠹ 检查系统状态...
```

**ASCII Art**
```
  ╔═══════════════════════════════════════╗
  ║       🤖 ClawNet CLI v0.5.3          ║
  ║  Relation-Driven Collaboration Network  ║
  ╚═══════════════════════════════════════╝
```

---

### 4. **灵活的全局选项**

```bash
clawnet [options] [command]

Options:
  -v, --version          显示版本号
  -u, --url <url>        ClawNet 服务器地址
  -t, --token <token>    API Token
  --no-color             禁用彩色输出
  --json                 输出 JSON 格式
  -h, --help             显示帮助
```

---

### 5. **交互模式增强**

**大标题**
```
  _____ _      _____ _______ 
 / ____| |    |_   _|__   __|
| |    | |      | |    | |   
| |    | |      | |    | |   
| |____| |____ _| |_   | |   
 \_____|______|_____|  |_|   
```

**分组菜单**
```
─── 节点管理 ───
➕  创建节点
📋  查看节点列表
🔍  查看节点详情
🗑️  删除节点

─── 关系管理 ───
➕  创建关系
⏱️  创建临时关系
📋  查看关系列表
```

---

## 🚀 使用示例

### 快速开始

```bash
# 初始化配置
clawnet init

# 查看系统状态
clawnet health

# 创建节点
clawnet node create bot-001 --name "客服机器人" --type bot

# 查看节点
clawnet node list

# 创建关系
clawnet relation create user-001 bot-001 --type observe --perms "read,write"

# 查看关系
clawnet relation list

# 检查权限
clawnet check user-001 bot-001 read

# 启动交互模式
clawnet interactive
```

---

### 高级用法

**指定服务器**
```bash
clawnet -u http://localhost:3001 health
```

**指定 Token**
```bash
clawnet -t your-token-here node list
```

**JSON 输出**
```bash
clawnet --json node list > nodes.json
```

**无颜色输出**
```bash
clawnet --no-color node list
```

---

## 📋 命令别名

| 命令 | 别名 |
|------|------|
| `node` | `nodes` |
| `node list` | `node ls` |
| `node delete` | `node rm` |
| `relation` | `relations` |
| `relation list` | `relation ls` |
| `interactive` | `i` |

---

## 🎯 与旧版对比

| 功能 | 旧版 CLI | 新版 CLI |
|------|---------|---------|
| **命令结构** | 扁平化 | 分组化 |
| **帮助信息** | 简单 | 详细 |
| **错误提示** | 基本 | 彩色 + 友好 |
| **配置管理** | 手动 | 自动持久化 |
| **交互模式** | 简单菜单 | 完整 UI |
| **命令别名** | 无 | 支持 |
| **全局选项** | 有限 | 丰富 |

---

## 🔧 配置持久化

配置自动保存到：`~/.clawnetrc`

```json
{
  "url": "http://localhost:3000",
  "token": "your-token"
}
```

---

## 💡 最佳实践

### 1. 初始化配置

```bash
# 首次使用
clawnet init

# 或手动配置
clawnet config url http://your-server:3000
clawnet config set token your-token
```

### 2. 日常使用

```bash
# 查看状态
clawnet health

# 使用交互模式（推荐新手）
clawnet i

# 使用命令模式（适合脚本）
clawnet node create bot-001 --name "Bot 1"
```

### 3. 脚本化

```bash
#!/bin/bash
# 批量创建节点

for i in {1..10}; do
  clawnet node create bot-$i --name "Bot $i"
done

clawnet node list
```

---

## 🆕 新增依赖

```
figlet: ^1.7.0  # ASCII Art
```

---

## 📚 帮助

**查看命令帮助**
```bash
clawnet --help
clawnet node --help
clawnet node create --help
```

**打开文档**
```bash
clawnet docs
```

---

**ClawNet CLI v0.5.3 - 更强大、更友好！** 🚀
