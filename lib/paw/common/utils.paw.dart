import 'dart:convert';

import 'ansi_codes.paw.dart';

class InternalUtils {
  static String getDecoratedName(String name, bool shouldPrintName) {
    if (!shouldPrintName || name.isEmpty) return '';

    return getDecoratedString(
      name,
      fg: AnsiForegroundColors.white,
      bg: AnsiBackgroundColor.blue,
    );
  }

  static String getDecoratedString(
    String text, {
    required AnsiForegroundColors fg,
    AnsiStyle? style,
    AnsiBackgroundColor? bg,
  }) {
    final fgCode = fg.code;
    final bgCode = bg != null ? bg.code : '';
    final styleCode = style != null ? style.code : '';

    return "$bgCode$fgCode$styleCode $text $kAnsiEscapeCode";
  }

  static String getCurrentTimeStamp({DateTime? time}) {
    final now = time ?? DateTime.now();

    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
  }

  static String getSourceFileInfo([
    bool includeSource = true,
  ]) {
    if (!includeSource) return "";

    final stackTrace = StackTrace.current;

    return extractSourceFileInfo(stackTrace);
  }

  static String extractSourceFileInfo(StackTrace stackTrace) {
    // extract source file stack trace from the current stack trace
    final String source = stackTrace.toString().split('\n').firstWhere(
          (element) =>
              !element.contains('Paw') &&
              !element.contains(
                'InternalUtils',
              ),
          orElse: () => '',
        );

    // if the source file is not found
    if (source.isEmpty) {
      return 'source unknown';
    }

    // Regular expression to extract file name and line number
    RegExp regex = RegExp(r"\((.*?/([^/]+)):([0-9]+):([0-9]+)\)");

    // Match the regular expression in the stack trace
    Match? match = regex.firstMatch(source);

    if (match == null || match.groupCount < 4) {
      return 'source unknown';
    }

    final fileName = match.group(2);

    final lineNumber = int.parse(match.group(3) ?? '00');

    return "$fileName:$lineNumber";
  }

  static String getPrettyStackTrace(
    StackTrace? stackTrace, {
    required int maxLines,
  }) {
    try {
      if (stackTrace == null) {
        return '';
      }

      final stackTraceList = stackTrace.toString().split('\n');

      final sanitizedMaxLength =
          stackTraceList.length < maxLines ? stackTraceList.length : maxLines;

      final sanitizedList = stackTraceList.sublist(0, sanitizedMaxLength);

      final coloredSt = sanitizedList
          .map(
            (line) => "${AnsiForegroundColors.white.code}$line",
          )
          .toList()
          .join('\n');

      return coloredSt;
    } catch (e) {
      return "[stacktrace error -> $e]";
    }
  }

  static String getPrettyError(
    Object? error, {
    String color = "\x1b[38;5;203m",
  }) {
    if (error == null) return "";

    try {
      // Convert the error object to a string.
      String errorString = error.toString();

      if (errorString.isEmpty) return "";

      // Add color to each line for better visibility.
      List<String> lines = errorString.split('\n');

      lines = lines.map((line) => '$color$line').toList();

      // Join the lines and return the final prettified output.
      String finalOutput = lines.join('\n');

      return finalOutput;
    } catch (e) {
      // Return a generic error message if any exception occurs during conversion.
      return 'Unable to pretty print error object. \nError: $e';
    }
  }

  static String getPrettyObject(
    Object? obj, {
    String color = "\x1b[38;5;255m",
  }) {
    if (obj == null) return "";

    try {
      // Convert the object to a JSON string.
      String jsonString = jsonEncode(obj);

      // Decode and re-encode the JSON with an indentation of 2 spaces.
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');

      String prettyPrintedJson = encoder.convert(json.decode(jsonString));

      // Add color to each line for better visibility.
      List<String> lines = prettyPrintedJson.split('\n');

      lines = lines.map((line) => '$color$line').toList();

      // Join the lines and return the final prettified output.
      String finalOutput = lines.join('\n');
      return finalOutput;
    } catch (e) {
      // Return an error message if any exception occurs during conversion.
      return 'Unable to convert the object. \n${getPrettyError(e)}';
    }
  }

  static void log(String log, {bool shouldPrintLog = true}) {
    if (shouldPrintLog) {
      // ignore: avoid_print
      print(log);
    }
  }
}
