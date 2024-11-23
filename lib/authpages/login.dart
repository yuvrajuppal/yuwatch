import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yuwatch/bottom_navigation/bottomnavbar.dart';
// import 'package:yuwatch/authpages/signup.dart';
import 'package:yuwatch/api_connection%20/api_connection.dart';

import 'package:http/http.dart' as http;

// import '../api_connection /api_connection.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String? email, password;
  TextEditingController email_controller = new TextEditingController();
  TextEditingController password_controller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  signupmethod() async {
    var res = await http.post(Uri.parse(API.login), body: {
      'user_email': email_controller.text.trim(),
      'user_password': password_controller.text.trim(),
    });
    if (res.statusCode == 200) {
      var resbody = jsonDecode(res.body);
      print('savedata made connection');
      if (resbody['login'] == true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('login sccessfully')));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => bottomnavbar()));
      }
      else{
            
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign In',
            style: TextStyle(
                color: Colors.white, fontSize: 35, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 2.5, bottom: 2.5),
            decoration: BoxDecoration(
                color: Color(0xFFC5C5C5).withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFFFFFFF))),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('PLease create a password')));
                } else {}
              },
              controller: email_controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hoverColor: Colors.white,
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.5))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 2.5, bottom: 2.5),
            decoration: BoxDecoration(
                color: Color(0xFFC5C5C5).withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFFFFFFF))),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('PLease create a password')));
                } else {}
              },
              controller: password_controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hoverColor: Colors.white,
                  hintText: 'Paswword',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.5))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => bottomnavbar()));
            },
            child: GestureDetector(
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    email = email_controller.text.trim();
                    password = password_controller.text.trim();
                  });

                  signupmethod();
                }
              },
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF046FD2),
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'OR',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF046FD2),
            ),
            child: Center(
              child: Text(
                'Sign In with Google',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Forget Password?',
            style: TextStyle(color: Colors.white.withOpacity(.6)),
          )
        ],
      ),
    );
  }
}
