import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'package:process_run/shell.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(TerminalApp());
}

class TerminalApp extends StatelessWidget {
  const TerminalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Terminal',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(primary: Colors.green),
      ),
      home: const TerminalScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TerminalScreen extends StatefulWidget {
  const TerminalScreen({Key? key}) : super(key: key);

  @override
  State<TerminalScreen> createState() => _TerminalScreenState();
}

class _TerminalScreenState extends State<TerminalScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  
  final List<String> _output = [];
  final List<String> _commandHistory = [];
  int _historyIndex = -1;
  String _currentDirectory = '';
  Shell? _shell;
  
  // 终端配置
  double _fontSize = 14.0;
  Color _textColor = Colors.green;
  Color _backgroundColor = Colors.black;
  
  @override
  void initState() {
    super.initState();
    _initializeTerminal();
    _loadSettings();
  }
  
  void _initializeTerminal() async {
    _currentDirectory = Directory.current.path;
    _shell = Shell(workingDirectory: _currentDirectory);
    
    _output.add('Flutter Terminal v1.0');
    _output.add('Type "help" for available commands');
    _output.add(_getPrompt());
    
    setState(() {});
    
    // 自动聚焦输入框
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }
  
  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('fontSize') ?? 14.0;
      _textColor = Color(prefs.getInt('textColor') ?? Colors.green.value);
      _backgroundColor = Color(prefs.getInt('backgroundColor') ?? Colors.black.value);
    });
  }
  
  void _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', _fontSize);
    await prefs.setInt('textColor', _textColor.value);
    await prefs.setInt('backgroundColor', _backgroundColor.value);
  }
  
  String _getPrompt() {
    final currentDir = path.basename(_currentDirectory);
    return '\$ $currentDir > ';
  }
  
  void _executeCommand(String command) async {
    if (command.trim().isEmpty) return;
    
    // 添加到历史记录
    _commandHistory.add(command);
    _historyIndex = _commandHistory.length;
    
    // 显示命令
    _output.add('${_getPrompt()}$command');
    
    try {
      await _processCommand(command.trim());
    } catch (e) {
      _output.add('Error: $e');
    }
    
    _output.add('${_getPrompt()}');
    _controller.clear();
    setState(() {});
    _scrollToBottom();
  }
  
  Future<void> _processCommand(String command) async {
    final parts = command.split(' ');
    final cmd = parts[0].toLowerCase();
    final args = parts.length > 1 ? parts.sublist(1) : <String>[];
    
    switch (cmd) {
      case 'help':
        _showHelp();
        break;
      case 'clear':
        _output.clear();
        break;
      case 'pwd':
        _output.add(_currentDirectory);
        break;
      case 'ls':
      case 'dir':
        await _listDirectory(args);
        break;
      case 'cd':
        await _changeDirectory(args);
        break;
      case 'mkdir':
        await _createDirectory(args);
        break;
      case 'touch':
        await _createFile(args);
        break;
      case 'cat':
        await _showFileContent(args);
        break;
      case 'echo':
        _output.add(args.join(' '));
        break;
      case 'history':
        _showHistory();
        break;
      case 'settings':
        _showSettings();
        break;
      case 'exit':
        SystemNavigator.pop();
        break;
      default:
        await _executeSystemCommand(command);
    }
  }
  
  void _showHelp() {
    _output.addAll([
      '可用命令:',
      '  help      - 显示此帮助信息',
      '  clear     - 清空终端',
      '  pwd       - 显示当前目录',
      '  ls/dir    - 列出目录内容',
      '  cd <dir>  - 切换目录',
      '  mkdir <name> - 创建目录',
      '  touch <file> - 创建文件',
      '  cat <file>   - 显示文件内容',
      '  echo <text>  - 输出文本',
      '  history   - 显示命令历史',
      '  settings  - 显示设置选项',
      '  exit      - 退出应用',
      '',
      '快捷键:',
      '  Ctrl+C    - 中断当前命令',
      '  ↑/↓       - 浏览命令历史',
      '  Tab       - 自动补全(开发中)',
    ]);
  }
  
  Future<void> _listDirectory(List<String> args) async {
    try {
      final dir = args.isEmpty ? _currentDirectory : args[0];
      final directory = Directory(path.isAbsolute(dir) ? dir : path.join(_currentDirectory, dir));
      
      if (!await directory.exists()) {
        _output.add('目录不存在: $dir');
        return;
      }
      
      final entities = await directory.list().toList();
      entities.sort((a, b) => a.path.compareTo(b.path));
      
      for (final entity in entities) {
        final name = path.basename(entity.path);
        if (entity is Directory) {
          _output.add('📁 $name/');
        } else {
          final stat = await entity.stat();
          final size = _formatFileSize(stat.size);
          _output.add('📄 $name ($size)');
        }
      }
    } catch (e) {
      _output.add('错误: $e');
    }
  }
  
  Future<void> _changeDirectory(List<String> args) async {
    if (args.isEmpty) {
      _output.add('用法: cd <目录>');
      return;
    }
    
    try {
      String newPath;
      if (args[0] == '..') {
        newPath = path.dirname(_currentDirectory);
      } else if (path.isAbsolute(args[0])) {
        newPath = args[0];
      } else {
        newPath = path.join(_currentDirectory, args[0]);
      }
      
      final directory = Directory(newPath);
      if (await directory.exists()) {
        _currentDirectory = newPath;
        _shell = Shell(workingDirectory: _currentDirectory);
      } else {
        _output.add('目录不存在: ${args[0]}');
      }
    } catch (e) {
      _output.add('错误: $e');
    }
  }
  
  Future<void> _createDirectory(List<String> args) async {
    if (args.isEmpty) {
      _output.add('用法: mkdir <目录名>');
      return;
    }
    
    try {
      final dirPath = path.join(_currentDirectory, args[0]);
      await Directory(dirPath).create(recursive: true);
      _output.add('目录已创建: ${args[0]}');
    } catch (e) {
      _output.add('错误: $e');
    }
  }
  
  Future<void> _createFile(List<String> args) async {
    if (args.isEmpty) {
      _output.add('用法: touch <文件名>');
      return;
    }
    
    try {
      final filePath = path.join(_currentDirectory, args[0]);
      await File(filePath).create();
      _output.add('文件已创建: ${args[0]}');
    } catch (e) {
      _output.add('错误: $e');
    }
  }
  
  Future<void> _showFileContent(List<String> args) async {
    if (args.isEmpty) {
      _output.add('用法: cat <文件名>');
      return;
    }
    
    try {
      final filePath = path.join(_currentDirectory, args[0]);
      final file = File(filePath);
      
      if (!await file.exists()) {
        _output.add('文件不存在: ${args[0]}');
        return;
      }
      
      final content = await file.readAsString();
      _output.addAll(content.split('\n'));
    } catch (e) {
      _output.add('错误: $e');
    }
  }
  
  void _showHistory() {
    if (_commandHistory.isEmpty) {
      _output.add('命令历史为空');
      return;
    }
    
    for (int i = 0; i < _commandHistory.length; i++) {
      _output.add('${i + 1}: ${_commandHistory[i]}');
    }
  }
  
  void _showSettings() {
    _showSettingsDialog();
  }
  
  Future<void> _executeSystemCommand(String command) async {
    try {
      final result = await _shell!.run(command);
      for (final line in result.outText.split('\n')) {
        if (line.isNotEmpty) _output.add(line);
      }
      if (result.errText.isNotEmpty) {
        for (final line in result.errText.split('\n')) {
          if (line.isNotEmpty) _output.add('Error: $line');
        }
      }
    } catch (e) {
      _output.add('命令未找到或执行失败: $command');
    }
  }
  
  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '${bytes}B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)}KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)}MB';
  }
  
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      }
    });
  }
  
  void _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        _navigateHistory(-1);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        _navigateHistory(1);
      } else if (HardwareKeyboard.instance.isControlPressed && event.logicalKey == LogicalKeyboardKey.keyC) {
        _controller.clear();
        _output.add('^C');
        _output.add(_getPrompt());
        setState(() {});
      }
    }
  }
  
  void _navigateHistory(int direction) {
    if (_commandHistory.isEmpty) return;
    
    _historyIndex += direction;
    _historyIndex = _historyIndex.clamp(-1, _commandHistory.length - 1);
    
    if (_historyIndex >= 0 && _historyIndex < _commandHistory.length) {
      _controller.text = _commandHistory[_historyIndex];
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    } else {
      _controller.clear();
    }
  }
  
  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('终端设置'),
        content: StatefulBuilder(
          builder: (context, setDialogState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('字体大小'),
                subtitle: Slider(
                  value: _fontSize,
                  min: 10.0,
                  max: 24.0,
                  divisions: 14,
                  label: _fontSize.round().toString(),
                  onChanged: (value) {
                    setDialogState(() => _fontSize = value);
                  },
                ),
              ),
              ListTile(
                title: Text('文字颜色'),
                trailing: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: _textColor,
                    border: Border.all(color: Colors.white),
                  ),
                ),
                onTap: () => _showColorPicker(true, setDialogState),
              ),
              ListTile(
                title: Text('背景颜色'),
                trailing: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: _backgroundColor,
                    border: Border.all(color: Colors.white),
                  ),
                ),
                onTap: () => _showColorPicker(false, setDialogState),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('取消'),
          ),
          TextButton(
            onPressed: () {
              setState(() {});
              _saveSettings();
              Navigator.pop(context);
            },
            child: Text('保存'),
          ),
        ],
      ),
    );
  }
  
  void _showColorPicker(bool isTextColor, StateSetter setDialogState) {
    final colors = [
      Colors.green, Colors.blue, Colors.red, Colors.yellow,
      Colors.purple, Colors.orange, Colors.cyan, Colors.white,
      Colors.black, Colors.grey,
    ];
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isTextColor ? '选择文字颜色' : '选择背景颜色'),
        content: Wrap(
          children: colors.map((color) => GestureDetector(
            onTap: () {
              setDialogState(() {
                if (isTextColor) {
                  _textColor = color;
                } else {
                  _backgroundColor = color;
                }
              });
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          )).toList(),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: Text('Flutter Terminal'),
        backgroundColor: _backgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _showSettings,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: KeyboardListener(
                focusNode: FocusNode(),
                onKeyEvent: _handleKeyEvent,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _output.length,
                  itemBuilder: (context, index) {
                    return SelectableText(
                      _output[index],
                      style: TextStyle(
                        fontFamily: 'Courier',
                        fontSize: _fontSize,
                        color: _textColor,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              children: [
                Text(
                  _getPrompt(),
                  style: TextStyle(
                    fontFamily: 'Courier',
                    fontSize: _fontSize,
                    color: _textColor,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    style: TextStyle(
                      fontFamily: 'Courier',
                      fontSize: _fontSize,
                      color: _textColor,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    onSubmitted: _executeCommand,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
