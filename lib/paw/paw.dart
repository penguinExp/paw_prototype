import 'package:paw_prototype/paw/common/utils.paw.dart';

class Paw {
  final String name;
  final int maxStackTraces;
  final bool shouldPrintName;
  final bool shouldPrintLogs;
  final bool shouldIncludeSourceInfo;

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

    const fg = "\x1b[38;5;255m";
    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final String logMessage =
        "\x1b[48;5;4m\x1b[1m$fg PAW › INFO  $escape\x1b[48;5;237m$fg $timeStamp › $sourceFileInfo $escape$fg $msg $escape";

    InternalUtils.log(logMessage);
  }

  void warn(String msg) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    const fg = "\x1b[38;5;255m";
    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final String logMessage =
        "\x1b[48;5;199m\x1b[1m$fg PAW › WARN  $escape\x1b[48;5;237m$fg $timeStamp › $sourceFileInfo $escape\x1b[3m\x1b[38;5;199m $msg $escape";

    InternalUtils.log(logMessage);
  }

  void trace(String msg) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    const fg = "\x1b[38;5;255m";
    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final String logMessage =
        "\x1b[48;5;36m\x1b[1m$fg PAW › TRACE $escape\x1b[48;5;237m$fg $timeStamp › $sourceFileInfo $escape$fg $msg $escape";

    InternalUtils.log(logMessage);
  }

  void debug(Object obj) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    const fg = "\x1b[38;5;255m";
    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final prettyObj = InternalUtils.getPrettyObject(obj);

    final String logMessage =
        "\x1b[48;5;240m\x1b[1m$fg PAW › DEBUG $escape\x1b[48;5;237m$fg $timeStamp › $sourceFileInfo $escape$fg \n$prettyObj $escape";

    InternalUtils.log(logMessage);
  }

  void error(String msg, {Object? error, StackTrace? stackTrace}) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    const fg = "\x1b[38;5;255m";
    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final prettyError =
        "\n\x1b[48;5;237m\x1b[3m$fg error $escape\n${InternalUtils.getPrettyError(error)}";

    final String logMessage =
        "\x1b[48;5;203m\x1b[1m$fg PAW › ERROR $escape\x1b[48;5;237m$fg $timeStamp › $sourceFileInfo $escape\x1b[3m\x1b[38;5;203m $msg $escape$prettyError";

    InternalUtils.log(logMessage);
  }

  void fetal(String msg, {required Object? error, StackTrace? stackTrace}) {
    // Do nothing if current environment is not debug
    if (!shouldPrintLogs) return;

    const fg = "\x1b[38;5;255m";
    const escape = "\x1B[0m";

    final timeStamp = InternalUtils.getCurrentTimeStamp();

    final sourceFileInfo = InternalUtils.getSourceFileInfo(
      shouldIncludeSourceInfo,
    );

    final prettyError =
        "\n\x1b[48;5;237m\x1b[3m$fg error $escape\n${InternalUtils.getPrettyError(error)}";

    final getPrettyStacktrace = InternalUtils.getPrettyStackTrace(
      stackTrace,
      maxLines: maxStackTraces,
    );

    final prettySt =
        "\n\x1b[48;5;237m\x1b[3m$fg stacktrace $escape\n$getPrettyStacktrace";

    final String logMessage =
        "\x1b[48;5;1m\x1b[1m$fg PAW › FETAL $escape\x1b[48;5;237m$fg $timeStamp › $sourceFileInfo $escape\x1b[3m\x1b[38;5;203m $msg $escape$prettyError$prettySt";

    InternalUtils.log(logMessage);
  }
}
