import 'package:chatlynx/services/auth/auth_service.dart';
import 'package:chatlynx/services/chat/chat_service.dart';
import 'package:chatlynx/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String recieverEmail;
  final String receiverID;

  ChatScreen({
    super.key,
    required this.recieverEmail,
    required this.receiverID,
  });
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(recieverEmail),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Cargando");
          }
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.bottomLeft;
    return Container(
        alignment: alignment,
        child: CustomBubble(
            isCurrentUser: isCurrentUser, message: data["message"]));
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: _messageController,
            hintText: "Escribe un mensaje",
            obscureText: false,
            isEmail: false,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          margin: EdgeInsets.only(
            right: 25,
          ),
          child: IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
