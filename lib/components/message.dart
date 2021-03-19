import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  Messages({
    @required this.message,
    @required this.sender,
    @required this.isCurrentUser,
  });

final String sender;
final String message;
final bool isCurrentUser;

@override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end :
      CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            sender,
            style: TextStyle(
              color: Colors.lightBlueAccent
            ),
          ),
        ),
        Material(
          color: Colors.black,
          elevation: 5,
          borderRadius: BorderRadius.only(
            topLeft: isCurrentUser ? Radius.circular(30) : Radius.zero,
            topRight: isCurrentUser ? Radius.zero: Radius.circular(30),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),

          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(message, style:
              TextStyle(color: Colors.lightBlueAccent),
            ),
          ),
        ),
      ]
    );
  }
}
