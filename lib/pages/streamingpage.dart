import 'package:flutter/material.dart';

class streamingpage extends StatefulWidget {
  const streamingpage({super.key});

  @override
  State<streamingpage> createState() => _streamingpageState();
}

class _streamingpageState extends State<streamingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('streaming page'),
      ),
    );
  }
}