# GitHub 发布指南

## 🚀 如何将项目发布到 GitHub

### 步骤 1: 创建 GitHub 仓库

1. **登录 GitHub**
   - 访问 [github.com](https://github.com)
   - 登录你的账户

2. **创建新仓库**
   - 点击右上角的 "+" 按钮
   - 选择 "New repository"
   - 填写仓库信息：
     - **Repository name**: `flutter-terminal-emulator`
     - **Description**: `A cross-platform terminal emulator built with Flutter`
     - **Visibility**: Public (推荐) 或 Private
     - **不要**勾选 "Initialize this repository with a README"
   - 点击 "Create repository"

### 步骤 2: 连接本地仓库到 GitHub

```bash
# 添加远程仓库 (替换 YOUR_USERNAME 为你的 GitHub 用户名)
git remote add origin https://github.com/YOUR_USERNAME/flutter-terminal-emulator.git

# 推送代码到 GitHub
git push -u origin main

# 推送标签
git push origin v1.0.0
```

### 步骤 3: 创建 GitHub Release

1. **进入 Releases 页面**
   - 在你的 GitHub 仓库页面
   - 点击右侧的 "Releases"
   - 点击 "Create a new release"

2. **填写 Release 信息**
   - **Tag version**: `v1.0.0` (选择已存在的标签)
   - **Release title**: `Flutter Terminal Emulator v1.0.0`
   - **Description**: 使用下面的模板

### Release 描述模板

```markdown
# 🎉 Flutter Terminal Emulator v1.0.0

首个正式版本发布！一个使用 Flutter 开发的跨平台终端模拟器。

## ✨ 主要功能

### 🔧 核心功能
- ✅ 完整的终端界面和命令输入
- ✅ 实时输出显示和自动滚动
- ✅ 命令历史管理（上下箭头键浏览）
- ✅ 键盘快捷键支持（Ctrl+C 中断）

### 📁 文件系统操作
- ✅ `ls` / `dir` - 列出目录内容
- ✅ `cd` - 切换目录  
- ✅ `pwd` - 显示当前目录
- ✅ `mkdir` - 创建目录
- ✅ `touch` - 创建文件
- ✅ `cat` - 显示文件内容

### 🛠️ 内置工具
- ✅ `help` - 显示帮助信息
- ✅ `clear` - 清空终端
- ✅ `echo` - 输出文本
- ✅ `history` - 显示命令历史
- ✅ `settings` - 打开设置对话框
- ✅ `exit` - 退出应用

### 💻 系统集成
- ✅ 执行系统命令（git、npm、flutter 等）
- ✅ 跨平台支持（Android、iOS、Windows、macOS、Linux）
- ✅ 可自定义界面（字体大小、颜色主题）

## 📱 支持平台

- **Android** (API 21+)
- **iOS** (11.0+)  
- **Windows** (Windows 10+)
- **macOS** (10.14+)
- **Linux** (Ubuntu 18.04+)

## 🚀 快速开始

### 从源码构建

1. **环境准备**
```bash
flutter doctor
```

2. **获取代码**
```bash
git clone https://github.com/YOUR_USERNAME/flutter-terminal-emulator.git
cd flutter-terminal-emulator
```

3. **安装依赖**
```bash
flutter pub get
```

4. **运行应用**
```bash
flutter run
```

### 预编译版本

下载对应平台的预编译版本：

- **Linux**: [flutter-terminal-emulator-linux-v1.0.0.tar.gz](链接)
- **Windows**: [flutter-terminal-emulator-windows-v1.0.0.zip](链接)
- **macOS**: [flutter-terminal-emulator-macos-v1.0.0.tar.gz](链接)
- **Android**: [flutter-terminal-emulator-android-v1.0.0.apk](链接)

## 📚 文档

- 📖 [用户指南](README.md)
- 🚀 [快速开始](QUICKSTART.md)
- 🔧 [开发文档](DEVELOPMENT.md)
- 📚 [API 参考](API_REFERENCE.md)
- 🤝 [贡献指南](CONTRIBUTING.md)

## 🔧 技术栈

- **Flutter** 3.10.1+
- **Dart** 3.0+
- **process_run** - 系统命令执行
- **shared_preferences** - 本地设置存储
- **path** - 文件路径处理

## 🎯 下一步计划

查看我们的 [路线图](README.md#路线图) 了解即将到来的功能：

- 标签页支持（多终端会话）
- 命令自动补全
- 语法高亮
- SSH 连接支持

## 🐛 问题反馈

遇到问题？请：

1. 查看 [常见问题](README.md#故障排除)
2. 搜索 [已知问题](../../issues)
3. [创建新 Issue](../../issues/new/choose)

## 🤝 贡献

欢迎贡献！请阅读 [贡献指南](CONTRIBUTING.md) 了解如何参与项目开发。

## 📄 许可证

本项目采用 [MIT 许可证](LICENSE)。

---

**感谢使用 Flutter Terminal Emulator！** 🎉

如果这个项目对你有帮助，请给我们一个 ⭐️
```

### 步骤 4: 上传构建产物（可选）

如果你有预编译的版本，可以在 Release 页面上传：

1. **准备构建产物**
```bash
# 运行发布脚本
./scripts/prepare_release.sh
```

2. **上传文件**
   - 在 Release 编辑页面
   - 拖拽文件到 "Attach binaries" 区域
   - 上传 `.tar.gz`、`.zip`、`.apk` 等文件

### 步骤 5: 发布 Release

1. **检查信息**
   - 确认标签版本正确
   - 检查描述内容完整
   - 验证上传的文件

2. **发布**
   - 勾选 "Set as the latest release"
   - 点击 "Publish release"

## 🔄 后续维护

### 更新版本

1. **更新代码**
```bash
# 修改 pubspec.yaml 中的版本号
# 更新 CHANGELOG.md
git add .
git commit -m "feat: update to v1.1.0"
git tag -a v1.1.0 -m "Release version 1.1.0"
git push origin main
git push origin v1.1.0
```

2. **创建新 Release**
   - 重复上述步骤 3-5

### 维护建议

- 定期更新依赖包
- 响应用户反馈和 Issue
- 维护文档的时效性
- 遵循语义化版本规范

## 📊 项目推广

### README 徽章

在 README.md 中添加状态徽章：

```markdown
![GitHub release](https://img.shields.io/github/v/release/YOUR_USERNAME/flutter-terminal-emulator)
![GitHub stars](https://img.shields.io/github/stars/YOUR_USERNAME/flutter-terminal-emulator)
![GitHub forks](https://img.shields.io/github/forks/YOUR_USERNAME/flutter-terminal-emulator)
![GitHub license](https://img.shields.io/github/license/YOUR_USERNAME/flutter-terminal-emulator)
```

### 社区分享

- 在 Flutter 社区分享
- 发布到 Reddit r/FlutterDev
- 分享到技术博客
- 提交到 awesome-flutter 列表

---

**祝你发布成功！** 🚀