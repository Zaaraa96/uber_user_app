
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'authentication/custom_sign_in.dart';

void goToProfileScreen(BuildContext context){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
    return const ProfileScreen();
  }));
}

void goToSignInScreen(BuildContext context){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
    return const CustomSignInScreen();
  }));
}