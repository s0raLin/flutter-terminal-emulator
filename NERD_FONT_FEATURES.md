# 🎨 Nerd Font 功能特性

## 功能概述

Flutter 终端模拟器现在完全支持 Nerd Font，提供丰富的视觉体验和更好的中文显示。

## ✨ 主要特性

### 🔤 字体支持
- **JetBrains Mono Nerd Font**: 主要字体，包含丰富的编程图标
- **系统等宽字体**: 备用字体，确保兼容性
- **智能回退**: 当 Nerd Font 不可用时自动使用文本标识符

### 🎯 文件图标
| 文件类型 | Nerd Font 图标 | 文本回退 | 扩展名 |
|---------|---------------|----------|--------|
| Dart | `` | [DART] | .dart |
| JavaScript | `` | [JS] | .js, .ts |
| Python | `` | [PY] | .py |
| Java | `` | [JAVA] | .java |
| C/C++ | `` | [C++] | .c, .cpp |
| HTML | `` | [HTML] | .html |
| CSS | `` | [CSS] | .css |
| JSON | `` | [JSON] | .json |
| Markdown | `` | [MD] | .md |
| 图片 | `` | [IMG] | .png, .jpg, .gif |
| 压缩包 | `` | [ZIP] | .zip, .tar, .gz |
| PDF | `` | [PDF] | .pdf |
| 文本 | `` | [TXT] | .txt |
| 目录 | `` | [DIR] | 目录 |

### 🌐 中文优化
- **字体回退**: 自动回退到系统中文字体
- **行高调整**: 1.2倍行高，改善中英文混排
- **字符间距**: 优化的字符间距设置
- **显示测试**: 内置字体测试页面

### ⚙️ 自定义选项
- **字体选择**: 在设置中选择不同字体
- **字体大小**: 10-24px 可调节
- **实时预览**: 设置对话框中的字体预览
- **持久化**: 设置自动保存到本地

## 🚀 使用方法

### 快速设置
```bash
# 1. 下载字体
./scripts/download_fonts.sh

# 2. 运行应用
flutter run

# 3. 在应用中输入 settings 调整字体
```

### 手动设置
1. 下载 JetBrains Mono Nerd Font
2. 复制字体文件到 `assets/fonts/`
3. 重新运行应用

### 测试字体
```bash
# 运行字体测试页面
flutter run example/font_test.dart
```

## 📱 平台兼容性

### ✅ 完全支持
- **Linux**: 完整的 Nerd Font 支持
- **Windows**: 完整的 Nerd Font 支持
- **macOS**: 完整的 Nerd Font 支持

### ⚠️ 部分支持
- **Android**: 支持 Nerd Font，但某些图标可能显示异常
- **iOS**: 支持 Nerd Font，需要额外配置

### 🌐 Web 支持
- 需要网络加载字体文件
- 部分图标可能不显示
- 中文支持良好

## 🎨 视觉效果

### 使用 Nerd Font
```
$ project > ls
 documents/
 main.dart (2.5KB)
 config.json (1.2KB)
 README.md (3.8KB)
 image.png (156KB)
```

### 使用系统字体
```
$ project > ls
[DIR] documents/
[DART] main.dart (2.5KB)
[JSON] config.json (1.2KB)
[MD] README.md (3.8KB)
[IMG] image.png (156KB)
```

## 🔧 技术实现

### FontHelper 类
- 字体可用性检测
- 智能图标选择
- 回退机制管理

### 字体配置
```yaml
fonts:
  - family: JetBrainsMonoNerdFont
    fonts:
      - asset: assets/fonts/JetBrainsMonoNerdFont-Regular.ttf
        weight: 400
      - asset: assets/fonts/JetBrainsMonoNerdFont-Bold.ttf
        weight: 700
```

### 代码示例
```dart
// 获取有效字体
String effectiveFont = FontHelper.getEffectiveFontFamily(preferredFont);

// 获取文件图标
String icon = FontHelper.getFileIcon('.dart', effectiveFont);

// 使用字体
TextStyle(
  fontFamily: effectiveFont,
  fontSize: 14.0,
  height: 1.2,
)
```

## 📚 相关文档

- [字体设置指南](FONT_SETUP.md) - 详细配置说明
- [快速设置](FONT_QUICK_SETUP.md) - 简化设置步骤
- [字体测试](example/font_test.dart) - 测试页面代码

## 🎯 最佳实践

### 开发建议
1. **优先使用 Nerd Font**: 提供最佳视觉体验
2. **提供回退方案**: 确保在任何环境下都能正常显示
3. **测试多平台**: 验证不同平台的字体效果
4. **优化性能**: 避免使用过大的字体文件

### 用户建议
1. **安装推荐字体**: 获得最佳体验
2. **调整字体大小**: 根据屏幕和偏好调整
3. **测试显示效果**: 使用字体测试页面验证
4. **定期更新**: 保持字体文件最新

## 🔮 未来计划

### v1.1 改进
- [ ] 更多文件类型图标
- [ ] 自定义图标主题
- [ ] 字体子集优化
- [ ] 更好的中文字体集成

### v1.2 功能
- [ ] 动态字体加载
- [ ] 在线字体库
- [ ] 字体效果预览
- [ ] 高级排版选项

---

## 🎉 总结

通过 Nerd Font 支持，Flutter 终端模拟器现在提供：

- ✅ **丰富的视觉效果**: 文件类型图标和符号
- ✅ **优秀的中文支持**: 优化的中文显示
- ✅ **智能回退机制**: 确保兼容性
- ✅ **跨平台一致性**: 统一的视觉体验
- ✅ **用户可定制**: 灵活的字体选项

享受更美观、更实用的终端体验！ 🚀