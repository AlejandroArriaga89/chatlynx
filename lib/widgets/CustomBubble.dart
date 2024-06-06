import 'package:flutter/material.dart';

class CustomBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const CustomBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.green : Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topLeft: isCurrentUser ? Radius.circular(10) : Radius.circular(0),
          topRight: isCurrentUser ? Radius.circular(0) : Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 25),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 17,
          color: isCurrentUser ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
