import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  List<String> favlist = [
    'https://m.media-amazon.com/images/M/MV5BN2E0OWRkNTAtZGQ4ZS00M2RiLWE5ODUtZWEyNzhlODU2NjhjXkEyXkFqcGc@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BNGY3N2ZhYmMtYTlmYi00ZWIzLWJiZWMtMjgxMjljYTk3MDAwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMTM0MDgwNjMyMl5BMl5BanBnXkFtZTcwNTg3NzAzMw@@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMGExNGI1NDktOWI2Mi00NDM3LWIxMmQtNTQxYTgzMzI0MTA1XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
  ];
  Widget listbuild(var datalist) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: datalist.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(right: 7, left: 7),
          width: 143,
          // height: 10,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0)
                      .withOpacity(0.5), // Shadow color with opacity
                  spreadRadius: 2, // Spread of the shadow
                  blurRadius: 8, // Blurriness of the shadow
                  offset: Offset(2, 4), // Offset of the shadow (x, y)
                )
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Text('lassan'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 200,
                  child: Text(
                    'Yuvraj Uppal',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w800,
                        // fontStyle: FontStyle,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    Text('My List', style: GoogleFonts.inter(
                        fontWeight: FontWeight.w800,
                        // fontStyle: FontStyle,
                        fontSize: 20,
                        color: Colors.white),),
                    Icon(Icons.arrow_forward_ios, size: 25, color: Colors.white,)

                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(height: 200, child: listbuild(favlist)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
