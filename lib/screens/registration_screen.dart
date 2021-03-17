import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/components/main_button.dart';
import 'package:lets_talk/constants.dart';
import 'package:lets_talk/screens/chat_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                style: TextStyle(color: Colors.black),
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter your Email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                style: TextStyle(color: Colors.black),
                decoration: kInputDecoration.copyWith(
                    hintText: 'Enter your password',
                    hasFloatingPlaceholder: true),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  label: 'Register',
                  onPressed: () async {
                    context.showLoaderOverlay();
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      Navigator.pushNamed(context, ChatScreen.id);
                      context.hideLoaderOverlay();
                    } catch (e) {
                      context.hideLoaderOverlay();
                      print(e);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

String password;
