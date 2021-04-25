import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:frenzie/screens/friends_screen.dart';
import 'package:frenzie/widgets/profile_picker.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String interest_1 = 'Art';
  String interest_2 = 'Art';
  String interest_3 = 'Art';
  List<String> interests = [
    'Art',
    'Programming',
    'Outdoors',
    'Sports',
    'Food',
    'Gaming',
    'Music',
    'Cooking'
  ];
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (BuildContext context1) {
        return Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Signup',
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
            SizedBox(height: 30),
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
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
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
                obscureText: true,
                controller: passwordController,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  prefixIcon: Icon(
                    Icons.lock,
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
            ProfilePicker(),
            // Row(
            //   children: [
            //     DropdownButton<String>(
            //       value: interest_1,
            //       icon: const Icon(Icons.arrow_downward),
            //       iconSize: 24,
            //       elevation: 16,

            //       items: interests.map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //       onChanged: null,
            //     ),
            //     DropdownButton(
            //       value: interest_2,
            //       items: interests.map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //       onChanged: null,
            //     ),
            //     DropdownButton(
            //       value: interest_3,
            //       items: interests.map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //       onChanged: null,
            //     ),
            //   ],
            // ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontFamily: 'Mogra',
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                AuthResult _authResult;

                _authResult = await auth.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
                var currentUUID = '';

                void getUUID() async {
                  final FirebaseUser user = await auth.currentUser();
                  currentUUID = user.uid;
                  print(currentUUID);
                  print(currentUUID);

                  Firestore.instance.collection('profile').add({
                    'uuid': currentUUID,
                    'first_name': null,
                    'last_name': null,
                    'interest_1': null,
                    'interest_2': null,
                    'interest_3': null,
                    'age': null,
                    'pfp': null,
                  });
                }

                getUUID();
                Scaffold.of(context1).showSnackBar(SnackBar(
                  content: Text(
                    'Update your profile on the profile page',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  elevation: 5,
                  backgroundColor: Color.fromRGBO(92, 83, 70, 1),
                ));
                print(currentUUID);

                // Firestore.instance.collection('profile').add({
                //   'uuid': currentUUID,
                //   'first_name': null,
                //   'last_name': null,
                //   'interest_1': null,
                //   'interest_2': null,
                //   'interest_3': null,
                //   'age': null,
                //   'pfp': null,
                // });
                print(currentUUID);
                print('ready to do it');

                Navigator.of(context).pushNamed(
                  Friends.routeName,
                );
              },
            ),
          ],
        );
      },
    ));
  }
}
