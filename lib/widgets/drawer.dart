import 'package:flutter/material.dart';

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
          ListTile(
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
          SizedBox(
            height: 20,
          ),
          ListTile(
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
          SizedBox(
            height: 200,
          ),
          ListTile(
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
        ],
      ),
    );
  }
}
