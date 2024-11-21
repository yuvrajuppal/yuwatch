import 'package:flutter/material.dart';

// import 'package:yuwatch/authpages/homepage.dart';
// import 'package:yuwatch/authpages/login.dart';
// import 'package:yuwatch/authpages/loginandsignmainpage.dart';
import 'package:yuwatch/pages/homepage.dart';


void main(){

  runApp(MaterialApp(
    home: MyWidget(),
  ));
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return homepage();
  }
}