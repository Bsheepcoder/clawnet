# ClawNet 功能总览

> **版本:** 0.7.0  
> **更新日期:** 2026-03-23  
> **包名:** @husile/clawnet-lite

---

## 📋 目录

- [核心定位](#核心定位)
- [架构设计](#架构设计)
- [核心功能](#核心功能)
- [CLI 命令](#cli-命令)
- [API 接口](#api-接口)
- [使用场景](#使用场景)
- [快速开始](#快速开始)

---

## 🎯 核心定位

**ClawNet 是一个关系驱动的多节点智能协作网络平台**

### 核心价值

```
关系驱动 → 权限控制 → 智能路由 → 协作网络
```

1. **关系网络** - 基于图拓扑的节点关系管理
2. **权限系统** - 角色权限和关系权限控制
3. **智能路由** - 消息在节点间的智能分发
4. **多平台集成** - 支持 WeChat、Telegram 等多平台
5. **实例管理** - 统一管理多个 OpenClaw 实例

---

## 🏗️ 架构设计

```
┌─────────────────────────────────────────────────────────────┐
│                        ClawNet 平台                          │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐  │
│  │                  实例管理层 (NEW)                      │  │
│  │  • 创建/管理 OpenClaw 实例                            │  │
│  │  • 微信登录管理                                       │  │
│  │  • Gateway 进程管理                                   │  │
│  │  • ClawNet 连接管理                                   │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                              │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │   节点管理    │  │   关系管理    │  │   权限系统    │     │
│  │              │  │              │  │              │     │
│  │ • 添加节点    │  │ • 建立关系    │  │ • 角色权限    │     │
│  │ • 删除节点    │  │ • 移除关系    │  │ • 关系权限    │     │
│  │ • 更新节点    │  │ • 查询关系    │  │ • 权限检查    │     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
│                                                              │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │   消息路由    │  │  平台适配器   │  │  WebSocket   │     │
│  │              │  │              │  │              │     │
│  │ • 智能分发    │  │ • 微信公众号  │  │ • 实时推送    │     │
│  │ • 消息过滤    │  │ • Telegram   │  │ • 连接管理    │     │
│  │ • 事件处理    │  │ • 自定义适配  │  │ • 心跳检测    │     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
│                                                              │
│  ┌──────────────────────────────────────────────────────┐  │
│  │                    存储层                              │  │
│  │  • SQLite (可选)  • 内存模式  • JSON 文件              │  │
│  └──────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

---

## 🌟 核心功能

### 1. 📦 实例管理（NEW in v0.7.0）

**完整的 OpenClaw 实例生命周期管理**

```bash
# 创建实例
clawnet instance create my-bot

# 查看实例列表
clawnet instance list

# 启动实例网关
clawnet instance start my-bot

# 停止实例网关
clawnet instance stop my-bot

# 微信登录
clawnet instance login my-bot

# 连接到 ClawNet
clawnet instance connect my-bot
```

**特性：**
- ✅ 自动端口计算（19000-19099）
- ✅ 自动安装微信插件
- ✅ Gateway 进程管理
- ✅ 实例状态监控
- ✅ 微信登录状态追踪
- ✅ ClawNet 连接管理

### 2. 📦 节点管理

**管理网络中的所有节点**

```bash
# 添加节点
clawnet node add bot1 --type bot --name "My Bot"

# 查看节点
clawnet node get bot1

# 列出所有节点
clawnet node list

# 删除节点
clawnet node remove bot1

# 更新节点
clawnet node update bot1 --name "Updated Bot"
```

**节点类型：**
- `bot` - 机器人节点
- `user` - 用户节点
- `agent` - AI 代理节点
- `service` - 服务节点

### 3. 🔗 关系管理

**管理节点间的关系**

```bash
# 建立关系
clawnet relation add bot1 user1 friend

# 查看关系
clawnet relation get <relation-id>

# 列出关系
clawnet relation list

# 删除关系
clawnet relation remove <relation-id>

# 检查权限
clawnet check bot1 user1 message:send
```

**关系类型：**
- `friend` - 好友关系
- `follow` - 关注关系
- `admin` - 管理关系
- `member` - 成员关系
- `custom` - 自定义关系

### 4. 🔐 权限系统

**多层权限控制**

```bash
# 检查权限
clawnet check <from> <to> <action>

# 权限类型
- role:admin      # 角色权限
- relation:friend # 关系权限
- custom:action   # 自定义权限
```

**权限级别：**
1. **系统权限** - 超级管理员
2. **角色权限** - 基于角色
3. **关系权限** - 基于关系类型
4. **自定义权限** - 灵活配置

### 5. 📨 消息路由

**智能消息分发系统**

```javascript
// 发送消息
clawnet.sendMessage(from, to, message);

// 路由规则
{
  "from": "bot1",
  "to": "user1",
  "type": "text",
  "content": "Hello!",
  "metadata": {}
}
```

**路由策略：**
- ✅ 直接路由 - 一对一消息
- ✅ 广播路由 - 一对多消息
- ✅ 条件路由 - 基于规则过滤
- ✅ 优先级路由 - 消息优先级队列

### 6. 🔌 平台适配器

**多平台消息集成**

```bash
# 微信公众号
POST /clawnet/node/wechat-{appId}/message

# Telegram Bot
POST /clawnet/node/telegram-{botId}/message

# 自定义适配器
实现 Adapter 接口即可
```

**支持平台：**
- ✅ **WeChat Official Account** - 微信公众号
- ✅ **Telegram Bot** - Telegram 机器人
- 🔜 **WeChat Work** - 企业微信
- 🔜 **Discord** - Discord Bot
- 🔜 **Slack** - Slack App

### 7. 🌐 WebSocket 实时通信

**双向实时通信**

```javascript
// 连接 WebSocket
const ws = new WebSocket('ws://localhost:3000/ws');

// 接收消息
ws.onmessage = (event) => {
  console.log('Received:', event.data);
};

// 发送消息
ws.send(JSON.stringify({
  type: 'message',
  from: 'bot1',
  to: 'user1',
  content: 'Hello!'
}));
```

**功能：**
- ✅ 实时消息推送
- ✅ 心跳检测
- ✅ 自动重连
- ✅ 连接状态管理

### 8. 📊 系统监控

**健康检查和监控**

```bash
# 健康检查
clawnet health

# 输出示例
{
  "status": "healthy",
  "nodes": 10,
  "relations": 25,
  "wsConnections": 5,
  "uptime": 86400
}
```

---

## 💻 CLI 命令

### 主要命令

| 命令 | 说明 | 示例 |
|------|------|------|
| `clawnet instance` | 实例管理 | `clawnet instance create my-bot` |
| `clawnet node` | 节点管理 | `clawnet node add bot1` |
| `clawnet relation` | 关系管理 | `clawnet relation add bot1 user1` |
| `clawnet check` | 权限检查 | `clawnet check bot1 user1 send` |
| `clawnet health` | 健康检查 | `clawnet health` |
| `clawnet token` | 生成 Token | `clawnet token` |

### 交互式 CLI

```bash
# 启动交互式界面
clawnet interactive

# 或使用现代 TUI
clawnet-ctl
```

### 快速操作

```bash
# 快速添加节点
clawnet quick add-node

# 快速建立关系
clawnet quick add-relation

# 查看在线节点
clawnet online
```

---

## 🔌 API 接口

### RESTful API

**节点管理**
```http
GET    /nodes                    # 列出所有节点
GET    /nodes/:id                # 获取节点详情
POST   /nodes                    # 创建节点
PUT    /nodes/:id                # 更新节点
DELETE /nodes/:id                # 删除节点
```

**关系管理**
```http
GET    /relations                # 列出所有关系
GET    /relations/:id            # 获取关系详情
POST   /relations                # 建立关系
DELETE /relations/:id            # 删除关系
POST   /relations/request        # 发起关系请求
POST   /relations/:id/accept     # 接受关系请求
POST   /relations/:id/reject     # 拒绝关系请求
```

**实例管理（NEW）**
```http
GET    /instances                # 列出所有实例
GET    /instances/:name          # 获取实例详情
POST   /instances                # 创建实例
POST   /instances/:name/start    # 启动实例
POST   /instances/:name/stop     # 停止实例
POST   /instances/:name/connect  # 连接到 ClawNet
```

**权限检查**
```http
POST   /check                    # 检查权限
```

**微信接口**
```http
GET    /clawnet/node/wechat-{id}/message   # 微信验证
POST   /clawnet/node/wechat-{id}/message   # 接收消息
```

### WebSocket API

```javascript
// 连接
ws://localhost:3000/ws

// 消息格式
{
  "type": "message",
  "from": "bot1",
  "to": "user1",
  "content": "Hello!"
}
```

---

## 🎯 使用场景

### 1. 多机器人协作平台

```
场景：管理多个 AI 机器人协同工作

┌─────────┐    ┌─────────┐    ┌─────────┐
│  Bot A  │←──→│ ClawNet │←──→│  Bot B  │
└─────────┘    └─────────┘    └─────────┘
                    ↑
               ┌─────────┐
               │  Bot C  │
               └─────────┘

实现：
- Bot 间消息路由
- 权限控制
- 任务分发
```

### 2. 微信公众号管理系统

```
场景：管理多个微信公众号

User → WeChat Server → ClawNet → Bot A
                                 → Bot B
                                 → Database
```

### 3. 多租户 SaaS 平台

```
场景：为每个客户创建独立实例

Tenant A → Instance A → ClawNet
Tenant B → Instance B → ClawNet
Tenant C → Instance C → ClawNet

实现：
- 实例隔离
- 统一管理
- 资源共享
```

### 4. AI 代理协作网络

```
场景：多个 AI 代理协同完成任务

Task → Agent A (分析)
    → Agent B (执行)
    → Agent C (反馈)

实现：
- 任务路由
- 结果聚合
- 权限控制
```

---

## 🚀 快速开始

### 1. 安装

```bash
# 全局安装
npm install -g @husile/clawnet-lite

# 或项目依赖
npm install @husile/clawnet-lite
```

### 2. 启动服务

```bash
# 方式 1: 直接启动
clawnet-server

# 方式 2: 使用 npm
npm start

# 方式 3: 开发模式
npm run dev
```

### 3. 创建实例

```bash
# 创建 OpenClaw 实例
clawnet instance create my-bot

# 启动实例
clawnet instance start my-bot

# 查看状态
clawnet instance list
```

### 4. 添加节点

```bash
# 添加机器人节点
clawnet node add bot1 --type bot --name "My Bot"

# 添加用户节点
clawnet node add user1 --type user --name "Alice"

# 查看节点
clawnet node list
```

### 5. 建立关系

```bash
# 建立好友关系
clawnet relation add bot1 user1 friend

# 检查权限
clawnet check bot1 user1 message:send
```

### 6. 发送消息

```bash
# 通过 API
curl -X POST http://localhost:3000/message \
  -H "Content-Type: application/json" \
  -d '{
    "from": "bot1",
    "to": "user1",
    "content": "Hello!"
  }'
```

---

## 📚 文档资源

- **GitHub**: https://github.com/Bsheepcoder/ClawNet
- **npm**: https://www.npmjs.com/package/@husile/clawnet-lite
- **版本说明**: [VERSION-NOTES.md](VERSION-NOTES.md)
- **更新日志**: [CHANGELOG.md](CHANGELOG.md)
- **CLI 指南**: [CLI-GUIDE.md](CLI-GUIDE.md)
- **Windows 安装**: [INSTALL_WINDOWS.md](INSTALL_WINDOWS.md)

---

## 🔄 版本历史

### v0.7.0 (2026-03-23) - 当前版本 ✨

- ✅ 集成多实例管理功能
- ✅ 新增实例管理 CLI 和 API
- ✅ 自动端口计算和插件安装
- ✅ Gateway 进程管理
- ✅ 完整的实例生命周期管理

### v0.6.1 (2026-03-23)

- ✅ 新增现代 TUI 控制界面
- ✅ Box-drawing UI 设计

### v0.6.0 (2026-03-20)

- ✅ Lite 版本发布
- ✅ 移除强制 SQLite 依赖

### v0.5.x

- ✅ 完整的节点和关系管理
- ✅ 权限系统
- ✅ 消息路由
- ✅ WebSocket 支持
- ✅ 微信公众号集成

---

## 🤝 贡献

欢迎贡献代码、报告问题或提出建议！

1. Fork 项目
2. 创建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 提交 Pull Request

---

## 📄 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件

---

<div align="center">

**Made with ❤️ by husile**

**ClawNet - 连接一切，智能协作**

</div>
