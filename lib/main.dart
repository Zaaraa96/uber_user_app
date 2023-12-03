import 'package:flutter/material.dart';

import 'authentication/authentication_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uber user app',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const AuthenticationScreen(),
    );
  }
}
