import 'package:flutter/material.dart';
import 'package:frenzie/screens/chat_room_screen.dart';
import 'package:frenzie/screens/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frenzie/screens/signup_screen.dart';

class DrawerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'frenzie',
                  style: TextStyle(
                    fontFamily: 'Mogra',
                    fontSize: 50,
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
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'find friends',
              style: TextStyle(
                fontFamily: 'Mogra',
                fontSize: 30,
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
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              String currentUUID = '';
              FirebaseAuth auth = FirebaseAuth.instance;
              final FirebaseUser user = await auth.currentUser();
              currentUUID = user.uid;
              DocumentSnapshot allData = await Firestore.instance
                  .collection('profile')
                  .document(currentUUID)
                  .get();
              print(allData.data['name']);
              // Navigator.of(context).pushNamed(
              //   ProfileScreen.routeName,
              // );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    name: allData.data['name'],
                    pfpUrl: allData.data['pfp'],
                    otherImageUrl: allData.data['other_img'],
                    age: allData.data['age'],
                    description: allData.data['description'],
                    interest_1: allData.data['interest_1'],
                    interest_2: allData.data['interest_2'],
                    interest_3: allData.data['interest_3'],
                  ),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'profile',
                style: TextStyle(
                  fontFamily: 'Mogra',
                  fontSize: 30,
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
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatRoom()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.sms,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'chat',
                style: TextStyle(
                  fontFamily: 'Mogra',
                  fontSize: 30,
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
          ),
          SizedBox(
            height: 200,
          ),
          InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamed(
                SignupScreen.routeName,
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                'logout',
                style: TextStyle(
                  fontFamily: 'Mogra',
                  fontSize: 30,
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
          ),
        ],
      ),
    );
  }
}
