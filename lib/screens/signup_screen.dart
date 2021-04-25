import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:frenzie/screens/friends_screen.dart';
import 'package:frenzie/screens/login.dart';
import 'package:frenzie/widgets/drawer.dart';
import 'package:frenzie/widgets/profile_picker.dart';
import 'package:frenzie/widgets/square_img_picker.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  File _userProfilePicture;
  File _squareImgFile;
  void _pickingImage(File image) {
    _userProfilePicture = image;
  }

  void _pickingSquareImg(File squareImg) {
    _squareImgFile = squareImg;
  }

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

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final descriptionController = TextEditingController();
  final interest1Controller = TextEditingController();
  final interest2Controller = TextEditingController();
  final interest3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSection(),
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
              Container(
                child: FlatButton(
                  child: Text('Or login'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Name',
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
                  controller: nameController,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Full Name',
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
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
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
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Age',
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
                  obscureText: false,
                  controller: ageController,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Age',
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      Icons.timeline,
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
                  'Description',
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
                  obscureText: false,
                  controller: descriptionController,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Describe yourself',
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      Icons.text_fields,
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
                  'Interest #1',
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
                  obscureText: false,
                  controller: interest1Controller,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  decoration: InputDecoration(
                    labelText: 'e.g. Movies',
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      Icons.person,
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
                  'Interest #2',
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
                  obscureText: false,
                  controller: interest2Controller,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  decoration: InputDecoration(
                    labelText: 'e.g. Hiking',
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      Icons.person,
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
                  'Interest #3',
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
                  obscureText: false,
                  controller: interest3Controller,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  decoration: InputDecoration(
                    labelText: 'e.g. Art',
                    labelStyle:
                        TextStyle(color: Theme.of(context).primaryColor),
                    prefixIcon: Icon(
                      Icons.person,
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
              ProfilePicker(_pickingImage),
              SquareImgPicker(_pickingSquareImg),
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
                    final ref = FirebaseStorage.instance
                        .ref()
                        .child('pfp')
                        .child(currentUUID + '.jpg');
                    await ref.putFile(_userProfilePicture).onComplete;
                    final url = await ref.getDownloadURL();

                    final squareRef = FirebaseStorage.instance
                        .ref()
                        .child('other')
                        .child(currentUUID + '.jpg');
                    await squareRef.putFile(_squareImgFile).onComplete;
                    final squareUrl = await squareRef.getDownloadURL();

                    Firestore.instance
                        .document('profile/' + currentUUID)
                        .setData({
                      'uuid': currentUUID,
                      'name': nameController.text,
                      'description': descriptionController.text,
                      'interest_1': interest1Controller.text,
                      'interest_2': interest2Controller.text,
                      'interest_3': interest3Controller.text,
                      'age': ageController.text,
                      'pfp': url,
                      'other_img': squareUrl,
                    });
                  }

                  getUUID();
                  print(currentUUID);
                  print(currentUUID);
                  print('ready to do it');

                  Navigator.of(context).pushNamed(
                    Friends.routeName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
