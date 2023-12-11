import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firestore_repository.dart';
import '../router.dart';
import 'auth_providers_provider.dart';
import 'firebase_auth_provider.dart';

class CustomProfileScreen extends ConsumerWidget {
  const CustomProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProvidersProvider);
    return ProfileScreen(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      providers: authProviders,
      actions: [
        SignedOutAction((context) {
          goToSignInScreen(context);
        }),
        DisplayNameChangedAction((context, String? oldName, String newName,) {
          final user = ref.read(firebaseAuthProvider).currentUser;
          ref.read(firestoreRepositoryProvider).update(user!.uid, name: newName);
        }),
      ],
    );
  }
}