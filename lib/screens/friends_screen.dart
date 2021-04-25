import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frenzie/screens/signup_screen.dart';
import 'package:frenzie/widgets/drawer.dart';
import 'package:frenzie/widgets/friend_tile.dart';

class Friends extends StatelessWidget {
  static const routeName = '/friends';
  var chosenStream = Firestore.instance.collection('profile').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSection(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(137, 212, 255, 1),
        title: Text(
          'find friends',
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
          Row(
            children: [
              Container(
                width: 400,
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).primaryColor,
                    hintText: 'Search for a person',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder(
                stream: chosenStream,
                builder: (ctx, streamSnapshot) {
                  if (streamSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final documents = streamSnapshot.data.documents;
                  return ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (ctx, index) => FriendTile(
                          documents[index]['name'], documents[index]['pfp']));
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.of(context).pushNamed(
            SignupScreen.routeName,
          );
        },
      ),
    );
  }
}
