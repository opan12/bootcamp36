import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organize_isler/pages/CompanyChatPage.dart';

class CompanyMessagesPage extends StatefulWidget {
  final String currentUserId; // Şirket kullanıcısının ID'si

  CompanyMessagesPage({required this.currentUserId});

  @override
  _CompanyMessagesPageState createState() => _CompanyMessagesPageState();
}

class _CompanyMessagesPageState extends State<CompanyMessagesPage> {
  final CollectionReference _chatsCollection =
  FirebaseFirestore.instance.collection('chats');
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: Color(0xFF8E97FD),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _chatsCollection
            .where('companyUserId', isEqualTo: widget.currentUserId)
            .orderBy('lastMessageTimestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final chats = snapshot.data!.docs;

          if (chats.isEmpty) {
            return Center(
              child: Text('No messages'),
            );
          }

          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index].data() as Map<String, dynamic>;
              final otherUserId = chat['userUserId'];
              final lastMessage = chat['lastMessage'];

              return ListTile(
                title: FutureBuilder<DocumentSnapshot>(
                  future: _usersCollection.doc(otherUserId).get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final userData = snapshot.data!.data() as Map<String, dynamic>;
                      final userName = userData['userName'];

                      return Text(userName);
                    } else {
                      return Text('Loading...');
                    }
                  },
                ),
                subtitle: Text(lastMessage),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompanyChatPage(
                        currentUserId: widget.currentUserId,
                        otherUserId: otherUserId,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}