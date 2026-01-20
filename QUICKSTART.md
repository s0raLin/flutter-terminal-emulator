# 快速开始指南

## 5分钟上手 Flutter 终端模拟器

### 🚀 快速安装

1. **确保环境准备就绪**
```bash
flutter doctor
```

2. **获取项目**
```bash
git clone <your-repo-url>
cd flutter-terminal
```

3. **安装依赖**
```bash
flutter pub get
```

4. **运行应用**
```bash
flutter run
```

### 📱 第一次使用

启动应用后，你会看到一个黑色背景的终端界面，底部有一个输入框。

#### 尝试你的第一个命令
在输入框中输入 `help` 并按回车：
```
$ help
```

你会看到所有可用命令的列表。

### 🎯 基础命令演示

#### 1. 查看当前位置
```bash
pwd
```
显示当前工作目录的完整路径。

#### 2. 列出文件
```bash
ls
```
显示当前目录下的所有文件和文件夹，文件夹会有 📁 图标。

#### 3. 切换目录
```bash
cd Documents
cd ..          # 返回上级目录
cd /path/to/dir # 绝对路径
```

#### 4. 创建文件和目录
```bash
mkdir my_folder    # 创建目录
touch my_file.txt  # 创建文件
```

#### 5. 查看文件内容
```bash
cat my_file.txt
```

#### 6. 输出文本
```bash
echo "Hello, Flutter Terminal!"
```

### ⌨️ 快捷键

| 快捷键 | 功能 |
|--------|------|
| `↑` | 上一个历史命令 |
| `↓` | 下一个历史命令 |
| `Ctrl+C` | 中断当前输入 |
| `Enter` | 执行命令 |

### 🎨 个性化设置

1. 输入 `settings` 命令打开设置对话框
2. 调整字体大小（10-24px）
3. 选择你喜欢的文字颜色
4. 选择你喜欢的背景颜色
5. 点击"保存"应用设置

### 💡 实用技巧

#### 命令历史
- 使用上下箭头键快速访问之前执行的命令
- 输入 `history` 查看完整的命令历史

#### 系统命令
除了内置命令，你还可以执行系统命令：
```bash
git status
npm --version
python --version
flutter doctor
```

#### 文件操作
```bash
# 查看文件大小和类型
ls

# 创建多级目录
mkdir -p path/to/deep/directory

# 查看大文件（小心性能）
cat large_file.txt
```

### 🔧 常见问题

#### Q: 命令执行失败怎么办？
A: 检查命令是否正确拼写，确保系统中安装了相应的工具。

#### Q: 如何清空终端？
A: 输入 `clear` 命令。

#### Q: 如何退出应用？
A: 输入 `exit` 命令或使用系统返回键。

#### Q: 设置没有保存？
A: 确保在设置对话框中点击了"保存"按钮。

### 📚 进阶使用

#### 文件管理工作流
```bash
# 1. 查看当前位置
pwd

# 2. 列出内容
ls

# 3. 创建项目目录
mkdir my_project
cd my_project

# 4. 创建文件
touch README.md
touch main.dart

# 5. 查看结构
ls
```

#### 开发工作流
```bash
# 检查 Flutter 环境
flutter doctor

# 创建新项目
flutter create my_app
cd my_app

# 查看项目结构
ls

# 运行项目
flutter run
```

### 🎯 下一步

1. **探索更多命令**: 尝试 `help` 中列出的所有命令
2. **自定义界面**: 在设置中调整外观
3. **查看文档**: 阅读完整的 [README.md](README.md)
4. **了解开发**: 查看 [DEVELOPMENT.md](DEVELOPMENT.md)

### 🆘 获得帮助

- 📖 查看 [完整文档](README.md)
- 🔧 查看 [开发指南](DEVELOPMENT.md)
- 📚 查看 [API 参考](API_REFERENCE.md)
- 🐛 [报告问题](https://github.com/your-repo/issues)

---

**恭喜！** 你已经掌握了 Flutter 终端模拟器的基础使用。现在开始探索更多功能吧！ 🎉