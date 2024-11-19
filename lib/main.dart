import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: MyWidget(),
  ));
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}