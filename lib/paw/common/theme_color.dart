class DarkTheme {
  final String primary = "\x1b[38;5;255m"; // white
  final String sec = "\x1b[38;5;195m"; // white
  final String secBg = "\x1b[48;5;238m"; // dark gray
  final String errOne = "\x1b[38;5;208m"; // pink - red
  final String errTwo = "\x1b[38;5;9m"; // pink - red
  final String bgWarn = "\x1b[48;5;204m"; // pink
  final String bgInfo = "\x1b[48;5;4m"; // blue
  final String bgTrace = "\x1b[48;5;36m"; // green
  final String tertiary = "\x1b[38;5;189m"; // purple white
  final String bgDebug = "\x1b[48;5;240m"; // light gray

  final String bgError = "\x1b[48;5;203m"; // red
  final String bgFetal = "\x1b[48;5;1m"; // dark red
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
