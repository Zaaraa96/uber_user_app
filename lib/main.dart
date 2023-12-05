
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'authentication/custom_profile_screen.dart';
import 'authentication/custom_sign_in.dart';
import 'authentication/firebase_auth_provider.dart';
import 'check_connectivity_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(firebaseAuthProvider).currentUser != null;
    return MaterialApp(
      title: 'uber user app',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: CheckConnectivityScreen(child: isLoggedIn? const CustomProfileScreen(): const CustomSignInScreen() ),
    );
  }
}
