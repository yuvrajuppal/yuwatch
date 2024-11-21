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
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.settings,
                    size: 35,
                    color: const Color.fromARGB(240, 255, 255, 255),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color(0xff046FD2),
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.people_alt_outlined,
                    size: 70,
                    color: const Color.fromARGB(240, 255, 255, 255),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
