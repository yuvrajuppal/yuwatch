import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF02396C), Color(0xFF046FD2)], // Gradient colors
              begin: Alignment.topCenter, // Start position
              end: Alignment.bottomCenter, // End position
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.settings, size: 35, color: Colors.white,),
                  SizedBox(width: 20,)
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
