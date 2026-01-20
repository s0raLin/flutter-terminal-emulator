#!/bin/bash

# 字体下载脚本
# 下载并配置 Nerd Font 字体

set -e

FONTS_DIR="assets/fonts"
TEMP_DIR="/tmp/nerd-fonts"

echo "🔤 开始下载 Nerd Font 字体..."

# 创建目录
mkdir -p "$FONTS_DIR"
mkdir -p "$TEMP_DIR"

# 下载 JetBrains Mono Nerd Font
echo "📥 下载 JetBrains Mono Nerd Font..."
if ! command -v wget &> /dev/null; then
    echo "❌ wget 未安装，请先安装 wget"
    exit 1
fi

# 下载字体
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip"
wget -O "$TEMP_DIR/JetBrainsMono.zip" "$FONT_URL"

# 解压字体
echo "📦 解压字体文件..."
unzip -q "$TEMP_DIR/JetBrainsMono.zip" -d "$TEMP_DIR/JetBrainsMono"

# 复制需要的字体文件
echo "📋 复制字体文件..."
cp "$TEMP_DIR/JetBrainsMono/JetBrainsMonoNerdFont-Regular.ttf" "$FONTS_DIR/"
cp "$TEMP_DIR/JetBrainsMono/JetBrainsMonoNerdFont-Bold.ttf" "$FONTS_DIR/"

# 清理临时文件
echo "🧹 清理临时文件..."
rm -rf "$TEMP_DIR"

echo "✅ 字体下载完成！"
echo "📁 字体文件位于: $FONTS_DIR"
echo ""
echo "下一步："
echo "1. 运行 'flutter pub get' 更新依赖"
echo "2. 重新启动应用以应用新字体"

# 列出下载的字体文件
echo ""
echo "📋 已下载的字体文件："
ls -la "$FONTS_DIR"/*.ttf 2>/dev/null || echo "请手动下载字体文件到 $FONTS_DIR 目录"