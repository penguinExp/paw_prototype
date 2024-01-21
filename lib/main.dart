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

/*
Info - Blue (4)
Debug - Green (70)
Trace - Purple (129)
*/

void printLog() {
  const fg = "\x1b[38;5;255m";
  const escape = "\x1B[0m";

  if (kDebugMode) {
    // print(
    //   "\x1b[48;5;4m\x1b[1m$fg PAW › INFO  $escape\x1b[48;5;237m$fg 22:21:07 › main.dart $escape\x1b[3m$fg This is info log $escape",
    // );

    // print(
    //   "\x1b[48;5;70m\x1b[1m$fg PAW › DEBUG $escape\x1b[48;5;237m$fg 22:21:07 › main.dart $escape\x1b[3m$fg This is debug log $escape",
    // );

    print(
      "\x1b[48;5;201m\x1b[1m$fg PAW › WARN  $escape\x1b[48;5;237m$fg 22:21:07 › main.dart $escape\x1b[3m\x1b[38;5;200m This is a warning log $escape",
    );

    print(
      "\x1b[48;5;205m\x1b[1m$fg PAW › ERROR $escape\x1b[48;5;237m$fg 22:21:07 › main.dart $escape\x1b[3m\x1b[38;5;204m Something has happened $escape\n\x1b[3m\x1b[38;5;204m-----$escape\n\x1b[3m\x1b[38;5;204m${UnimplementedError("You forgot to implement this error")}$escape\n\x1b[3m\x1b[38;5;204m-----$escape",
    );

    // print(
    //   "\x1b[48;5;129m\x1b[1m$fg PAW › TRACE $escape\x1b[48;5;237m$fg 22:21:07 › main.dart $escape\x1b[3m$fg This is trace log $escape",
    // );

    print(
      "\x1b[48;5;196m\x1b[1m$fg PAW › FATAL $escape\x1b[48;5;237m$fg 22:21:07 › main.dart $escape\x1b[3m\x1b[38;5;196m Something has happened $escape\n\x1b[3m\x1b[38;5;196m-----$escape\n\x1b[3m\x1b[38;5;196m${StackTrace.current.toString().split('\n').sublist(0, 2).join('\n')}$escape\n\x1b[3m\x1b[38;5;196m-----$escape",
    );
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