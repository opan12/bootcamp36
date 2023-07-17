import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyChatPage extends StatefulWidget {
  final String currentUserId; // Şirket kullanıcısının ID'si
  final String otherUserId; // Müşteri kullanıcısının ID'si

  CompanyChatPage({required this.currentUserId, required this.otherUserId});

  @override
  _CompanyChatPageState createState() => _CompanyChatPageState();
}

class _CompanyChatPageState extends State<CompanyChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final CollectionReference _chatsCollection =
  FirebaseFirestore.instance.collection('chats');
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('users');

  String _otherUserName = '';

  @override
  void initState() {
    super.initState();
    _fetchOtherUserName();
  }

  Future<void> _fetchOtherUserName() async {
    final docSnapshot =
    await _usersCollection.doc(widget.otherUserId).get();

    if (docSnapshot.exists) {
      final userData = docSnapshot.data() as Map<String, dynamic>;
      final userName = userData['userName'] as String;
      setState(() {
        _otherUserName = userName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $_otherUserName'),
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
                        subtitle: Text(message['senderId'] == widget.currentUserId
                            ? 'You'
                            : _otherUserName),
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
    // Chat ID'sini oluşturmak için iki kullanıcının ID'sini sıralı bir şekilde birleştiriyoruz.
    final List<String> userIds = [widget.currentUserId, widget.otherUserId];
    userIds.sort();
    return userIds.join('_');
  }

  void _sendMessage() {
    final String messageText = _messageController.text.trim();

    if (messageText.isNotEmpty) {
      final message = {
        'text': messageText,
        'senderId': widget.currentUserId,
        'timestamp': Timestamp.now(),
      };

      _chatsCollection
          .doc(_getChatId())
          .collection('messages')
          .add(message);

      _messageController.clear();
    }
  }
}