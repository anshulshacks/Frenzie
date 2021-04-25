import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frenzie/widgets/drawer.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  final String name;
  final String pfpUrl;
  final String otherImageUrl;
  final String description;
  final String age;
  final String interest_1;
  final String interest_2;
  final String interest_3;
  const ProfileScreen(
      {this.name,
      this.pfpUrl,
      this.otherImageUrl,
      this.description,
      this.age,
      this.interest_1,
      this.interest_2,
      this.interest_3});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // var name = 'test';
    // String currentUUID = '';
    // DocumentSnapshot allData;
    // Future<void> getUID() async {
    //   FirebaseAuth auth = FirebaseAuth.instance;
    //   final FirebaseUser user = await auth.currentUser();
    //   currentUUID = user.uid;
    //   allData = await Firestore.instance
    //       .collection('profile')
    //       .document(currentUUID)
    //       .get();
    //   Future.delayed(Duration(seconds: 2));
    //   setState(() {
    //     name = allData.data['name'];
    //     print(name);
    //   });

    // getUID();
    return Scaffold(
      drawer: DrawerSection(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(137, 212, 255, 1),
        title: Text(
          widget.name,
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Mogra',
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
      body: Column(
        children: [
          SizedBox(height: 50),
          Container(width: 300, height: 200, child: FittedBox(child: Image.network(widget.otherImageUrl))),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.description,
              style: TextStyle(
                  fontFamily: 'Mogra',
                  fontSize: 18,
                  color: Theme.of(context).accentColor),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Interest 1:',
                    style: TextStyle(
                        fontFamily: 'Mogra',
                        fontSize: 18,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    widget.interest_1,
                    style: TextStyle(
                        fontFamily: 'Mogra',
                        fontSize: 18,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Interest 2:',
                    style: TextStyle(
                        fontFamily: 'Mogra',
                        fontSize: 18,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    widget.interest_2,
                    style: TextStyle(
                        fontFamily: 'Mogra',
                        fontSize: 18,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Interest 3:',
                    style: TextStyle(
                        fontFamily: 'Mogra',
                        fontSize: 18,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    widget.interest_3,
                    style: TextStyle(
                        fontFamily: 'Mogra',
                        fontSize: 18,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
