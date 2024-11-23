import 'package:flutter/material.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  String? email, name, password;
  TextEditingController email_controller = new TextEditingController();
  TextEditingController name_controller = new TextEditingController();
  TextEditingController password_controller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700),
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
                        SnackBar(content: Text('PLease enter you Email')));
                  } else {}
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
                        SnackBar(content: Text('PLease enter you name')));
                  } else {}
                },
                controller: name_controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hoverColor: Colors.white,
                    hintText: 'Enter Name',
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
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(

                    border: InputBorder.none,
                    hoverColor: Colors.white,
                    hintText: 'Enter Paswword',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(.5))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    email = email_controller.text.trim();
                    name = name_controller.text.trim();
                    password = password_controller.text.trim();
                  });
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
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
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
            ),
          ]),
    );
  }
}
