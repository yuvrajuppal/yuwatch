import 'package:flutter/material.dart';
import 'package:yuwatch/authpages/loginandsignmainpage.dart';
import 'package:yuwatch/bottom_navigation/bottomnavbar.dart';
import 'package:yuwatch/pages/homepage.dart';
import 'package:provider/provider.dart';
import 'package:yuwatch/providers/fulldataprovider.dart';

// import 'package:yuwatch/authpages/homepage.dart';
// import 'package:yuwatch/authpages/login.dart';
// import 'package:yuwatch/authpages/loginandsignmainpage.dart';
// import 'package:yuwatch/pages/homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context)=>fulldataprovider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: bottomnavbar(),
    );
  }
}

// sds