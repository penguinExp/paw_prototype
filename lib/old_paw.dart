// ///
// /// `PawInterface` - An Abstract class to help build a custom logger with
// /// help of [Paw 🐾]
// ///
// /// Example:
// /// ```
// /// class MyLogger extends PawInterface {
// ///   MyLogger() : super(name: 'MyLogger');
// ///
// ///   @override
// ///   void info(String msg, {StackTrace? stackTrace}) {
// ///     super.info(msg, stackTrace: stackTrace);///
// ///
// ///     // do something here if needed
// ///   }
// /// }
// ///
// /// void main() {
// ///   final logger = MyLogger();
// ///
// ///   logger.info('This is an informational message');
// ///   logger.warn('This is a warning message');
// ///   logger.debug({'key': 'value', 'count': 42});
// ///   logger.error('An unexpected error occurred');
// /// }
// /// ```
// ///
// class Paw {
//   ///
//   /// Constructor for the PAW
//   ///
//   Paw({
//     required this.name,
//     this.shouldPrintLogs = true,
//     this.shouldPrintName = true,
//     this.maxStackTraces = 5,
//     this.shouldIncludeSourceInfo = true,
//   });

//   ///
//   /// Name to be printed
//   ///
//   final String name;

//   ///
//   /// Max amount of stack traces allowed to print
//   ///
//   final int maxStackTraces;

//   ///
//   /// Indicates to print name on the console or not
//   ///
//   final bool shouldPrintName;

//   ///
//   /// Indicates whether printing logs is allowed or not
//   ///
//   final bool shouldPrintLogs;

//   ///
//   /// Indicates whether to print source file info or not
//   ///
//   final bool shouldIncludeSourceInfo;

//   void info(String msg, {StackTrace? stackTrace}) {
//     // Do nothing if current environment is not debug
//     if (!shouldPrintLogs) return;

//     const fg = "\x1b[38;5;255m";
//     const escape = "\x1B[0m";

//     final timeStamp = InternalUtils.getCurrentTimeStamp();

//     final sourceFileInfo = InternalUtils.getSourceFileInfo(
//       stackTrace,
//       shouldIncludeSourceInfo,
//     );

//     final String logMessage =
//         "\x1b[48;5;4m\x1b[1m$fg PAW › INFO  $escape\x1b[48;5;237m$fg $timeStamp › $sourceFileInfo $escape$fg $msg $escape";

//     InternalUtils.log(logMessage);
//   }

//   ///
//   /// Logs an informational message to the debug console.
//   ///
//   /// This method is used to log informational messages to the debug console
//   /// with formatted decorations and additional information such as source file,
//   /// timestamp, and the provided message.
//   ///
//   /// Example:
//   /// ```
//   /// // Log an informational message
//   /// Paw().info('This is an informational message');
//   /// ```
//   ///
//   // void info(
//   //   String msg, {
//   //   StackTrace? stackTrace,
//   // }) {
//   //   // Do nothing if current environment is not debug
//   //   if (!shouldPrintLogs) return;

//   // final timeStamp = InternalUtils.getCurrentTimeStamp();

//   // final sourceFileInfo = InternalUtils.getSourceFileInfo(
//   //   stackTrace,
//   //   shouldIncludeSourceInfo,
//   // );

//   //   final title = InternalUtils.getDecoratedName(name, shouldPrintName);

//   //   final decoratedLevel = InternalUtils.getDecoratedString(
//   //     "INFO",
//   //     fg: AnsiForegroundColors.black,
//   //     bg: AnsiBackgroundColor.blue,
//   //   );

//   //   final decoratedLog = InternalUtils.getDecoratedString(
//   //     "${sourceFileInfo.isEmpty ? '' : '$sourceFileInfo | '}$timeStamp | $msg",
//   //     fg: AnsiForegroundColors.white,
//   //   );

//   //   InternalUtils.log("$title$decoratedLevel $decoratedLog");
//   // }

//   ///
//   /// Logs a warning message to the debug console.
//   ///
//   /// This method is used to log warning messages to the debug console
//   /// with formatted decorations and additional information such as source file,
//   /// timestamp, and the provided warning message.
//   ///
//   /// Example:
//   /// ```
//   /// // Log a warning message
//   /// Paw().warn('This is a warning message');
//   /// ```
//   ///
//   // void warn(
//   //   String msg, {
//   //   StackTrace? stackTrace,
//   // }) {
//   //   // Do nothing if current environment is not debug
//   //   if (!shouldPrintLogs) return;

//   //   final timeStamp = InternalUtils.getCurrentTimeStamp();

//   //   final sourceFileInfo = InternalUtils.getSourceFileInfo(
//   //     stackTrace,
//   //     shouldIncludeSourceInfo,
//   //   );

