import 'package:flutter/material.dart';

class Catagorymoviepage extends StatefulWidget {
  const Catagorymoviepage({super.key});

  @override
  State<Catagorymoviepage> createState() => _CatagorymoviepageState();
}

class _CatagorymoviepageState extends State<Catagorymoviepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('catagories movies')),
    );
  }
}