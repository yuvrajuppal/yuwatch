import 'package:flutter/material.dart';

class Favroritepage extends StatefulWidget {
  const Favroritepage({super.key});

  @override
  State<Favroritepage> createState() => _FavroritepageState();
}

class _FavroritepageState extends State<Favroritepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('favorite page'),
      ),
    );
  }
}