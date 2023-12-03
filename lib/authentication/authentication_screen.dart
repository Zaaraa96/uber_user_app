
import 'package:flutter/material.dart';

import 'authentication_enum.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {

  AuthenticationMode _mode = AuthenticationMode.login;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:  Scaffold(

      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Opacity(
                opacity: 0.5,
                child: Image.asset('assets/images/road.png',
                alignment: Alignment.bottomCenter,
                  fit: BoxFit.contain,
                ),
              )),
            ],
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                const SizedBox(height: 100,),
                Center(child: Image.asset('assets/images/logo.png',
                    width: 200,)),
                const SizedBox(height: 20,),
                Center(
                  child: Text(_mode.getScreenText(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                  ),),
                ),
                 const SizedBox(height: 20,),

                 if( _mode.showName() )  Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        controller: nameController,
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    controller: emailController,
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    controller: passwordController,
                  ),
                  const SizedBox(height: 50,),
                  
                  ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10)
                      ),
                      child: Text(_mode.getButtonText(), style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),)),

                  TextButton(
                      onPressed: (){
                        setState(() {
                          _mode = _mode.changeMode();
                        });
                        nameController.clear();
                      },
                      child: Text(_mode.getMoreButtonText()))
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
