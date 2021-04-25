import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frenzie/widgets/text_bubble.dart';

class Texts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (ctx, futureSnapshot) {
          if (futureSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return StreamBuilder(
              stream: Firestore.instance
                  .collection('chat')
                  .orderBy('sentAt', descending: true)
                  .snapshots(),
              builder: (ctx, textSnapshot) {
                if (textSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  reverse: true,
                  itemCount: textSnapshot.data.documents.length,
                  itemBuilder: (ctx, index) => TextBubble(
                      textSnapshot.data.documents[index]['text'],
                      textSnapshot.data.documents[index]['uid'] ==
                          futureSnapshot.data.uid),
                );
              });
        });
  }
}
