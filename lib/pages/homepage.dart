import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:yuwatch/videostreamer/onlinevideoplayer.dart';
import 'package:cached_network_image/cached_network_image.dart';

// import 'package:yuwatch/videostreamer/videoplayer.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> urlimage = [
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
                  height: 10,
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
                              child: GestureDetector(
                                onTap: () {
                                  if (movieposter == urlimage[2]) {}
                                },
                                child: CachedNetworkImage(
              imageUrl: movieposter,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
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
                SizedBox(
                  height: 22,
                ),

                // ----------------------all movies --------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'All Web Series',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Text(
                        'See All',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 200, child: listbuild(allmovies)),

                SizedBox(
                  height: 22,
                ),
                //  ---------------------------All web Series ---------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'All Web Series',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Text(
                        'See All',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 200, child: listbuild(webseries)),
                SizedBox(
                  height: 22,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'All Web Series',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Text(
                        'See All',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(height: 200, child: listbuild(netflix)),

                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> allmovies = [
    'https://m.media-amazon.com/images/M/MV5BMmUzOGZlNGItMGQ3ZC00ZDJkLWIwMDktM2U1NTM0NTkxYzk4XkEyXkFqcGc@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BZjJmMjJmYWMtNTQyYy00NzcxLWE5N2EtMTY5NjRhMGZmYjNlXkEyXkFqcGc@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BYWYyOGQzOGYtMGQ1My00ZWYxLTgzZjktZWYzN2IwYjkxYzM0XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BZWNjZWUwNDgtYTM4ZC00Zjk0LTg3ZWItNGEyZmVkZTIxZDk0XkEyXkFqcGc@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BZDMyYWU4NzItZDY0MC00ODE2LTkyYTMtMzNkNDdmYmFhZDg0XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BZjM2M2E3YzAtZDJjYy00MDhkLThiYmItOGZhNzQ3NTgyZmI0XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
  ];

  List<String> webseries = [
    'https://m.media-amazon.com/images/M/MV5BNjAzMDEzZmUtYjgzMy00NTYxLWJlODItYTMyZGI4YzdmZGY4XkEyXkFqcGc@._V1_QL75_UX190_CR0,2,190,281_.jpg',
    'https://m.media-amazon.com/images/M/MV5BM2FiMjQ0ZjAtYzc1OC00NzgzLWIyNmQtYmIwYjdhZWM5MmRiXkEyXkFqcGc@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMDcyZTNjOTEtNzc5Yy00Y2UzLThkMWYtNTY4YmM4OWI5OTMzXkEyXkFqcGc@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BNGI5MTljYTYtMjk0Yi00Yzc2LWJiZDktYTQwMjZkMDkzYjRhXkEyXkFqcGc@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BOWJhYjdjNWEtMWFmNC00ZjNkLThlZGEtN2NkM2U3NTVmMjZkXkEyXkFqcGc@._V1_.jpg',
  ];
  List<String> netflix = [
    'https://m.media-amazon.com/images/M/MV5BNzY4MzA4MmItMDQ3ZS00MzY5LWE4MDUtOGM3OTA1Yzc2MzQ4XkEyXkFqcGc@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BOWJhYjdjNWEtMWFmNC00ZjNkLThlZGEtN2NkM2U3NTVmMjZkXkEyXkFqcGc@._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMjRjODJlNzMtMDE3MS00NzNmLWI0OTQtMWE1NTNhNzkyYTFjXkEyXkFqcGc@._V1_.jpg',
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
            child: CachedNetworkImage(
              imageUrl: datalist[index],
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
