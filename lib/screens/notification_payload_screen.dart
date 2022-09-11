import 'package:flutter/material.dart';

class NotificationPayloadScreen extends StatelessWidget {
  final String payload;

  const NotificationPayloadScreen({Key? key, required this.payload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          payload,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
