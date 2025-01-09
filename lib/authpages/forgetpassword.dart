import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuwatch/authpages/loginandsignmainpage.dart';

class Forgetpasswordpage extends StatefulWidget {
  const Forgetpasswordpage({super.key});

  @override
  State<Forgetpasswordpage> createState() => _ForgetpasswordpageState();
}

class _ForgetpasswordpageState extends State<Forgetpasswordpage> {
  final _formkey = GlobalKey<FormState>();
  String? email, password;
  TextEditingController email_controller = new TextEditingController();
  TextEditingController password_controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forget Password',
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
                      SnackBar(content: Text('PLease Enter Email')));
                      return ' ';
                } else { return null;}
               
              },
              controller: email_controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hoverColor: Colors.white,
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.5))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {},
            child: GestureDetector(
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.blue,
                      content: Text(
                        'Reset Password Sended to Your Email',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => mainloginsignupPage()));
                } else {}
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
                    'Send Reset Link',
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
        ],
      ),
    );
  }
}
