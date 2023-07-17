import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String currentUserId; // Mevcut kullanıcının ID'si
  final String otherCompanyId; // Diğer şirketin ID'si
  final String otherCompanyName; // Diğer şirketin adı

  ChatPage({
    required this.currentUserId,
    required this.otherCompanyId,
    required this.otherCompanyName,
  });

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final CollectionReference _chatsCollection =
  FirebaseFirestore.instance.collection('chats');
  final CollectionReference _companiesCollection =
  FirebaseFirestore.instance.collection('companies');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.otherCompanyName}'),
        backgroundColor: Color(0xFF8E97FD),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _chatsCollection
                  .doc(_getChatId())
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data!.docs;

                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message =
                      messages[index].data() as Map<String, dynamic>;

                      return ListTile(
                        title: Text(message['text']),
                        subtitle: Text(
                          message['senderId'] == widget.currentUserId
                              ? 'You'
                              : widget.otherCompanyName,
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Write your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getChatId() {
    final List<String> companyIds = [
      widget.currentUserId,
      widget.otherCompanyId,
    ];
    companyIds.sort();
    return companyIds.join('_');
  }

  void _sendMessage() {
    final String messageText = _messageController.text.trim();

    if (messageText.isNotEmpty) {
      final message = {
        'text': messageText,
        'senderId': widget.currentUserId,
        'timestamp': Timestamp.now(),
      };

      final chatId = _getChatId();

      _chatsCollection.doc(chatId).set({
        'companyUserId': widget.otherCompanyId,
        'userUserId': widget.currentUserId,
        'lastMessage': messageText,
        'lastMessageTimestamp': Timestamp.now(),
      });

      _chatsCollection.doc(chatId).collection('messages').add(message);

      _messageController.clear();
    }
  }
}