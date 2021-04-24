import 'package:flutter/material.dart';
import 'package:frenzie/screens/friends_screen.dart';
import 'package:frenzie/screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Frenzie',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color.fromRGBO(255, 121, 0, 1),
        canvasColor: Color.fromRGBO(137, 212, 255, 1),
      ),
      home: SignupScreen(),
      routes: {
        Friends.routeName: (ctx) => Friends(),
      },
    );
  }
}
