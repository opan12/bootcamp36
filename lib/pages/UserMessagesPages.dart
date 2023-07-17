import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organize_isler/pages/ChatPage.dart';

class UserMessagesPage extends StatefulWidget {
  final String currentUserId; // Kullanıcının ID'si

  UserMessagesPage({required this.currentUserId});

  @override
  _UserMessagesPageState createState() => _UserMessagesPageState();
}

class _UserMessagesPageState extends State<UserMessagesPage> {
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
            .where('userUserId', isEqualTo: widget.currentUserId)
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
            itemCount: chats.length * 2 - 1, // Divider'lar dahil edildiği için öğe sayısı iki katına çıkarıldı
            itemBuilder: (context, index) {
              // Her iki öğe arasına Divider ekleyin
              if (index.isOdd) {
                return Divider();
              }

              final chatIndex = index ~/ 2; // Gerçek chat dizinini hesaplayın

              final chat = chats[chatIndex].data() as Map<String, dynamic>;
              final otherCompanyId = chat['companyUserId'];
              final lastMessage = chat['lastMessage'];

              return FutureBuilder<DocumentSnapshot>(
                future: _fetchCompanyName(otherCompanyId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  }

                  final companyData =
                  snapshot.data!.data() as Map<String, dynamic>;
                  final companyName = companyData['companyName'];

                  return ListTile(
                    title: Text(companyName),
                    subtitle: Text(lastMessage),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(
                            currentUserId: widget.currentUserId,
                            otherCompanyId: otherCompanyId,
                            otherCompanyName: companyName,
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<DocumentSnapshot> _fetchCompanyName(String companyId) {
    return _usersCollection.doc(companyId).get();
  }
}