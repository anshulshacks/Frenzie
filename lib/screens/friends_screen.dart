import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frenzie/widgets/friend_tile.dart';

class Friends extends StatelessWidget {
  static const routeName = '/friends';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(137, 212, 255, 1),
        title: Text(
          'friends',
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
          FriendTile(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('hi');
          Firestore.instance
          .collection('profile')
          .snapshots()
          .listen((data) {
            data.documents.forEach((document) {
              print(document['text']);
            });
          });
        },
      ),
    );
  }
}
