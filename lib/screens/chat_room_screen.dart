import 'package:flutter/material.dart';
import 'package:frenzie/widgets/drawer.dart';
import 'package:frenzie/widgets/message_input.dart';
import 'package:frenzie/widgets/texts.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSection(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(137, 212, 255, 1),
        title: Text(
          'chat',
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
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Texts(),
            ),
            MessageInput(),
          ],
        ),
      ),
    );
  }
}
