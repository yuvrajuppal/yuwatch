import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:yuwatch/interpages/infoteller.dart';
import 'package:yuwatch/providers/fulldataprovider.dart';


class allmoviespage extends StatefulWidget {
  String api_url,appbar_name;

   allmoviespage({required this.api_url, required this.appbar_name});

  @override
  State<allmoviespage> createState() => _allmoviespageState();
}

class _allmoviespageState extends State<allmoviespage> {
  int allmoviewswebdatalength = 0;
  String? appbar_name,api_url;

  Future<List<allmoviesdata>> fetchmovies() async {
    try {
      var response = await http.get(Uri.parse(api_url!));
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

  @override
  void initState() {
   
    // TODO: implement initState
    super.initState();
     allmoviewswebdatalength =
        Provider.of<fulldataprovider>(context, listen: false)
            .allmovieswebslength;
      appbar_name = widget.appbar_name;
api_url =widget.api_url;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              // height: 0,
              decoration: BoxDecoration(color: Color.fromARGB(255, 3, 97, 185)),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 10),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        '$appbar_name',
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
            ),
            Expanded(
              child: Stack(children: [
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
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: FutureBuilder<List<allmoviesdata>>(
                    future: fetchmovies(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('error ${snapshot.error}'),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text('no data found'),
                        );
                      } else {
                        final moviedata = snapshot.data!;
      
                        Provider.of<fulldataprovider>(context, listen: false)
                            .allmovieswebslength = moviedata.length;
      
                        // return ListView.builder(
                        //     itemCount: moviedata.length,
                        //     itemBuilder: (context, index) {
                        //       final data = moviedata[index];
                        //       return Text('name : ${data.allnames}');
                        //     });
      
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16.0,
                                    childAspectRatio: 0.6),
                            itemCount: moviedata.length,
                            itemBuilder: (context, index) {
                              final data = moviedata[index];
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>InfotellerPage(id: data.id, web_movie: data.movieorwebs,)));
                                },
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  elevation: 8.0,
                                  child: Container(
                                   
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                       color: Colors.black,
                                    ),
                                    height: 300,
                                    width: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: data.imagelink,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
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
