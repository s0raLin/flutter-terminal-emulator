# API 参考文档

## 核心类和方法

### TerminalScreen

主要的终端界面组件，继承自 `StatefulWidget`。

#### 构造函数
```dart
TerminalScreen({Key? key}) : super(key: key);
```

#### 主要属性

| 属性名 | 类型 | 描述 |
|--------|------|------|
| `_output` | `List<String>` | 终端输出历史 |
| `_commandHistory` | `List<String>` | 命令执行历史 |
| `_currentDirectory` | `String` | 当前工作目录 |
| `_shell` | `Shell?` | 系统命令执行器 |
| `_fontSize` | `double` | 字体大小 |
| `_textColor` | `Color` | 文字颜色 |
| `_backgroundColor` | `Color` | 背景颜色 |

#### 核心方法

##### `_executeCommand(String command)`
执行用户输入的命令。

**参数:**
- `command`: 要执行的命令字符串

**返回值:** `void`

**示例:**
```dart
await _executeCommand('ls -la');
```

##### `_processCommand(String command)`
处理内置命令的核心方法。

**参数:**
- `command`: 已清理的命令字符串

**返回值:** `Future<void>`

**支持的内置命令:**
- `help` - 显示帮助信息
- `clear` - 清空终端
- `pwd` - 显示当前目录
- `ls` / `dir` - 列出目录内容
- `cd` - 切换目录
- `mkdir` - 创建目录
- `touch` - 创建文件
- `cat` - 显示文件内容
- `echo` - 输出文本
- `history` - 显示命令历史
- `settings` - 打开设置
- `exit` - 退出应用

##### `_executeSystemCommand(String command)`
执行系统命令。

**参数:**
- `command`: 系统命令字符串

**返回值:** `Future<void>`

**异常:**
- 命令不存在时抛出异常并显示错误信息

##### `_listDirectory(List<String> args)`
列出目录内容的实现。

**参数:**
- `args`: 命令参数列表，可选目录路径

**返回值:** `Future<void>`

**功能:**
- 显示文件和目录
- 显示文件大小
- 区分文件和目录（使用图标）

##### `_changeDirectory(List<String> args)`
切换工作目录。

**参数:**
- `args`: 目录路径参数

**返回值:** `Future<void>`

**特殊路径:**
- `..` - 上级目录
- 绝对路径 - 直接切换
- 相对路径 - 相对于当前目录

##### `_createDirectory(List<String> args)`
创建新目录。

**参数:**
- `args`: 目录名称参数

**返回值:** `Future<void>`

**功能:**
- 支持递归创建目录
- 自动处理路径

##### `_createFile(List<String> args)`
创建新文件。

**参数:**
- `args`: 文件名称参数

**返回值:** `Future<void>`

##### `_showFileContent(List<String> args)`
显示文件内容。

**参数:**
- `args`: 文件路径参数

**返回值:** `Future<void>`

**限制:**
- 仅支持文本文件
- 大文件可能影响性能

##### `_navigateHistory(int direction)`
浏览命令历史。

**参数:**
- `direction`: 方向，-1 为向上，1 为向下

**返回值:** `void`

##### `_handleKeyEvent(RawKeyEvent event)`
处理键盘事件。

**参数:**
- `event`: 键盘事件对象

**返回值:** `void`

**支持的快捷键:**
- `↑` - 上一个历史命令
- `↓` - 下一个历史命令
- `Ctrl+C` - 中断当前输入

##### `_loadSettings()` / `_saveSettings()`
加载和保存用户设置。

**返回值:** `Future<void>`

**存储的设置:**
- 字体大小
- 文字颜色
- 背景颜色

## 工具函数

### `_getPrompt()`
生成命令提示符。

**返回值:** `String`

**格式:** `$ {当前目录名} > `

### `_formatFileSize(int bytes)`
格式化文件大小显示。

**参数:**
- `bytes`: 文件大小（字节）

**返回值:** `String`

**格式:**
- < 1KB: "XXXb"
- < 1MB: "XX.XKB"
- >= 1MB: "XX.XMB"

### `_scrollToBottom()`
滚动到输出底部。

**返回值:** `void`

**实现:** 使用 `ScrollController` 动画滚动

