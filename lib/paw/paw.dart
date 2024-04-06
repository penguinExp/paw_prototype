import 'common/theme_color.dart';
import 'common/utils.paw.dart';

class Paw {
  final String name;
  final int maxStackTraces;
  final bool shouldPrintName;
  final bool shouldPrintLogs;
  final bool shouldIncludeSourceInfo;

  final currentTheme = DarkTheme();
  // final currentTheme = LightTheme();

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
        "${currentTheme.bgInfo}\x1b[1m${currentTheme.primary} PAW › INFO  $escape${currentTheme.secBg}${currentTheme.primary} $timeStamp › $sourceFileInfo $escape${currentTheme.sec} $msg $escape";

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
        "${currentTheme.bgWarn}\x1b[1m${currentTheme.primary} PAW › WARN  $escape${currentTheme.secBg}${currentTheme.primary} $timeStamp › $sourceFileInfo $escape\x1b[3m${currentTheme.errOne} $msg $escape";

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
        "${currentTheme.bgTrace}\x1b[1m${currentTheme.primary} PAW › TRACE $escape${currentTheme.secBg}${currentTheme.primary} $timeStamp › $sourceFileInfo $escape${currentTheme.sec} $msg $escape";

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

    final prettyObj = InternalUtils.getPrettyObject(obj, currentTheme.tertiary);

    final String logMessage =
        "${currentTheme.bgDebug}\x1b[1m${currentTheme.primary} PAW › DEBUG $escape${currentTheme.secBg}${currentTheme.primary} $timeStamp › $sourceFileInfo $escape \n$prettyObj $escape";

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

    final String divider =
        '${currentTheme.errOne}----------$escape'; // (- * 10)

    final prettyError =
        InternalUtils.getPrettyError(error, currentTheme.errTwo);

    final String logMessage =
        "${currentTheme.bgError}\x1b[1m${currentTheme.primary} PAW › ERROR $escape${currentTheme.secBg}${currentTheme.primary} $timeStamp › $sourceFileInfo $escape\x1b[3m${currentTheme.errOne} $msg$escape \n$divider\n$prettyError\n$divider";

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

    final String divider =
        '${currentTheme.errOne}----------$escape'; // (- * 10)

    final prettyError =
        InternalUtils.getPrettyError(error, currentTheme.errTwo);

    final prettySt = InternalUtils.getPrettyStackTrace(
      stackTrace,
      maxLines: maxStackTraces,
      color: currentTheme.tertiary,
    );

    final String logMessage =
        "${currentTheme.bgFetal}\x1b[1m${currentTheme.primary} PAW › FETAL $escape${currentTheme.secBg}${currentTheme.primary} $timeStamp › $sourceFileInfo $escape\x1b[3m${currentTheme.errOne} $msg $escape\n$divider\n$prettyError\n$prettySt\n$divider";

    InternalUtils.log(logMessage);
  }
}
