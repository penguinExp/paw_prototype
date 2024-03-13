abstract class PawTheme {
  // text colors

  String get primary;
  String get sec;
  String get tertiary;

  // bg colors

  String get bgWarn;
  String get bgInfo;
  String get bgTrace;
  String get bgDebug;
  String get bgError;
  String get bgFetal;

  String get secBg;

  // accent colors

  String get errOne;
  String get errTwo;
}

class DarkTheme extends PawTheme {
  @override
  final String primary = "\x1b[38;5;255m"; // white

  @override
  final String sec = "\x1b[38;5;195m"; // lighterWhite

  @override
  final String tertiary = "\x1b[38;5;189m"; // purple white

  @override
  final String bgWarn = "\x1b[48;5;204m"; // pink

  @override
  final String bgInfo = "\x1b[48;5;4m"; // blue

  @override
  final String bgTrace = "\x1b[48;5;36m"; // green

  @override
  final String bgDebug = "\x1b[48;5;240m"; // light gray

  @override
  final String bgError = "\x1b[48;5;203m"; // red

  @override
  final String bgFetal = "\x1b[48;5;1m"; // dark red

  @override
  final String secBg = "\x1b[48;5;238m"; // dark gray

  @override
  final String errOne = "\x1b[38;5;208m"; // red

  @override
  final String errTwo = "\x1b[38;5;9m"; // darkRed
}

///
/// Fallowing are the common colors
///
/// - primary (color for the text on bg, the metadata of the log) [white / black]
/// - secondary (color for the msg text) [pinkish white / brighter gray]
/// - bg-[lvl] (to highlight the log level) [depends on the level of the log]
/// - secBg (to highlight time and source file info) [gray]
/// - tertiary (for the content like data or stacktrace) [pinkish white]
/// - accent (for error, warning msg or any imp info shown by the logs) [red]
///
