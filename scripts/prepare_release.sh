#!/bin/bash

# Flutter 终端模拟器发布准备脚本

set -e

echo "🚀 准备发布 Flutter 终端模拟器..."

# 检查 Git 状态
if [ -n "$(git status --porcelain)" ]; then
    echo "❌ 工作目录不干净，请先提交所有更改"
    exit 1
fi

# 获取版本号
VERSION=$(grep "version:" pubspec.yaml | sed 's/version: //' | sed 's/+.*//')
echo "📦 当前版本: $VERSION"

# 运行测试
echo "🧪 运行测试..."
flutter test

# 代码分析
echo "🔍 代码分析..."
flutter analyze

# 格式化代码
echo "✨ 格式化代码..."
dart format .

# 获取依赖
echo "📥 获取依赖..."
flutter pub get

# 构建不同平台版本
echo "🏗️ 构建应用..."

# Linux
if command -v flutter &> /dev/null; then
    echo "🐧 构建 Linux 版本..."
    flutter config --enable-linux-desktop
    flutter build linux --release
fi

# 创建发布目录
RELEASE_DIR="release/v$VERSION"
mkdir -p "$RELEASE_DIR"

# 复制构建产物
if [ -d "build/linux/x64/release/bundle" ]; then
    echo "📦 打包 Linux 版本..."
    tar -czf "$RELEASE_DIR/flutter-terminal-emulator-linux-v$VERSION.tar.gz" -C build/linux/x64/release/bundle .
fi

# 生成校验和
echo "🔐 生成校验和..."
cd "$RELEASE_DIR"
for file in *.tar.gz *.zip; do
    if [ -f "$file" ]; then
        sha256sum "$file" > "$file.sha256"
    fi
done
cd - > /dev/null

echo "✅ 发布准备完成！"
echo "📁 发布文件位于: $RELEASE_DIR"
echo ""
echo "下一步："
echo "1. 检查构建产物"
echo "2. 更新 CHANGELOG.md"
echo "3. 创建 Git 标签: git tag v$VERSION"
echo "4. 推送到 GitHub: git push origin v$VERSION"
echo "5. 在 GitHub 上创建 Release"