## 设置管理

### SharedPreferences 键值

| 键名 | 类型 | 默认值 | 描述 |
|------|------|--------|------|
| `fontSize` | `double` | `14.0` | 终端字体大小 |
| `textColor` | `int` | `Colors.green.value` | 文字颜色值 |
| `backgroundColor` | `int` | `Colors.black.value` | 背景颜色值 |

### 设置对话框

#### `_showSettingsDialog()`
显示设置配置对话框。

**功能:**
- 字体大小滑块调节
- 颜色选择器
- 实时预览
- 设置保存

#### `_showColorPicker(bool isTextColor, StateSetter setDialogState)`
显示颜色选择器。

**参数:**
- `isTextColor`: 是否为文字颜色选择
- `setDialogState`: 对话框状态更新函数

**预设颜色:**
- 绿色、蓝色、红色、黄色
- 紫色、橙色、青色、白色
- 黑色、灰色

## 错误处理

### 异常类型

#### 文件系统异常
- 文件/目录不存在
- 权限不足
- 路径无效

#### 命令执行异常
- 命令不存在
- 参数错误
- 系统错误

#### 设置存储异常
- 存储空间不足
- 权限问题

### 错误显示格式
```
Error: {错误描述}
```

## 性能考虑

### 内存管理
- 输出历史限制：建议最大 1000 行
- 命令历史限制：建议最大 100 条
- 及时释放大文件内容

### 响应性优化
- 异步命令执行
- UI 更新批处理
- 长时间操作的进度指示

### 滚动性能
- 使用 `ListView.builder` 虚拟滚动
- 避免一次性渲染大量内容

## 扩展接口

### 自定义命令添加

1. 在 `_processCommand` 中添加新的 case
2. 实现对应的处理方法
3. 更新帮助信息

**示例:**
```dart
case 'mycommand':
  await _handleMyCommand(args);
  break;

Future<void> _handleMyCommand(List<String> args) async {
  // 自定义逻辑
  _output.add('自定义命令执行结果');
}
```

### 主题扩展

**自定义主题结构:**
```dart
class CustomTheme {
  final Color backgroundColor;
  final Color textColor;
  final Color promptColor;
  final Color errorColor;
  final double fontSize;
  final String fontFamily;
}
```

### 插件接口（计划中）

```dart
abstract class TerminalPlugin {
  String get name;
  List<String> get commands;
  Future<String> executeCommand(String command, List<String> args);
}
```

## 平台特定 API

### Android
- 文件权限检查
- 外部存储访问
- 系统命令限制

### iOS
- 沙盒限制
- 文件访问权限
- 系统命令限制

### Desktop (Windows/macOS/Linux)
- 完整文件系统访问
- 系统命令支持
- 管理员权限处理

## 调试 API

### 日志记录
```dart
void _debugLog(String message) {
  if (kDebugMode) {
    print('Terminal: $message');
  }
}
```

### 性能监控
```dart
void _measurePerformance(String operation, Function() callback) {
  final stopwatch = Stopwatch()..start();
  callback();
  stopwatch.stop();
  _debugLog('$operation took ${stopwatch.elapsedMilliseconds}ms');
}
```

## 版本兼容性

### Flutter SDK
- 最低版本：3.10.1
- 推荐版本：最新稳定版

### Dart SDK
- 最低版本：3.0.0
- 空安全支持：必需

### 依赖包版本
- `process_run`: ^0.14.2
- `path`: ^1.8.3
- `shared_preferences`: ^2.2.2

## 已知限制

1. **文件大小限制**: 大文件显示可能影响性能
2. **命令执行**: 某些系统命令可能受平台限制
3. **权限**: 移动平台文件访问受限
4. **并发**: 不支持同时执行多个命令
5. **编码**: 仅支持 UTF-8 文本文件

## 未来 API 计划

### v1.1
- 标签页支持 API
- 命令自动补全 API
- 语法高亮 API

### v1.2
- 插件系统 API
- 自定义命令别名 API
- 脚本执行 API

### v2.0
- 图形文件管理器 API
- 内置编辑器 API
- Git 集成 API

---

此 API 文档提供了完整的接口说明，帮助开发者理解和使用终端模拟器的各项功能。