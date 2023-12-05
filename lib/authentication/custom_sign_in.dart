import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../router.dart';

class CustomSignInScreen extends ConsumerWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = [EmailAuthProvider()];
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Opacity(
                opacity: 0.9,
                child: Image.asset('assets/images/road.png',
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.contain,
                ),
              )),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 100,),
              Center(child: Image.asset('assets/images/logo.png',
                width: 150,)),
              Expanded(
                child: Opacity(
                  opacity: 0.8,
                  child: SignInScreen(
                    providers: authProviders,
                    actions: [
                      AuthStateChangeAction<SignedIn>((context, state) {
                        goToProfileScreen(context);
                      }),
                      AuthStateChangeAction<UserCreated>((context, state) {
                        goToProfileScreen(context);
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}