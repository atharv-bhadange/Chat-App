import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('/chats/TpjH597JRoFNpSA6xRyL/messages')
              .snapshots(),
          builder: (ctx, AsyncSnapshot streamSnapshot) {
            final document = streamSnapshot.data!.docs;
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: document.length,
              itemBuilder: (ctx, idx) => Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  document[idx]['text'],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('/chats/TpjH597JRoFNpSA6xRyL/messages')
              .add({
            'text': 'This button was clicked',
          });
        },
      ),
    );
  }
}
