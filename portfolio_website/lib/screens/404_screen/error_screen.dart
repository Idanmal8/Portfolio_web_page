import 'package:flutter/material.dart';

class ErrorConnetionScreen extends StatelessWidget {
  const ErrorConnetionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Error'),
            Text('Connection'),
          ],
        ),
      ),
    );
  }
}