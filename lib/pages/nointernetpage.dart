import 'package:flutter/material.dart';
import 'package:yuwatch/bottom_navigation/bottomnavbar.dart';

class Nointernetpage extends StatefulWidget {
  const Nointernetpage({super.key});

  @override
  State<Nointernetpage> createState() => _NointernetpageState();
}

class _NointernetpageState extends State<Nointernetpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff202124),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>bottomnavbar()));
                    },
                    child: Icon(Icons.refresh_outlined, color: Colors.white, size: 40,)),
                ],
              ),
              Expanded(
                child: Center(
                  child: Container(child: Image.asset('assets/images/NOINTERNET_IMG.png'),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}