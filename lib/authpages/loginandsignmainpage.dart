import 'package:flutter/material.dart';
import 'package:yuwatch/authpages/login.dart';
import 'package:yuwatch/authpages/signup.dart';

class mainloginsignupPage extends StatefulWidget {
  const mainloginsignupPage({super.key});

  @override
  State<mainloginsignupPage> createState() => _mainloginsignupPageState();
}

class _mainloginsignupPageState extends State<mainloginsignupPage> {
  bool login = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF02396C),
                    Color(0xFF046FD2)
                  ], // Gradient colors
                  begin: Alignment.topCenter, // Start position
                  end: Alignment.bottomCenter, // End position
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/bgimage.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width / 1.2,
                // height: 600,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    login ? loginpage() : signupPage(),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (login == true) {
                            login = false;
                         
                          } else {
                            login = true;
                          }
                        });
                           print(login);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.red
                            ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              login ?  'You are a new user? ' : 'Already have an account ? ',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.6)),
                            ),
                            Text(
                              login? 'Sign Up': 'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
