import 'package:chatapp/core/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Stack(
          children: [
            Text(
              "ChitChat",
              style: TextStyle(
                  color: white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
