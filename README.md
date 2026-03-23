# ClawNet

<div align="center">

**🤖 Relation-Driven Multi-Node Intelligent Collaboration Network**

**ClawNet** | **[中文版](README_CN.md)** | **[Windows 安装](INSTALL_WINDOWS.md)** | **[CLI 指南](CLI-GUIDE.md)**

[![npm version](https://badge.fury.io/js/@husile%2Fclawnet-lite.svg)](https://www.npmjs.com/package/@husile/clawnet-lite)
[![npm downloads](https://img.shields.io/npm/dm/@husile/clawnet-lite.svg)](https://www.npmjs.com/package/@husile/clawnet-lite)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Node](https://img.shields.io/badge/node-%3E%3D20.0.0-brightgreen.svg)](https://nodejs.org)

> **📢 当前版本: `@husile/clawnet-lite` (轻量版)**
> 
> 📦 [查看版本说明](VERSION-NOTES.md) | 🔄 [从完整版迁移](VERSION-NOTES.md#q-从完整版迁移到-lite-版本需要做什么)

</div>

---

## 📖 Overview

ClawNet is a multi-node intelligent collaboration system based on relation networks, featuring:
- Multi-platform message routing (WeChat, Telegram, etc.)
- Node relationship management and permission control
- Intelligent message distribution and processing
- Flexible plugin architecture

## 🚀 Key Features

- ✅ Multi-platform adapters (WeChat Official Account, Telegram Bot)
- ✅ Relation graph topology management
- ✅ Role-based permission control
- ✅ WebSocket real-time communication
- ✅ SQLite local storage
- ✅ Extensible plugin system

## 🛠️ Tech Stack

- **Runtime:** Node.js 20+
- **Framework:** Express.js
- **Database:** SQLite (better-sqlite3)
- **Language:** TypeScript
- **Protocol:** WebSocket, HTTP

## 📦 Installation

> **🪟 Windows Users:** See [Windows Installation Guide](INSTALL_WINDOWS.md) for detailed instructions.

### Lite 版本（当前推荐）

```bash
# Using npm (recommended)
npm install @husile/clawnet-lite

# Using yarn
yarn add @husile/clawnet-lite

# Using pnpm
pnpm add @husile/clawnet-lite

# Global installation for CLI
npm install -g @husile/clawnet-lite
```

### 添加 SQLite 支持（可选）

如果需要持久化存储功能：

```bash
# Install SQLite dependency
npm install better-sqlite3

# Or use memory mode (no database required):
const clawnet = new ClawNet({ storage: 'memory' });
```

### 从源码安装

```bash
# Clone the repository
git clone https://github.com/Bsheepcoder/ClawNet.git
cd ClawNet
npm install
```

> **📖 版本说明:** 了解 Lite 版本的详细说明，请查看 [VERSION-NOTES.md](VERSION-NOTES.md)

## ⚙️ Configuration

**Method 1: Environment Variables**
```bash
export PORT=3000
export HOST=0.0.0.0
npm start
```

**Method 2: .env File (Recommended)**
```bash
# Create .env file
cat > .env << EOF
PORT=3000
HOST=0.0.0.0
EOF

# Start the server
npm start
```

## 📁 Project Structure

```
ClawNet/
├── dist/              # Compiled JavaScript
├── src/               # TypeScript source code
│   ├── adapters/      # Platform adapters
│   ├── index.ts       # Entry point
│   ├── server.ts      # HTTP server
│   ├── websocket.ts   # WebSocket server
│   ├── graph.ts       # Relation graph
│   ├── permission.ts  # Permission management
│   └── ...
├── bin/               # Executable files
├── cli/               # CLI tools
├── skill/             # OpenClaw skill integration
├── scripts/           # Utility scripts
└── package.json
```

## 🚀 Quick Start

### Build & Run

```bash
# Development mode
npm run dev

# Production mode
npm run build
npm start

# Or use the start script
./start.sh
```

### Usage Example

```javascript
const { Graph, Node } = require('@husile/clawnet-lite');

// Create a relation graph
const graph = new Graph();

// Add nodes
const alice = graph.addNode('alice', { name: 'Alice', role: 'admin' });
const bob = graph.addNode('bob', { name: 'Bob', role: 'user' });

// Establish relationship
graph.addRelation(alice, bob, 'friend');

// Send message
graph.sendMessage(alice, bob, 'Hello, Bob!');
```

### Integration with OpenClaw

See [skill/SKILL.md](skill/SKILL.md) for details.

## 🌐 API Documentation

### HTTP API

```
GET  /health          # Health check
POST /message         # Send message
GET  /nodes           # Get node list
GET  /relations       # Get relation list
```

### WebSocket API

```javascript
// Connect
const ws = new WebSocket('ws://localhost:3000/ws');

// Listen for messages
ws.onmessage = (event) => {
  console.log('Received:', event.data);
};

// Send message
ws.send(JSON.stringify({
  type: 'message',
  from: 'alice',
  to: 'bob',
  content: 'Hello!'
}));
```

## 📦 版本说明 | Version Info

### 当前版本：`@husile/clawnet-lite` (轻量版)

ClawNet 目前维护 **Lite 版本**，具有以下特点：

| 特性 | 说明 |
|------|------|
| **🚀 易于安装** | 无原生依赖，所有平台一键安装 |
| **📦 体积更小** | 不包含 `better-sqlite3` (~2-5MB) |
| **🔧 兼容性更好** | 不依赖 C++ 编译工具链 |
| **⚡ 快速部署** | 适合 CI/CD、Docker、云函数 |
| **✅ 功能完整** | 100% 功能，SQLite 为可选依赖 |

### 安装对比

```bash
# Lite 版本（默认）
npm install @husile/clawnet-lite

# 如需持久化存储，手动安装 SQLite
npm install better-sqlite3
```

> **📖 详细说明:** 查看 [VERSION-NOTES.md](VERSION-NOTES.md) 了解版本对比、迁移指南和 FAQ

## 🔒 Security

**Important:**
- This project **does not include any configuration files or credentials**
- All sensitive information must be configured by the user
- Do **not** commit `.env` files to version control
- Use environment variables or secret management services in production

## 🧪 Testing

```bash
# Run tests
npm test
```

## 📄 License

MIT License - See [LICENSE](LICENSE) file for details

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📊 Project Status

- ✅ Version: 0.5.0
- ✅ Status: Active Development
- ✅ Node.js: >=20.0.0
- ✅ License: MIT

## 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes.

## 📮 Contact & Support

- **GitHub:** [@Bsheepcoder](https://github.com/Bsheepcoder)
- **Project:** [https://github.com/Bsheepcoder/ClawNet](https://github.com/Bsheepcoder/ClawNet)
- **Issues:** [https://github.com/Bsheepcoder/ClawNet/issues](https://github.com/Bsheepcoder/ClawNet/issues)
- **npm:** [https://www.npmjs.com/package/@husile/clawnet](https://www.npmjs.com/package/@husile/clawnet)

## 🙏 Acknowledgments

- [OpenClaw](https://github.com/openclaw) - AI Agent Framework
- [Express.js](https://expressjs.com/) - Web Framework
- [Better-SQLite3](https://github.com/WiseLibs/better-sqlite3) - SQLite Database

---

<div align="center">

**⭐ If this project helps you, please give it a star! ⭐**

**🤝 Contributions, issues, and feature requests are welcome!**

</div>

---

## 📋 Quick Reference

| Item | Value |
|------|-------|
| **Package Name** | @husile/clawnet |
| **Current Version** | 0.5.0 |
| **Node.js** | >= 20.0.0 |
| **License** | MIT |
| **Repository** | [GitHub](https://github.com/Bsheepcoder/ClawNet) |
| **npm** | [npmjs.com](https://www.npmjs.com/package/@husile/clawnet) |

---

<div align="center">

**Built with ❤️ by the ClawNet Team**

</div>
