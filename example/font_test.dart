import 'package:flutter/material.dart';

/// 字体测试页面
/// 用于测试 Nerd Font 的显示效果
class FontTestPage extends StatelessWidget {
  const FontTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('字体测试'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('基本文字测试', [
              'Hello World! 你好世界！',
              'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
              'abcdefghijklmnopqrstuvwxyz',
              '0123456789 +-*/=()[]{}',
              '中文测试：这是一段中文文本，用于测试字体的中文显示效果。',
              'English Test: This is an English text for font testing.',
            ]),
            
            _buildSection('编程符号测试', [
              '-> => != == <= >= && || ++ -- += -= *= /=',
              '{ } [ ] ( ) < > " \' ` ~ ! @ # \$ % ^ & *',
              '| \\ / ? : ; , . _ - + = 0 1 2 3 4 5 6 7 8 9',
            ]),
            
            _buildSection('Nerd Font 图标测试', [
              ' Git 分支   文件夹   文件',
              ' Dart   JavaScript   Python',
              ' Java   C++   HTML',
              ' CSS   JSON   Markdown',
              ' 图片   音频   视频',
              ' 压缩包   PDF   文本',
              ' 设置   搜索   下载',
              ' 成功   警告   错误',
            ]),
            
            _buildSection('终端符号测试', [
              '\$ ~/project > ls -la',
              'drwxr-xr-x  5 user group  160 Jan 20 12:00 .',
              'drwxr-xr-x 10 user group  320 Jan 20 11:00 ..',
              '-rw-r--r--  1 user group 1024 Jan 20 12:00  README.md',
              '-rwxr-xr-x  1 user group 2048 Jan 20 12:00  main.dart',
            ]),
            
            _buildSection('Unicode 符号测试', [
              '箭头: ← → ↑ ↓ ↖ ↗ ↘ ↙ ⇐ ⇒ ⇑ ⇓',
              '数学: ∑ ∏ ∫ ∂ ∆ ∇ ± × ÷ ≠ ≤ ≥ ≈ ∞',
              '几何: ○ ● ◯ ◉ □ ■ ▢ ▣ △ ▲ ▽ ▼',
              '星号: ★ ☆ ✦ ✧ ✩ ✪ ✫ ✬ ✭ ✮ ✯ ✰',
              '符号: ♠ ♣ ♥ ♦ ♪ ♫ ☀ ☁ ☂ ☃ ❄ ⚡',
            ]),
            
            _buildSection('连字测试 (如果支持)', [
              '== === != !== <= >= -> => |> <|',
              '&& || ++ -- += -= *= /= %= ^=',
              '<!-- --> /** */ // /* */ <-- -->',
              '::= := =:= =!= ==> <== <=> <->',
            ]),
            
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '字体信息',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '主字体: JetBrains Mono Nerd Font',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    '备用字体: Courier New, monospace',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    '字体大小: 14px',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    '行高: 1.2',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSection(String title, List<String> lines) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[700]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: lines.map((line) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                line,
                style: const TextStyle(
                  fontFamily: 'JetBrainsMonoNerdFont',
                  fontSize: 14,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
            )).toList(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

/// 字体测试应用
class FontTestApp extends StatelessWidget {
  const FontTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Test',
      theme: ThemeData.dark(),
      home: const FontTestPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const FontTestApp());
}