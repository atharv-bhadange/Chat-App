import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat App',
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, idx) => Container(
          padding: EdgeInsets.all(8),
          child: Text(
            'Message',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('/chats/TpjH597JRoFNpSA6xRyL/messages')
              .snapshots()
              .listen((data) {
            data.docs.forEach((doc) {
              print(doc['text']);
            });
          });
        },
      ),
    );
  }
}
