import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paw Prototype',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Press Me!"),
              onPressed: () {
                printLog();
              },
            ),
          ],
        ),
      ),
    );
  }
}

void printLog() {
  const fg = "\x1b[38;5;255m";
  const escape = "\x1B[0m";

  if (kDebugMode) {
    // print(
    //   "\x1b[48;5;2m$fg PAW › INFO $escape\x1b[48;5;241m$fg\x1b[3m 22:21:07 › main.dart $escape\x1b[38;5;231m This is info log $escape",
    // );

    print(
      "\x1b[48;5;69m$fg PAW › DEBUG $escape\x1b[48;5;241m$fg\x1b[3m 22:21:07 › main.dart $escape\x1b[38;5;231m This is info log $escape",
    );

    // print(
    //   "\x1b[48;5;69m$fg PAW | DEBUG $escape$secBg$fg main.dart | 22:21:07 | $escape This is the message",
    // );
  }
}

///
/// [Blue] Trace - Logging the process of working
/// [Green] Info - Logging the info
/// [Purple || Pink || IDK] Debug - Logging the data or objects
/// [Orange] Warn - Logging a warning message
/// [Red] Error - Logging an error message
/// [Red & White with Bordered Box] Fatal - Logging an error or exception with optional [error] & [stacktrace] objects
///