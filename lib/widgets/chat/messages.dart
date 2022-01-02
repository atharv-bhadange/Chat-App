import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdTime',
            descending: true,
          )
          .snapshots(),
      builder: (ctx, AsyncSnapshot chatSnapshot) {
        final chatDocs = chatSnapshot.data?.docs ?? 0;

        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          reverse: true,
          itemBuilder: (ctx, idx) {
            return Text(chatDocs[idx]['text']);
          },
          itemCount: chatDocs.length,
        );
      },
    );
  }
}
