import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:yuwatch/pages/catagorymoviepage.dart';
import 'package:yuwatch/pages/favroritepage.dart';
import 'package:yuwatch/pages/homepage.dart';
import 'package:yuwatch/pages/profilepage.dart';
import 'package:yuwatch/pages/searcpage.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  final screnns = [
    searchpage(),
    Catagorymoviepage(),
    homepage(),
    Favroritepage(),
    profilepage(),
  ];

  final navigatonkey = GlobalKey<CurvedNavigationBarState>();
  final item = <Widget>[
    Icon(
      Icons.search,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.movie,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.home,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.favorite,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.person,
      size: 30,
      color: Colors.white,
    )
  ];
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) => setState(() => this.index = index),
        index: index,
        key: navigatonkey,
        buttonBackgroundColor: Color.fromARGB(255, 3, 85, 163),
        color: Color(0xFF02396C),
        backgroundColor: Colors.transparent,
        items: item,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
      ),
      body: screnns[index],
    );
  }
}
