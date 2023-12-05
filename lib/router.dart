
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'authentication/custom_sign_in.dart';
import 'check_connectivity_screen.dart';

void navigateToPage(BuildContext context, Widget page){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
    return CheckConnectivityScreen(child: page);
  }));
}

void goToProfileScreen(BuildContext context){
  navigateToPage( context,const ProfileScreen());
}

void goToSignInScreen(BuildContext context){
  navigateToPage( context,const CustomSignInScreen());
}