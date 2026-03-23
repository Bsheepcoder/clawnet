# 版本说明 | Version Notes

## 📦 当前维护版本 | Current Maintained Version

**`@husile/clawnet-lite`** (轻量版 | Lite Version)

[![npm version](https://badge.fury.io/js/@husile%2Fclawnet-lite.svg)](https://www.npmjs.com/package/@husile/clawnet-lite)
[![npm downloads](https://img.shields.io/npm/dm/@husile/clawnet-lite.svg)](https://www.npmjs.com/package/@husile/clawnet-lite)

---

## 🎯 为什么选择 Lite 版本？| Why Lite Version?

### ✅ 优势 | Advantages

| 特性 | 说明 |
|------|------|
| **🚀 易于安装** | 无需编译原生模块，所有平台一键安装 |
| **📦 体积更小** | 不包含 `better-sqlite3`，减少约 2-5MB |
| **🔧 兼容性更好** | 不依赖 C++ 编译工具链 |
| **⚡ 快速部署** | 适合 CI/CD、Docker、云函数等场景 |
| **🧪 开发友好** | 快速原型开发和测试 |

### 📊 版本对比 | Version Comparison

| 特性 | **@husile/clawnet-lite** (当前) | @husile/clawnet (完整版) |
|------|-------------------------------|------------------------|
| **SQLite 依赖** | 可选 (peer dependency) | 强制依赖 |
| **原生模块** | ❌ 无 | ✅ better-sqlite3 |
| **安装难度** | ⭐ 简单 | ⭐⭐⭐ 需要 C++ 工具链 |
| **存储功能** | ✅ 按需安装 | ✅ 内置 |
| **功能完整性** | ✅ 100% | ✅ 100% |
| **适用场景** | 快速部署、开发测试 | 需要持久化存储 |

---

## 📥 安装 | Installation

### Lite 版本（默认）

```bash
# 全局安装
npm install -g @husile/clawnet-lite

# 项目依赖
npm install @husile/clawnet-lite
```

### 添加 SQLite 支持（可选）

如果需要持久化存储功能：

```bash
# 手动安装 better-sqlite3
npm install better-sqlite3

# 或者在项目 package.json 中添加
{
  "dependencies": {
    "@husile/clawnet-lite": "^0.7.0",
    "better-sqlite3": "^9.0.0"
  }
}
```

---

## 🔄 版本历史 | Version History

### v0.7.0 (2026-03-23) - 当前版本 ✨

**🎉 重大更新：多实例管理集成**

- ✅ 集成 Multi-OpenClaw 功能到 ClawNet
- ✅ 新增实例管理 CLI: `clawnet instance create/list/start/stop`
- ✅ 新增 RESTful API: `/instances/*`
- ✅ 自动端口计算、插件安装、进程管理
- ✅ 完整的实例生命周期管理

### v0.6.1 (2026-03-23)

- ✅ 新增现代 TUI 控制界面 (clawnet-ctl)
- ✅ Box-drawing UI 设计
- ✅ 实时系统监控

### v0.6.0 (2026-03-20)

- ✅ 初始 Lite 版本发布
- ✅ 移除强制 SQLite 依赖

### v0.5.x (2026-03-早期)

- ✅ 完整版功能
- ✅ 内置 better-sqlite3

---

## 🗺️ 未来计划 | Future Plans

### 短期目标

- [ ] 完善 Web UI 管理界面
- [ ] 增强实例监控和日志
- [ ] 支持更多消息适配器

### 长期目标

- [ ] 统一版本策略
- [ ] 插件生态系统
- [ ] 云原生部署方案

---

## ❓ FAQ

### Q: Lite 版本功能是否完整？

**A:** ✅ 是的！Lite 版本功能 100% 完整，只是将 SQLite 作为可选依赖，其他所有功能都保持一致。

### Q: 如何判断是否需要安装 SQLite？

**A:** 如果你需要：
- 持久化节点和关系数据
- 保存配置和状态
- 本地数据存储

则需要安装 `better-sqlite3`。如果只是临时使用或内存存储，则不需要。

### Q: 完整版还会继续维护吗？

**A:** 目前暂时只维护 Lite 版本。如果未来有需求，可能会考虑：
1. 统一为一个版本（SQLite 作为可选依赖）
2. 同时维护两个版本

### Q: 从完整版迁移到 Lite 版本需要做什么？

**A:** 只需要：
```bash
npm uninstall @husile/clawnet
npm install @husile/clawnet-lite

# 如果需要 SQLite
npm install better-sqlite3
```

配置和代码无需修改！

---

## 📞 联系方式 | Contact

- **GitHub Issues:** https://github.com/Bsheepcoder/ClawNet/issues
- **npm:** https://www.npmjs.com/package/@husile/clawnet-lite
- **Email:** 见 package.json

---

<div align="center">

**Made with ❤️ by husile**

</div>
