# 贡献指南

感谢你对 Flutter 终端模拟器项目的关注！我们欢迎各种形式的贡献。

## 🤝 如何贡献

### 报告问题
- 使用 [GitHub Issues](../../issues) 报告 bug
- 提供详细的重现步骤
- 包含系统信息和错误日志
- 使用相应的标签分类问题

### 提出功能请求
- 在 Issues 中描述新功能的需求
- 解释功能的用途和价值
- 提供可能的实现思路

### 提交代码
1. Fork 项目到你的 GitHub 账户
2. 创建功能分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add some amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 创建 Pull Request

## 📋 开发规范

### 代码风格
- 遵循 [Dart 官方代码风格](https://dart.dev/guides/language/effective-dart/style)
- 使用 `dart format` 格式化代码
- 运行 `flutter analyze` 确保无警告

### 提交信息
使用清晰的提交信息格式：
```
类型(范围): 简短描述

详细描述（可选）

相关 Issue: #123
```

**类型:**
- `feat`: 新功能
- `fix`: 修复 bug
- `docs`: 文档更新
- `style`: 代码格式调整
- `refactor`: 代码重构
- `test`: 测试相关
- `chore`: 构建或辅助工具更改

### 分支策略
- `main`: 稳定版本分支
- `develop`: 开发分支
- `feature/*`: 功能开发分支
- `hotfix/*`: 紧急修复分支

## 🧪 测试

### 运行测试
```bash
# 运行所有测试
flutter test

# 运行特定测试
flutter test test/widget_test.dart

# 生成覆盖率报告
flutter test --coverage
```

### 测试要求
- 新功能必须包含相应的测试
- 确保测试覆盖率不降低
- 所有测试必须通过

## 📝 文档

### 文档更新
- 更新相关的 Markdown 文档
- 保持 API 文档的同步
- 添加必要的代码注释

### 文档风格
- 使用清晰简洁的语言
- 提供代码示例
- 包含必要的截图或图表

## 🔍 代码审查

### Pull Request 要求
- 提供清晰的 PR 描述
- 关联相关的 Issue
- 确保 CI 检查通过
- 响应审查意见

### 审查标准
- 代码质量和可读性
- 功能正确性
- 性能影响
- 安全考虑
- 文档完整性

## 🚀 发布流程

### 版本号规则
遵循 [语义化版本](https://semver.org/lang/zh-CN/)：
- `MAJOR.MINOR.PATCH`
- 主版本号：不兼容的 API 修改
- 次版本号：向下兼容的功能性新增
- 修订号：向下兼容的问题修正

### 发布检查清单
- [ ] 更新版本号
- [ ] 更新 CHANGELOG.md
- [ ] 运行完整测试套件
- [ ] 构建所有平台版本
- [ ] 更新文档
- [ ] 创建 Git 标签
- [ ] 发布 GitHub Release

## 🏷️ Issue 和 PR 标签

### Issue 标签
- `bug`: 错误报告
- `enhancement`: 功能增强
- `documentation`: 文档相关
- `good first issue`: 适合新贡献者
- `help wanted`: 需要帮助
- `question`: 问题咨询

### PR 标签
- `work in progress`: 开发中
- `ready for review`: 准备审查
- `needs changes`: 需要修改
- `approved`: 已批准

## 💬 社区

### 沟通渠道
- GitHub Issues: 问题报告和功能讨论
- GitHub Discussions: 一般讨论和问答
- Pull Requests: 代码审查和技术讨论

### 行为准则
- 保持友善和专业
- 尊重不同观点
- 提供建设性反馈
- 帮助新贡献者

## 🎯 贡献领域

我们特别欢迎以下方面的贡献：

### 核心功能
- 新的内置命令
- 性能优化
- 错误处理改进
- 跨平台兼容性

### 用户体验
- UI/UX 改进
- 主题和自定义选项
- 可访问性增强
- 国际化支持

### 开发工具
- 测试覆盖率提升
- CI/CD 流程改进
- 开发文档完善
- 示例和教程

### 生态系统
- 插件系统开发
- 第三方集成
- 社区工具
- 最佳实践指南

## 📚 学习资源

### Flutter 开发
- [Flutter 官方文档](https://flutter.dev/docs)
- [Dart 语言指南](https://dart.dev/guides)
- [Flutter 最佳实践](https://flutter.dev/docs/perf/best-practices)

### 项目相关
- [项目架构文档](DEVELOPMENT.md)
- [API 参考手册](API_REFERENCE.md)
- [快速开始指南](QUICKSTART.md)

## 🙏 致谢

感谢所有为项目做出贡献的开发者！你们的努力让这个项目变得更好。

### 贡献者列表
- 项目创建者和维护者
- 功能贡献者
- 文档贡献者
- 测试贡献者
- 问题报告者

---

**再次感谢你的贡献！** 🎉

如果你有任何问题，请随时在 Issues 中提出或联系项目维护者。