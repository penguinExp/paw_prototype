import 'common/theme_color.dart';
import 'common/utils.paw.dart';

class Paw {
  final String name;
  final int maxStackTraces;
  final bool shouldPrintName;
  final bool shouldPrintLogs;
  final bool shouldIncludeSourceInfo;

  final darkTheme = DarkTheme();

  Paw({
    required this.name,
    this.shouldPrintLogs = true,
    this.shouldPrintName = true,
    this.maxStackTraces = 5,
    this.shouldIncludeSourceInfo = true,
  });

  void info(String msg) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final String logMessage =
        "${darkTheme.bgInfo}\x1b[1m${darkTheme.primary} PAW › INFO  $escape${darkTheme.secBg}${darkTheme.primary} $timeStamp › $sourceFileInfo $escape${darkTheme.sec} $msg $escape";

    InternalUtils.log(logMessage);
  }

  void warn(String msg) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final String logMessage =
        "${darkTheme.bgWarn}\x1b[1m${darkTheme.primary} PAW › WARN  $escape${darkTheme.secBg}${darkTheme.primary} $timeStamp › $sourceFileInfo $escape\x1b[3m${darkTheme.errOne} $msg $escape";

    InternalUtils.log(logMessage);
  }

  void trace(String msg) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final String logMessage =
        "${darkTheme.bgTrace}\x1b[1m${darkTheme.primary} PAW › TRACE $escape${darkTheme.secBg}${darkTheme.primary} $timeStamp › $sourceFileInfo $escape${darkTheme.sec} $msg $escape";

    InternalUtils.log(logMessage);
  }

  void debug(Object obj) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final prettyObj = InternalUtils.getPrettyObject(obj, darkTheme.tertiary);

    final String logMessage =
        "${darkTheme.bgDebug}\x1b[1m${darkTheme.primary} PAW › DEBUG $escape${darkTheme.secBg}${darkTheme.primary} $timeStamp › $sourceFileInfo $escape \n$prettyObj $escape";

    InternalUtils.log(logMessage);
  }

  void error(String msg, {Object? error, StackTrace? stackTrace}) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final String divider = '${darkTheme.errOne}----------$escape'; // (- * 10)

    final prettyError = InternalUtils.getPrettyError(error, darkTheme.errTwo);

    final String logMessage =
        "${darkTheme.bgError}\x1b[1m${darkTheme.primary} PAW › ERROR $escape${darkTheme.secBg}${darkTheme.primary} $timeStamp › $sourceFileInfo $escape\x1b[3m${darkTheme.errOne} $msg$escape \n$divider\n$prettyError\n$divider";

    InternalUtils.log(logMessage);
  }

  void fetal(String msg, {required Object? error, StackTrace? stackTrace}) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final String divider = '${darkTheme.errOne}----------$escape'; // (- * 10)

    final prettyError = InternalUtils.getPrettyError(error, darkTheme.errTwo);

    final prettySt = InternalUtils.getPrettyStackTrace(
      stackTrace,
      maxLines: maxStackTraces,
      color: darkTheme.tertiary,
    );

    final String logMessage =
        "${darkTheme.bgFetal}\x1b[1m${darkTheme.primary} PAW › FETAL $escape${darkTheme.secBg}${darkTheme.primary} $timeStamp › $sourceFileInfo $escape\x1b[3m${darkTheme.errOne} $msg $escape\n$divider\n$prettyError\n$prettySt\n$divider";

    InternalUtils.log(logMessage);
  }
}
