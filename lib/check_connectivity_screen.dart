
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnectivityScreen extends StatefulWidget {
  const CheckConnectivityScreen({super.key, required this.child});
  final Widget child;

  @override
  State<CheckConnectivityScreen> createState() => _CheckConnectivityScreenState();
}

class _CheckConnectivityScreenState extends State<CheckConnectivityScreen> {

  late StreamSubscription<ConnectivityResult> subscription;
  bool canPop=true;

  void checkResult(ConnectivityResult result) {
  print(result);
  if (result == ConnectivityResult.none || !
  (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi || result == ConnectivityResult.other))
  {
  // not connected to anything
  //should show alarm
  setState(() {
    canPop = false;
  });
  }
  if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi || result == ConnectivityResult.other) {
  // is connected to internet
  // should dismiss the alarm
    setState(() {
      canPop=true;
    });
  }
  }

  @override
  initState() {
    super.initState();
    //we should check the first time
    Connectivity().checkConnectivity().then(checkResult);
    subscription = Connectivity().onConnectivityChanged.listen(checkResult);
  }

  AlertDialog showConnectivityDialog(){
      return AlertDialog(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.symmetric(
      horizontal: 20, vertical: 8),
      title: const Text('you are not connected to internet'),
      content:  Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/internet.png', height: 200,),
            SizedBox(height: 20,),
            Text('connect to internet and try again'),
          ],
        ),
      ),

      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if(!canPop)
          Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                  color: Colors.black54,
                  child: Center(child: showConnectivityDialog())))
      ],
    );
  }
}
