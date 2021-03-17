import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  Messages({@required this.message, @required this.sender});

final String sender;
final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(width: double.infinity, height: 10,),
        Text(sender, style: TextStyle(color: Colors.lightBlueAccent),),
        Material(
          color: Colors.lightBlueAccent,
          elevation: 5,
          borderRadius: BorderRadius.circular(5),

          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(message, style:
              TextStyle(color: Colors.blueGrey),),
          ),
        ),
      ]
    );
  }
}
