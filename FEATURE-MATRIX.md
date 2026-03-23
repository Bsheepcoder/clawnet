# ClawNet 功能矩阵

> **快速了解 ClawNet 的所有功能**

---

## 📊 功能一览表

### 核心功能

| 功能模块 | 状态 | 版本 | 说明 |
|---------|------|------|------|
| **📦 实例管理** | ✅ | v0.7.0 | OpenClaw 实例生命周期管理 |
| **🔗 节点管理** | ✅ | v0.5.0 | 添加、删除、更新节点 |
| **🔗 关系管理** | ✅ | v0.5.0 | 建立和管理节点关系 |
| **🔐 权限系统** | ✅ | v0.5.0 | 多层权限控制 |
| **📨 消息路由** | ✅ | v0.5.0 | 智能消息分发 |
| **🌐 WebSocket** | ✅ | v0.5.0 | 实时双向通信 |
| **🔌 平台适配** | ✅ | v0.5.0 | 多平台消息集成 |

### 实例管理功能（v0.7.0 新增）

| 功能 | CLI 命令 | API 端点 | 状态 |
|------|---------|---------|------|
| 创建实例 | `clawnet instance create <name>` | `POST /instances` | ✅ |
| 列出实例 | `clawnet instance list` | `GET /instances` | ✅ |
| 启动实例 | `clawnet instance start <name>` | `POST /instances/:name/start` | ✅ |
| 停止实例 | `clawnet instance stop <name>` | `POST /instances/:name/stop` | ✅ |
| 微信登录 | `clawnet instance login <name>` | - | ✅ |
| 连接 ClawNet | `clawnet instance connect <name>` | `POST /instances/:name/connect` | ✅ |
| 删除实例 | - | `DELETE /instances/:name` | ✅ |

### 节点管理功能

| 功能 | CLI 命令 | API 端点 | 状态 |
|------|---------|---------|------|
| 添加节点 | `clawnet node add <id>` | `POST /nodes` | ✅ |
| 获取节点 | `clawnet node get <id>` | `GET /nodes/:id` | ✅ |
| 列出节点 | `clawnet node list` | `GET /nodes` | ✅ |
| 更新节点 | `clawnet node update <id>` | `PUT /nodes/:id` | ✅ |
| 删除节点 | `clawnet node remove <id>` | `DELETE /nodes/:id` | ✅ |

### 关系管理功能

| 功能 | CLI 命令 | API 端点 | 状态 |
|------|---------|---------|------|
| 建立关系 | `clawnet relation add <from> <to>` | `POST /relations` | ✅ |
| 获取关系 | `clawnet relation get <id>` | `GET /relations/:id` | ✅ |
| 列出关系 | `clawnet relation list` | `GET /relations` | ✅ |
| 删除关系 | `clawnet relation remove <id>` | `DELETE /relations/:id` | ✅ |
| 发起请求 | - | `POST /relations/request` | ✅ |
| 接受请求 | - | `POST /relations/:id/accept` | ✅ |
| 拒绝请求 | - | `POST /relations/:id/reject` | ✅ |

### 权限系统功能

| 功能 | CLI 命令 | API 端点 | 状态 |
|------|---------|---------|------|
| 检查权限 | `clawnet check <from> <to> <action>` | `POST /check` | ✅ |
| 角色权限 | - | - | ✅ |
| 关系权限 | - | - | ✅ |
| 自定义权限 | - | - | ✅ |

### 平台适配器

| 平台 | 状态 | 说明 |
|------|------|------|
| **WeChat Official Account** | ✅ | 微信公众号集成 |
| **Telegram Bot** | ✅ | Telegram 机器人 |
| **WeChat Work** | 🔜 | 企业微信（计划中） |
| **Discord** | 🔜 | Discord Bot（计划中） |
| **Slack** | 🔜 | Slack App（计划中） |
| **Custom Adapter** | ✅ | 自定义适配器支持 |

### CLI 工具

| 工具 | 命令 | 状态 | 说明 |
|------|------|------|------|
| 标准 CLI | `clawnet` | ✅ | 命令行工具 |
| 交互式 CLI | `clawnet interactive` | ✅ | 交互式界面 |
| 现代 TUI | `clawnet-ctl` | ✅ | 现代终端界面 |
| 统一 CLI | `clawnet-v2` | ✅ | 新版统一 CLI |

### API 特性

| 特性 | 状态 | 说明 |
|------|------|------|
| RESTful API | ✅ | 标准 REST 接口 |
| WebSocket | ✅ | 实时双向通信 |
| Token 认证 | ✅ | Bearer Token 认证 |
| CORS 支持 | ✅ | 跨域资源共享 |
| JSON/XML | ✅ | 多格式支持 |

### 存储选项

| 存储方式 | 状态 | 说明 |
|---------|------|------|
| 内存模式 | ✅ | 无需数据库 |
| SQLite | ✅ | 本地数据库（可选） |
| JSON 文件 | ✅ | 文件存储 |

---

## 🎯 适用场景

### ✅ 已支持

| 场景 | 说明 |
|------|------|
| **多机器人协作** | 管理多个 AI 机器人协同工作 |
| **微信公众号管理** | 多公众号消息分发 |
| **多租户平台** | 为每个客户创建独立实例 |
| **AI 代理网络** | 多个 AI 代理协作完成任务 |
| **消息路由平台** | 智能消息分发和处理 |

### 🔜 计划支持

| 场景 | 说明 |
|------|------|
| **Web 管理界面** | 图形化管理平台 |
| **云原生部署** | Docker/K8s 部署方案 |
| **插件生态系统** | 第三方插件支持 |
| **数据分析** | 消息统计和分析 |

---

## 📈 性能指标

| 指标 | 数值 | 说明 |
|------|------|------|
| **安装大小** | ~55KB (压缩) | Lite 版本 |
| **启动时间** | < 1s | 内存模式 |
| **并发连接** | 1000+ | WebSocket |
| **消息吞吐** | 10K+/s | 路由性能 |
| **节点数量** | 无限制 | 理论值 |

---

## 🔧 技术栈

| 技术 | 版本 | 用途 |
|------|------|------|
| **Node.js** | 20+ | 运行时 |
| **TypeScript** | 5.0+ | 开发语言 |
| **Express.js** | 4.18+ | Web 框架 |
| **WebSocket** | 8.0+ | 实时通信 |
| **SQLite** | 9.0+ | 数据库（可选） |

---

## 📦 包信息

| 项目 | 值 |
|------|-----|
| **包名** | @husile/clawnet-lite |
| **当前版本** | 0.7.0 |
| **许可协议** | MIT |
| **Node.js** | >= 20.0.0 |
| **仓库** | https://github.com/Bsheepcoder/ClawNet |
| **npm** | https://www.npmjs.com/package/@husile/clawnet-lite |

---

## 📚 相关文档

- **完整功能说明**: [FEATURES.md](FEATURES.md)
- **版本说明**: [VERSION-NOTES.md](VERSION-NOTES.md)
- **更新日志**: [CHANGELOG.md](CHANGELOG.md)
- **CLI 指南**: [CLI-GUIDE.md](CLI-GUIDE.md)

---

<div align="center">

**功能丰富 | 易于使用 | 持续更新**

</div>
