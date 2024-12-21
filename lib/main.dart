import 'package:flutter/material.dart';
import 'package:yuwatch/authpages/loginandsignmainpage.dart';
import 'package:yuwatch/bottom_navigation/bottomnavbar.dart';
import 'package:yuwatch/pages/homepage.dart';
import 'package:provider/provider.dart';
import 'package:yuwatch/providers/fulldataprovider.dart';
import 'package:yuwatch/providers/sharedPreference.dart';

// import 'package:yuwatch/authpages/homepage.dart';
// import 'package:yuwatch/authpages/login.dart';
// import 'package:yuwatch/authpages/loginandsignmainpage.dart';
// import 'package:yuwatch/pages/homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   final bool isLoggedIn = await  shareprefhelper().getLoginState();
   print(isLoggedIn);
    
  runApp(ChangeNotifierProvider(
    create: (BuildContext context)=>fulldataprovider(),
    child: MyApp(islogin: isLoggedIn,),
  ));
}

class MyApp extends StatelessWidget {
  final bool islogin;
  const MyApp({required this.islogin});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: islogin ? bottomnavbar() : mainloginsignupPage(),
    );
  }
}

