import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication/authentication_screen.dart';
import 'check_connectivity_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'uber user app',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const CheckConnectivityScreen(child: AuthenticationScreen()),
    );
  }
}