//   //   final title = InternalUtils.getDecoratedName(name, shouldPrintName);

//   //   final decoratedLevel = InternalUtils.getDecoratedString(
//   //     "WARN",
//   //     fg: AnsiForegroundColors.lightPink,
//   //     bg: AnsiBackgroundColor.pink,
//   //   );

//   //   final decoratedLog = InternalUtils.getDecoratedString(
//   //     "${sourceFileInfo.isEmpty ? '' : '$sourceFileInfo | '}$timeStamp | $msg",
//   //     fg: AnsiForegroundColors.pink,
//   //   );

//   //   InternalUtils.log("$title$decoratedLevel $decoratedLog");
//   // }

//   ///
//   /// Logs an object or data for preview during debugging.
//   ///
//   /// This method is used to log debug messages containing an object or data structure
//   /// for preview purposes during debugging. It prints formatted decorations, source file
//   /// information, timestamp, and a prettified representation of the provided object.
//   ///
//   /// Example:
//   /// ```
//   /// // Log a debug message with an object for debugging
//   /// Paw().debug({'key': 'value', 'count': 42});
//   /// ```
//   ///
//   // void debug(
//   //   Object obj, {
//   //   StackTrace? stackTrace,
//   // }) {
//   //   // Do nothing if current environment is not debug
//   //   if (!shouldPrintLogs) return;

//   //   final timeStamp = InternalUtils.getCurrentTimeStamp();

//   //   final sourceFileInfo = InternalUtils.getSourceFileInfo(
//   //     stackTrace,
//   //     shouldIncludeSourceInfo,
//   //   );

//   //   final title = InternalUtils.getDecoratedName(name, shouldPrintName);

//   //   final decoratedLevel = InternalUtils.getDecoratedString(
//   //     "DEBUG",
//   //     fg: AnsiForegroundColors.black,
//   //     bg: AnsiBackgroundColor.lightPink,
//   //   );

//   //   final decoratedLog = InternalUtils.getDecoratedString(
//   //     "${sourceFileInfo.isEmpty ? '' : '$sourceFileInfo | '}$timeStamp",
//   //     fg: AnsiForegroundColors.lightPink,
//   //   );

//   //   final decoratedObj = InternalUtils.getPrettyObject(obj);

//   //   InternalUtils.log("$title$decoratedLevel $decoratedLog");
//   //   InternalUtils.log(decoratedObj);
//   // }

//   ///
//   /// Logs an error message with details, including the error and stack trace.
//   ///
//   /// This method is used to log error messages with formatted decorations,
//   /// source file information, timestamp, the provided error message, and the
//   /// associated stack trace. It provides a comprehensive view of errors during
//   /// debugging.
//   ///
//   /// Example:
//   /// ```
//   /// try {
//   ///   throw UnsupportedError("Oops! You've forgotten to implement this feature");
//   /// } catch (e, stackTrace) {
//   ///   // Log an error with a message, error object, and stack trace
//   ///   Paw().error('An unexpected error occurred', error: e, stackTrace: stackTrace);
//   /// }
//   /// ```
//   ///
//   // void error(
//   //   String msg, {
//   //   Object? error,
//   //   StackTrace? stackTrace,
//   // }) {
//   //   // Do nothing if current environment is not debug
//   //   if (!shouldPrintLogs) return;

//   //   final timeStamp = InternalUtils.getCurrentTimeStamp();

//   //   final sourceFileInfo = InternalUtils.getSourceFileInfo(
//   //     stackTrace,
//   //     shouldIncludeSourceInfo,
//   //   );

//   //   final title = InternalUtils.getDecoratedName(name, shouldPrintName);

//   //   final decoratedLevel = InternalUtils.getDecoratedString(
//   //     "ERROR",
//   //     fg: AnsiForegroundColors.white,
//   //     bg: AnsiBackgroundColor.orange,
//   //   );

//   //   final decoratedLog = InternalUtils.getDecoratedString(
//   //     "${sourceFileInfo.isEmpty ? '' : '$sourceFileInfo | '}$timeStamp | $msg",
//   //     fg: AnsiForegroundColors.orange,
//   //   );

//   //   final decoratedError = InternalUtils.getPrettyError(error);

//   //   final decoratedSt = InternalUtils.getPrettyStackTrace(
//   //     stackTrace,
//   //     maxLines: maxStackTraces,
//   //   );

//   //   InternalUtils.log("$title$decoratedLevel $decoratedLog");

//   //   if (decoratedError.isNotEmpty) {
//   //     InternalUtils.log(decoratedError);
//   //   }

//   //   if (decoratedSt.isNotEmpty) {
//   //     InternalUtils.log(decoratedSt);
//   //   }
//   // }
// }
