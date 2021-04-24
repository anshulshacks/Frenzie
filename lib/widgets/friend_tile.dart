import 'package:flutter/material.dart';

class FriendTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: Colors.purple),
      title: Text(
        'isabella',
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
    );
  }
}
