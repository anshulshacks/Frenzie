import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frenzie/widgets/drawer.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  final String name;
  const ProfileScreen(this.name);


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
      // body: Column(
      //   children: [
      //     Image.network('https://www.jennybeaumont.com/wp-content/uploads/2015/03/placeholder.gif'),
      //     Container(child: Text(allData.data['description']),),
      //     Row(children: [Column(children: [Text('Interest 1:'), Text(allData.data['interest_1'])],), Column(children: [Text('Interest 2:'), Text(allData.data['interest_2'])],), Column(children: [Text('Interest 3:'), Text(allData.data['interest_3'])],)],)
      //   ],
      // ),
    );
  }
}
