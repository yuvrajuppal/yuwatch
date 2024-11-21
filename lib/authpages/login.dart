import 'package:flutter/material.dart';
import 'package:yuwatch/bottom_navigation/bottomnavbar.dart';
// import 'package:yuwatch/authpages/signup.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: TextField(
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
          child: TextField(
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
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>bottomnavbar()));
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
    );
  }
}
