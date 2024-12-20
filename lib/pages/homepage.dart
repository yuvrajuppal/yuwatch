import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yuwatch/api_connection/api_connection.dart';

import 'package:http/http.dart' as http;
import 'package:yuwatch/interpages/allcategorydisplay.dart';
import 'package:yuwatch/interpages/allmoviesandwebdisplay.dart';
import 'package:yuwatch/interpages/infoteller.dart';

// import 'package:yuwatch/videostreamer/videoplayer.dart';

class Displaypage extends StatefulWidget {
  const Displaypage({super.key});

  @override
  State<Displaypage> createState() => _DisplaypageState();
}

class allmoviesdata {
  String id, allnames, movieorwebs, imagelink, sno;
  allmoviesdata({
    required this.id,
    required this.allnames,
    required this.movieorwebs,
    required this.imagelink,
    required this.sno,
  });

  factory allmoviesdata.fromJson(Map<String, dynamic> json) {
    return allmoviesdata(
      id: json['id'],
      allnames: json['allnames'],
      movieorwebs: json['movieorwebs'],
      imagelink: json['imagelink'],
      sno: json['sno'],
    );
  }
}

class _DisplaypageState extends State<Displaypage> {
  Future<void> loadImageLinks() async {
    try {
      List<allmoviesdata> movies = await fetchmovies();
      urlimage = movies.map((movie) => movie.imagelink).toList();
    } catch (e) {
      print('Error fetching image links: $e');
    }
  }

  Future<List<allmoviesdata>> fetchmovies() async {
    try {
      var response = await http.get(Uri.parse(API.latest_uploads));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => allmoviesdata.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  List<String> urlimage = [];
  List<String> iddata = [];
  List<String> movieorwebs = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImageLinks();
  }

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
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('coming soon')));
                        },
                        child: Icon(
                          Icons.download,
                          size: 40,
                          color: Colors.white,
                        ),
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
                    'Latest Uploads',
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

                FutureBuilder(
                    future: fetchmovies(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child:
                                CircularProgressIndicator()); // Loading state
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error: ${snapshot.error}')); // Error state
                      } else if (snapshot.hasData) {
                        urlimage = snapshot.data!
                            .map((movie) => movie.imagelink)
                            .toList();

                        iddata =
                            snapshot.data!.map((movie) => movie.id).toList();

                        movieorwebs = snapshot.data!
                            .map((movie) => movie.movieorwebs)
                            .toList();
                        return Center(
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
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      InfotellerPage(
                                                        id: iddata[index],
                                                        web_movie:
                                                            movieorwebs[index],
                                                      )));
                                        },
                                        child: CachedNetworkImage(
                                          imageUrl: movieposter,
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
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
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.height,
                                autoPlayInterval: Duration(seconds: 8)),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    }),

                SizedBox(
                  height: 22,
                ),

                // ----------------------all  movies--------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'All Movies',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => allmoviespage(
                                        api_url: API.all_movies_data,
                                        appbar_name: 'All Movies',
                                      )));
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              // fontStyle: FontStyle,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 200,
                    child: listbuil(API.allmovies_or_webs_displaydata, 'movie',
                        'movieorwebs')),

                SizedBox(
                  height: 22,
                ),
                //  ---------------------------web series---------------
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => allmoviespage(
                                        api_url: API.all_webs_data,
                                        appbar_name: 'All Web Series',
                                      )));
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              // fontStyle: FontStyle,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 200,
                    child: listbuil(API.allmovies_or_webs_displaydata,
                        'webseries', 'movieorwebs')),
                SizedBox(
                  height: 22,
                ),
                //  ---------------------------netflix---------------

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Netflix',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Allcategorydisplay(
                                        api_url: API.all_category_show,
                                        appbar_name: 'Netflix',
                                        category: 'netflix',
                                      )));
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              // fontStyle: FontStyle,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 200,
                    child: listbuil(
                        API.all_category_display_data, 'netflix', 'category')),

                SizedBox(
                  height: 22,
                ),

                // ------------------------------------------prime---------------------------------------------

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Prime',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Allcategorydisplay(
                                        api_url: API.all_category_show,
                                        appbar_name: 'prime',
                                        category: 'prime',
                                      )));
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              // fontStyle: FontStyle,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 200,
                    child: listbuil(
                        API.all_category_display_data, 'prime', 'category')),

                SizedBox(
                  height: 22,
                ),

// ---------------------------------------------------------------------------------------

                // ------------------------------------------appletv---------------------------------------------

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'appletv',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Allcategorydisplay(
                                        api_url: API.all_category_show,
                                        appbar_name: 'appletv',
                                        category: 'appletv',
                                      )));
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              // fontStyle: FontStyle,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 200,
                    child: listbuil(
                        API.all_category_display_data, 'appletv', 'category')),

                SizedBox(
                  height: 22,
                ),

// ---------------------------------------------------------------------------------------

                // ------------------------------------------appletv---------------------------------------------

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'disney',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Allcategorydisplay(
                                        api_url: API.all_category_show,
                                        appbar_name: 'disney',
                                        category: 'disney',
                                      )));
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              // fontStyle: FontStyle,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 200,
                    child: listbuil(
                        API.all_category_display_data, 'disney', 'category')),

                SizedBox(
                  height: 22,
                ),

// ---------------------------------------------------------------------------------------

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

  Widget listbuil(String api, String movie_webs, String apibody) {
    return FutureBuilder<List<allmoviesdata>>(
        future: displaymovies_webs_fetchuser(api, movie_webs, apibody),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('no data fount'),
            );
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final rowdata = data[index];
                return Container(
                  margin: EdgeInsets.only(right: 7, left: 7),
                  width: 143,
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfotellerPage(
                                    id: rowdata.id,
                                    web_movie: rowdata.movieorwebs,
                                  )));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: rowdata.imagelink,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        });
  }

  Future<List<allmoviesdata>> displaymovies_webs_fetchuser(
      String api, String movie_webs, String apibody) async {
    var respose = await http.post(Uri.parse(api), body: {
      '$apibody': movie_webs,
    });
    if (respose.statusCode == 200) {
      final List<dynamic> data = jsonDecode(respose.body);
      return data.map((json) => allmoviesdata.fromJson(json)).toList();
    } else {
      throw Exception('fail to load data');
    }
  }
}
