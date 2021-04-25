import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageInput extends StatefulWidget {
  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _textController = new TextEditingController();
  String _textDraft = '';

  void _sendText() async {
    FocusScope.of(context).unfocus();
    final currentUser = await FirebaseAuth.instance.currentUser();
    Firestore.instance.collection('chat').add({
      'text': _textDraft,
      'sentAt': Timestamp.now(),
      'uid': currentUser.uid, 
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Text a frenzie'),
                onChanged: (value) {
                  setState(() {
                    _textDraft = value;
                  });
                },
              ),
            ),
            IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.send),
              onPressed: _textDraft.trim().isEmpty ? null : _sendText,
            )
          ],
        ));
  }
}
