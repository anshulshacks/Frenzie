import 'package:flutter/material.dart';

class FriendTile extends StatelessWidget {
  final String name;
  final String url;

  FriendTile(this.name, this.url);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.purple, backgroundImage: NetworkImage(url)),
      title: Text(
        name,
        style: TextStyle(
          fontSize: 20,
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
      subtitle: Text('age'),
      trailing: Wrap(
        spacing: 12,
        children: <Widget>[
          Icon(Icons.sms),
          Icon(Icons.remove_red_eye),
        ],
      ),
    );
  }
}
