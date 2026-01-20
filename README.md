# Flutter 终端模拟器

一个使用 Flutter 开发的跨平台终端模拟器应用，支持基本的文件系统操作和系统命令执行。

## 功能特性

### 🚀 核心功能
- **命令执行**: 支持内置命令和系统命令
- **文件系统操作**: 浏览、创建、删除文件和目录
- **命令历史**: 使用上下箭头键浏览历史命令
- **自动补全**: 支持路径和命令自动补全（开发中）
- **多平台支持**: Android、iOS、Windows、macOS、Linux

### 🎨 界面特性
- **可自定义主题**: 支持字体大小、文字颜色、背景颜色调整
- **Nerd Font 支持**: 丰富的编程图标和符号显示
- **中文优化**: 优秀的中文和多语言显示支持
- **响应式设计**: 适配不同屏幕尺寸
- **键盘快捷键**: 支持 Ctrl+C 中断、方向键历史浏览
- **滚动输出**: 自动滚动到最新输出

### 📁 支持的命令

#### 内置命令
| 命令 | 描述 | 用法示例 |
|------|------|----------|
| `help` | 显示帮助信息 | `help` |
| `clear` | 清空终端屏幕 | `clear` |
| `pwd` | 显示当前工作目录 | `pwd` |
| `ls` / `dir` | 列出目录内容 | `ls`, `ls /path` |
| `cd` | 切换目录 | `cd /path`, `cd ..` |
| `mkdir` | 创建目录 | `mkdir newdir` |
| `touch` | 创建文件 | `touch newfile.txt` |
| `cat` | 显示文件内容 | `cat file.txt` |
| `echo` | 输出文本 | `echo "Hello World"` |
| `history` | 显示命令历史 | `history` |
| `settings` | 打开设置对话框 | `settings` |
| `exit` | 退出应用 | `exit` |

#### 系统命令
支持执行系统原生命令，如：
- `git status`
- `npm install`
- `python --version`
- `flutter doctor`

## 安装和运行

### 环境要求
- Flutter SDK 3.0.1 或更高版本
- Dart SDK 3.0.1 或更高版本
- 对应平台的开发环境

### 字体设置（推荐）
为了获得最佳的显示效果，建议配置 Nerd Font：

```bash
# 自动下载字体（推荐）
./scripts/download_fonts.sh

# 或手动下载
# 1. 访问 https://github.com/ryanoasis/nerd-fonts/releases
# 2. 下载 JetBrainsMono.zip
# 3. 解压并复制字体文件到 assets/fonts/ 目录
```

详细字体配置请参考 [字体设置指南](FONT_SETUP.md) 或 [快速设置](FONT_QUICK_SETUP.md)。
- Dart SDK
- 对应平台的开发环境

### 依赖包
```yaml
dependencies:
  flutter:
    sdk: flutter
  process_run: ^0.14.2  # 系统命令执行
  path: ^1.8.3          # 路径操作
  shared_preferences: ^2.2.2  # 设置存储
```

### 安装步骤

1. **克隆项目**
```bash
git clone <repository-url>
cd flutter-terminal
```

2. **设置字体（推荐）**
```bash
# 自动下载 Nerd Font 字体
./scripts/download_fonts.sh
```

3. **安装依赖**
```bash
flutter pub get
```

4. **运行应用**
```bash
# 调试模式
flutter run

# 发布模式
flutter run --release
```

### 平台特定配置

#### Android
- 最低 API 级别: 21 (Android 5.0)
- 需要文件系统访问权限

#### iOS
- 最低版本: iOS 11.0
- 需要在 Info.plist 中配置文件访问权限

#### Desktop (Windows/macOS/Linux)
- 需要启用桌面支持
```bash
flutter config --enable-windows-desktop
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop
```

## 项目结构

```
lib/
├── main.dart              # 应用入口和主要逻辑
├── models/               # 数据模型（计划中）
├── widgets/              # 自定义组件（计划中）
├── services/             # 服务层（计划中）
└── utils/                # 工具函数（计划中）
```

## 开发指南

### 添加新命令

1. 在 `_processCommand` 方法中添加新的 case：
```dart
case 'newcommand':
  await _handleNewCommand(args);
  break;
```

2. 实现命令处理方法：
```dart
Future<void> _handleNewCommand(List<String> args) async {
  // 命令逻辑实现
  _output.add('命令执行结果');
}
```

3. 在 `_showHelp` 方法中添加帮助信息。

### 自定义主题

应用支持运行时主题自定义：
- 字体大小：10-24px
- 文字颜色：预设颜色选择
- 背景颜色：预设颜色选择

设置会自动保存到本地存储。

### 键盘快捷键

| 快捷键 | 功能 |
|--------|------|
| `↑` / `↓` | 浏览命令历史 |
| `Ctrl+C` | 中断当前输入 |
| `Enter` | 执行命令 |
| `Tab` | 自动补全（开发中） |

## API 参考

### 核心类

#### `TerminalScreen`
主要的终端界面组件，包含所有终端功能。

**主要方法：**
- `_executeCommand(String command)`: 执行命令
- `_processCommand(String command)`: 处理内置命令
- `_executeSystemCommand(String command)`: 执行系统命令

#### 配置管理
使用 `SharedPreferences` 存储用户设置：
- `fontSize`: 字体大小
- `textColor`: 文字颜色
- `backgroundColor`: 背景颜色

## 性能优化

### 内存管理
- 限制输出历史长度，避免内存溢出
- 及时释放不需要的资源
- 使用 ListView.builder 优化长列表渲染

### 响应性
- 异步执行系统命令，避免 UI 阻塞
- 使用 FutureBuilder 处理异步操作
- 实现命令执行取消机制

## 故障排除

### 常见问题

1. **命令执行失败**
   - 检查命令是否存在于系统 PATH 中
   - 确认应用有足够的权限执行命令

2. **文件访问权限错误**
   - 检查平台特定的权限配置
   - 确认目标文件/目录的访问权限

3. **界面响应缓慢**
   - 检查是否有长时间运行的命令
   - 考虑限制输出内容的长度

### 调试技巧

1. **启用详细日志**
```dart
// 在 main() 函数中添加
debugPrint('Terminal Debug: $message');
```

2. **性能分析**
```bash
flutter run --profile
```

3. **内存分析**
```bash
flutter run --debug
# 然后在 DevTools 中查看内存使用情况
```

## 贡献指南

### 开发流程
1. Fork 项目
2. 创建功能分支
3. 提交更改
4. 创建 Pull Request

### 代码规范
- 遵循 Dart 官方代码风格
- 使用有意义的变量和方法名
- 添加必要的注释和文档
- 编写单元测试

### 测试
```bash
# 运行测试
flutter test

# 生成测试覆盖率报告
flutter test --coverage
```

## 路线图

### v1.1 计划功能
- [ ] 标签页支持（多终端会话）
- [ ] 命令自动补全
- [ ] 语法高亮
- [ ] 文件编辑器集成
- [ ] SSH 连接支持

### v1.2 计划功能
- [ ] 插件系统
- [ ] 自定义命令别名
- [ ] 脚本执行支持
- [ ] 终端录制和回放

### v2.0 计划功能
- [ ] 图形界面文件管理器
- [ ] 内置代码编辑器
- [ ] Git 集成
- [ ] 包管理器集成

## 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 联系方式

- 项目主页: [GitHub Repository]
- 问题反馈: [GitHub Issues]
- 邮箱: [your-email@example.com]

---

**注意**: 这是一个开发中的项目，某些功能可能还不完善。欢迎贡献代码和反馈问题！