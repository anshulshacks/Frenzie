import 'package:flutter/material.dart';

class TextBubble extends StatelessWidget {
  final String textMessage;
  final bool fromMe;
  TextBubble(this.textMessage, this.fromMe);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: fromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: fromMe ? Colors.grey : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: !fromMe ? Radius.circular(0) : Radius.circular(50),
              bottomRight: fromMe ? Radius.circular(0) : Radius.circular(50),
            ),
          ),
          width: 200,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          margin: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Text(
            textMessage,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'Open Sans',
            ),
          ),
        ),
      ],
    );
  }
}
