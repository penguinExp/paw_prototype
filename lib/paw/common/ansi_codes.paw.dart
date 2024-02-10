/**
 * 
 * ANSI Color Codes for Dart Logging
 * 
 * This library provides a simple and effective way to apply ANSI color codes 
 * and styles to text in terminal or console applications. These codes are 
 * special character sequences that control the formatting, such as color and 
 * style, of text displayed in environments that support ANSI escape codes. 
 * 
 * For more comprehensive details on ANSI colors, you can visit: [ANSI Colors Documentation](https://en.wikipedia.org/wiki/ANSI_escape_code) 
 * 
 * To explore more ANSI color options, refer to: [Various ANSI Color Codes](https://talyian.github.io/ansicolors/)
 * 
 */

///
/// ANSI Escape Code for Resetting Style
///
/// This constant represents the ANSI escape code used to reset the text formatting
/// to its default state. It's analogous to an 'end tag' in HTML, ensuring that
/// any style changes are contained only within the intended scope.
///
/// ### Example:
/// ```
/// debugPrint("${AnsiForegroundColors.red.code} This is red text $kAnsiEscapeCode");
/// ```
///
/// In this example, escape code is used to ensure that the red text color does
/// not apply to any subsequent text.
///
const String kAnsiEscapeCode = "\x1B[0m";

///
/// Ansi Foreground Color Codes
///
/// This enum provides a set of predefined foreground colors using ANSI codes.
/// These can be easily used to change the color of text in console output.
///
/// ### Example:
/// ```
/// debugPrint("${AnsiForegroundColors.black.code} This is black text $kAnsiEscapeCode");
/// ```
///
/// Here, `AnsiForegroundColors.black.code` is used to set the text color to
/// black.
///
enum AnsiForegroundColors {
  ///
  /// Black foreground color representing `rgb(0,0,0)`
  ///
  black("\x1b[38;5;0m"),

  ///
  /// White foreground color representing `rgb(255,255,255)`
  ///
  white("\x1b[38;5;255m"),

  ///
  /// Red foreground color representing `?`
  ///
  red("");

  ///
  /// Constructor for defining a foreground color code.
  ///
  /// [code] represents the specific ANSI escape code for the color.
  ///
  const AnsiForegroundColors(this.code);

  ///
  /// The ANSI escape code for the color.
  ///
  final String code;
}

///
/// Ansi Background Color Codes
///
/// This enum provides a set of predefined background colors using ANSI codes.
/// These can be easily used to change the background color of text in console
/// output.
///
/// ### Example:
/// ```
/// debugPrint("${AnsiBackgroundColor.blue.code} This text has a blue background $kAnsiEscapeCode");
/// ```
///
/// Here, `AnsiBackgroundColor.blue.code` sets the background color to blue.
///
enum AnsiBackgroundColor {
  ///
  /// Blue background color representing `rgb(0, 55, 218)`
  ///
  blue("\x1b[48;5;4m"),

  ///
  /// Green background color representing `rgb(0, 175, 82)`
  ///
  green("\x1b[48;5;70m"),

  ///
  /// Purple background color representing `rgb(134, 96, 176)`
  ///
  purple("\x1b[48;5;129m"),

  ///
  /// Red background color representing `rgb(255, 0, 0)`
  ///
  red("\x1b[48;5;196m"),

  ///
  /// Orange background color representing `rgb(255, 135, 95)`
  ///
  orange("\x1b[48;5;205m"),

  ///
  /// Orchid (Shade of Pink or Medium Purple) background color representing
  /// `rgb(204, 102, 153)`
  ///
  orchid("\x1b[48;5;201m");

  ///
  /// Constructor for defining a background color code.
  ///
  /// [code] represents the specific ANSI escape code for the background color.
  ///
  const AnsiBackgroundColor(this.code);

  ///
  /// The ANSI escape code for the background color.
  ///
  final String code;
}

///
/// Ansi Text Style Codes
///
/// This enum provides text styling options using ANSI codes, such as making
/// text italic, bold, etc.
///
/// ### Example:
/// ```
/// debugPrint("${AnsiStyle.italic.code}This is italicized text${escapeCode}");
/// ```
///
/// In this example, `AnsiStyle.italic.code` is used to make the text italic.
///
enum AnsiStyle {
  ///
  /// Italic style ansi code
  ///
  italic("\x1b[3m"),

  ///
  /// Bold style ansi code
  ///
  bold("\x1b[1m");

  ///
  /// Constructor for defining a text style code.
  ///
  /// [code] represents the specific ANSI escape code for the text style.
  ///
  const AnsiStyle(this.code);

  ///
  /// The ANSI escape code for the text style.
  ///
  final String code;
}
