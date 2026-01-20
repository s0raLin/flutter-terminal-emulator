# 字体文件说明

## Nerd Font 配置

为了正确显示中文和各种符号，本项目配置了 Nerd Font 支持。

### 推荐字体

1. **JetBrains Mono Nerd Font** (推荐)
   - 下载地址: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
   - 特点: 专为编程设计，支持连字，中文显示良好

2. **Fira Code Nerd Font**
   - 下载地址: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
   - 特点: 优秀的连字支持，图标丰富

3. **Source Code Pro Nerd Font**
   - 下载地址: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/SourceCodePro.zip
   - 特点: Adobe 开源字体，可读性强

### 安装步骤

1. 下载字体文件到 `assets/fonts/` 目录
2. 解压字体文件
3. 选择需要的字体文件（通常选择 Regular 和 Bold）
4. 更新 `pubspec.yaml` 配置

### 字体文件命名规范

- `JetBrainsMonoNerdFont-Regular.ttf` - 常规字体
- `JetBrainsMonoNerdFont-Bold.ttf` - 粗体字体
- `JetBrainsMonoNerdFont-Italic.ttf` - 斜体字体
- `JetBrainsMonoNerdFont-BoldItalic.ttf` - 粗斜体字体

### 支持的符号

Nerd Font 包含以下图标集：
- Font Awesome
- Material Design Icons
- Weather Icons
- Devicons
- Octicons
- Font Linux
- Powerline Symbols
- 等等...

### 中文支持

为了更好地支持中文显示，建议：
1. 使用 Nerd Font 作为主字体
2. 系统会自动回退到系统中文字体
3. 确保系统安装了中文字体（如思源黑体、微软雅黑等）