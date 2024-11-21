import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {

  final item = <Widget>[
    Icon(Icons.favorite,size: 30,),
    Icon(Icons.home,size: 30,),
     Icon(Icons.search,size: 30,),
        Icon(Icons.movie,size: 30,),
        Icon(Icons.person,size: 30,)

   

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(items: item),
      body: Center(
        child: Text('bottom nav page'),
      ),
    );
  }
}