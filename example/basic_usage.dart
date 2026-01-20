import 'package:flutter/material.dart';
import 'package:cli/main.dart';

/// 基础使用示例
/// 
/// 这个示例展示了如何使用 Flutter 终端模拟器的基本功能
void main() {
  runApp(TerminalExampleApp());
}

class TerminalExampleApp extends StatelessWidget {
  const TerminalExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Terminal Example',
      theme: ThemeData.dark(),
      home: const TerminalExampleScreen(),
    );
  }
}

class TerminalExampleScreen extends StatelessWidget {
  const TerminalExampleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('终端模拟器示例'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '欢迎使用 Flutter 终端模拟器！',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 8),
                Text('尝试以下命令：'),
                SizedBox(height: 8),
                _buildCommandExample('help', '显示所有可用命令'),
                _buildCommandExample('pwd', '显示当前目录'),
                _buildCommandExample('ls', '列出文件和目录'),
                _buildCommandExample('cd ..', '返回上级目录'),
                _buildCommandExample('echo "Hello World"', '输出文本'),
                _buildCommandExample('history', '查看命令历史'),
                _buildCommandExample('settings', '打开设置'),
              ],
            ),
          ),
          Expanded(
            child: const TerminalScreen(),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCommandExample(String command, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              command,
              style: const TextStyle(
                fontFamily: 'Courier',
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(' - $description'),
        ],
      ),
    );
  }
}