import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var urlimage = [
    'https://m.media-amazon.com/images/M/MV5BMmUzOGZlNGItMGQ3ZC00ZDJkLWIwMDktM2U1NTM0NTkxYzk4XkEyXkFqcGc@._V1_.jpg',
    'https://m.media-amazon.com/images/I/7197L2XzWxL.jpg',
    'https://m.media-amazon.com/images/M/MV5BOWJhYjdjNWEtMWFmNC00ZjNkLThlZGEtN2NkM2U3NTVmMjZkXkEyXkFqcGc@._V1_.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFF046FD2),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'YuWatch',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Today Uploads',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        // fontStyle: FontStyle,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CarouselSlider.builder(
                    itemCount: urlimage.length,
                    itemBuilder: (context, index, realIndex) {
                      final movieposter = urlimage[index];
            
                      return ClipRRect(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                movieposter,
                                fit: BoxFit.cover,
                              )),
                        ),
                      );
                    },
                    options: CarouselOptions(
                        height: 400,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        autoPlayInterval: Duration(seconds: 8)),
                  ),
                ),
            
                // Image.network(urlimage[0])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
