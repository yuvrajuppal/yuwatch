import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:yuwatch/api_connection/api_connection.dart';
import 'package:yuwatch/pages/videoplayer.dart';




class DownloadandstreamPage extends StatefulWidget {
  String id;
  DownloadandstreamPage({required this.id});

  @override
  State<DownloadandstreamPage> createState() => _DownloadandstreamPageState();
}

class _DownloadandstreamPageState extends State<DownloadandstreamPage> {
  String? id;

  Future<List<allmoviesdata>> fetchmovies() async {
    try {
      var response = await http.post(
          Uri.parse(API.getdownload_stream_links_by_id),
          body: {"id": '$id'});
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
    id = widget.id;
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
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 10, top: 40),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 35,
                            color: Colors.white,
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 40, right: 20),
                        child: GestureDetector(
                          onTap: () {
                          
                           setState(() {
                              fetchmovies();
                           });
                          },
                          child: Icon(
                            Icons.refresh_outlined,
                            size: 35,
                            color: Colors.white,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 40, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            
                          },
                          child: Icon(
                            Icons.add_link_outlined,
                            size: 35,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                Expanded(
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
                        final links = snapshot.data!;

                        return ListView.builder(
                            itemCount: links.length,
                            itemBuilder: (context, index) {
                              final linkdata = links[index];
                              return Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          linkdata.title,
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w700,
                                              // fontStyle: FontStyle,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 20),
                                            child: GestureDetector(
                                              onTap: () {
                                               
                                              },
                                              child: Icon(
                                                Icons.link_off,
                                                size: 25,
                                                color: Colors.white,
                                              ),
                                            )),
                                      ],
                                    ),
                                    Text(
                                      " quality " + linkdata.quality,
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w700,
                                          // fontStyle: FontStyle,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        right: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                               Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewExample(vidlink: linkdata.link,)));
                                              },
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                elevation: 8,
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Center(
                                                    child: Text(
                                                      'PLAY',
                                                      style: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          // fontStyle: FontStyle,
                                                          fontSize: 18,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Material(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              elevation: 8,
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Center(
                                                  child: Text(
                                                    'DOWNLOAD',
                                                    style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        // fontStyle: FontStyle,
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class allmoviesdata {
  String id, title, link, quality;
  allmoviesdata(
      {required this.id,
      required this.link,
      required this.quality,
      required this.title});

  factory allmoviesdata.fromJson(Map<String, dynamic> json) {
    return allmoviesdata(
      id: json['id'],
      title: json['title'],
      link: json['link'],
      quality: json['quality'],
    );
  }
}
