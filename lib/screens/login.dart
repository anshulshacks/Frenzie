import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frenzie/screens/friends_screen.dart';

class Login extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Mogra',
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Theme.of(context).accentColor,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromRGBO(255, 222, 49, 1),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontFamily: 'Mogra',
                    color: Theme.of(context).accentColor,
                    fontSize: 18,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromRGBO(255, 222, 49, 1),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      Icons.text_format,
                      color: Theme.of(context).primaryColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontFamily: 'Mogra',
                    color: Theme.of(context).accentColor,
                    fontSize: 18,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromRGBO(255, 222, 49, 1),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                child: TextField(
                  controller: passwordController,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Theme.of(context).primaryColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Mogra',
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  AuthResult _authResult;
                  _authResult = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                  Navigator.of(context).pushNamed(
                    Friends.routeName,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
