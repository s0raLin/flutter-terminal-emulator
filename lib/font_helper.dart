/// 字体帮助类
/// 提供字体回退和图标支持
class FontHelper {
  // 可用的字体列表
  static const List<String> availableFonts = [
    'JetBrainsMonoNerdFont',
    'monospace',
  ];
  
  // 检查字体是否可用
  static bool isFontAvailable(String fontFamily) {
    return availableFonts.contains(fontFamily);
  }
  
  // 获取有效的字体名称
  static String getEffectiveFontFamily(String preferredFont) {
    if (isFontAvailable(preferredFont)) {
      return preferredFont;
    }
    return 'monospace'; // 回退到系统等宽字体
  }
  
  // 获取文件图标（如果支持 Nerd Font）
  static String getFileIcon(String extension, String fontFamily) {
    // 只有在使用 Nerd Font 时才返回图标
    if (fontFamily != 'JetBrainsMonoNerdFont') {
      return _getSimpleFileIcon(extension);
    }
    
    // Nerd Font 图标
    switch (extension.toLowerCase()) {
      case '.dart':
        return ''; // Dart 图标
      case '.js':
      case '.ts':
        return ''; // JavaScript/TypeScript 图标
      case '.py':
        return ''; // Python 图标
      case '.java':
        return ''; // Java 图标
      case '.cpp':
      case '.c':
        return ''; // C/C++ 图标
      case '.html':
        return ''; // HTML 图标
      case '.css':
        return ''; // CSS 图标
      case '.json':
        return ''; // JSON 图标
      case '.xml':
        return ''; // XML 图标
      case '.md':
        return ''; // Markdown 图标
      case '.txt':
        return ''; // 文本文件图标
      case '.pdf':
        return ''; // PDF 图标
      case '.zip':
      case '.tar':
      case '.gz':
        return ''; // 压缩文件图标
      case '.png':
      case '.jpg':
      case '.jpeg':
      case '.gif':
        return ''; // 图片文件图标
      case '.mp3':
      case '.wav':
        return ''; // 音频文件图标
      case '.mp4':
      case '.avi':
        return ''; // 视频文件图标
      case '.exe':
        return ''; // 可执行文件图标
      case '.sh':
        return ''; // Shell 脚本图标
      case '.yml':
      case '.yaml':
        return ''; // YAML 文件图标
      default:
        return ''; // 默认文件图标
    }
  }
  
  // 获取目录图标
  static String getDirectoryIcon(String fontFamily) {
    if (fontFamily == 'JetBrainsMonoNerdFont') {
      return '';
    }
    return '[DIR]';
  }
  
  // 简单的文件图标（不使用 Nerd Font 时）
  static String _getSimpleFileIcon(String extension) {
    switch (extension.toLowerCase()) {
      case '.dart':
        return '[DART]';
      case '.js':
      case '.ts':
        return '[JS]';
      case '.py':
        return '[PY]';
      case '.java':
        return '[JAVA]';
      case '.cpp':
      case '.c':
        return '[C++]';
      case '.html':
        return '[HTML]';
      case '.css':
        return '[CSS]';
      case '.json':
        return '[JSON]';
      case '.md':
        return '[MD]';
      case '.txt':
        return '[TXT]';
      case '.pdf':
        return '[PDF]';
      case '.zip':
      case '.tar':
      case '.gz':
        return '[ZIP]';
      case '.png':
      case '.jpg':
      case '.jpeg':
      case '.gif':
        return '[IMG]';
      case '.mp3':
      case '.wav':
        return '[AUD]';
      case '.mp4':
      case '.avi':
        return '[VID]';
      case '.exe':
        return '[EXE]';
      case '.sh':
        return '[SH]';
      case '.yml':
      case '.yaml':
        return '[YML]';
      default:
        return '[FILE]';
    }
  }
  
  // 获取帮助图标
  static String getHelpIcon(String fontFamily) {
    if (fontFamily == 'JetBrainsMonoNerdFont') {
      return '';
    }
    return '[?]';
  }
  
  // 获取设置图标
  static String getSettingsIcon(String fontFamily) {
    if (fontFamily == 'JetBrainsMonoNerdFont') {
      return '';
    }
    return '[SET]';
  }
}