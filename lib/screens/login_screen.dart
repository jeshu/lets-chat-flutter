import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lets_talk/components/main_button.dart';
import 'package:lets_talk/constants.dart';
import 'package:lets_talk/screens/chat_screen.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

  String _errorMsg = '';
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
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  email = value;
                },
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
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  password = value;
                },
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              Text(
                _errorMsg,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  color: Colors.lightBlueAccent,
                  label: 'Login',
                  onPressed: () async {
                    context.showLoaderOverlay();
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: email, password: password);
                      Navigator.pushNamed(context, ChatScreen.id);
                      context.hideLoaderOverlay();
                    } on FirebaseAuthException catch (e) {
                      context.hideLoaderOverlay();
                      setState(() {
                        if (e.code == 'user-not-found') {
                          _errorMsg = 'No user found for that email.';
                        } else if (e.code == 'wrong-password') {
                          _errorMsg = 'Wrong password provided for that user.';
                        }
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
