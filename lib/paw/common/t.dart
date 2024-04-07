class TestAnsiBackgroundColor {
  final String code;

  const TestAnsiBackgroundColor(this.code);

  /// Factory constructor for predefined background colors.
  static const TestAnsiBackgroundColor blue = TestAnsiBackgroundColor(
    "\x1b[48;5;4m",
  );

  static const TestAnsiBackgroundColor green = TestAnsiBackgroundColor(
    "\x1b[48;5;70m",
  );

  static const TestAnsiBackgroundColor purple = TestAnsiBackgroundColor(
    "\x1b[48;5;129m",
  );

  static const TestAnsiBackgroundColor red = TestAnsiBackgroundColor(
    "\x1b[48;5;196m",
  );

  static const TestAnsiBackgroundColor orange = TestAnsiBackgroundColor(
    "\x1b[48;5;205m",
  );

  static const TestAnsiBackgroundColor orchid = TestAnsiBackgroundColor(
    "\x1b[48;5;201m",
  );

  /// Factory constructor for creating a custom TestAnsiBackgroundColor instance.
  factory TestAnsiBackgroundColor.custom(String code) {
    return TestAnsiBackgroundColor(code);
  }
}
