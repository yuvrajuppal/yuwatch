import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:yuwatch/api_connection/api_connection.dart';
import 'package:yuwatch/interpages/downloadandstream.dart';
import 'package:provider/provider.dart';
import 'package:yuwatch/providers/fulldataprovider.dart';
import 'package:yuwatch/providers/sharedPreference.dart';

class InfotellerPage extends StatefulWidget {
  String id, web_movie;
  InfotellerPage({required this.id, required this.web_movie});

  @override
  State<InfotellerPage> createState() => _InfotellerPageState();
}

class _InfotellerPageState extends State<InfotellerPage> {
  String? getterid, web_movie;
  bool? myfav ;

  Future<allinfodata> fetchmovies() async {
    try {
      var response = await http.post(Uri.parse(API.getinfo_byID), body: {
        'id': getterid,
        'movieorwebs': web_movie,
      });
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          return allinfodata.fromJson(data.first);
        } else {
          throw Exception('no data fount');
        }
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }
  void addrecentmovies(){
      final providerobj = Provider.of<fulldataprovider>(context, listen: false);
 
      
      if(providerobj.recentopenid.contains(getterid)){
        providerobj.recentopenid.remove(getterid);
      }
      providerobj.recentopenid.add(getterid!);
      shareprefhelper().saveRecentmovie(providerobj.recentopenid.toSet().toList());

  }
  void getvals() {
    getterid = widget.id;
    web_movie = widget.web_movie;
    final providerobj = Provider.of<fulldataprovider>(context, listen: false);
    myfav  = providerobj.favid.contains(getterid);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvals();
    addrecentmovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blue,
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
            child: FutureBuilder<allinfodata>(
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
                } else if (snapshot.hasData) {
                  final info = snapshot.data!;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 55,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 35,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 150,
                            height: 250,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: info.imagelink,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '(${widget.web_movie})',
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            // fontStyle: FontStyle,
                                            fontSize: 18,
                                            color: Colors.white),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (myfav!) {
                                              setState(() {
                                                myfav = false;
                                                print(myfav);
                                              });
                                              final providerobj = Provider.of<fulldataprovider>(context, listen: false);
                                              providerobj.favid.remove(getterid!);
                                              shareprefhelper().savefavlist(providerobj.favid);

                                            } else {
                                              setState(() {
                                                myfav = true;
                                                print(myfav);
                                              });
                                              final providerobj = Provider.of<fulldataprovider>(context, listen: false);
                                              providerobj.favid.add(getterid!);
                                              shareprefhelper().savefavlist(providerobj.favid);
                                            }
                                          },
                                          child: Icon(
                                            myfav!
                                                ? Icons.favorite
                                                : Icons.favorite_outline,
                                            size: 35,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(info.moviename,
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w700,
                                          // fontStyle: FontStyle,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  Text(info.movieyear,
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          // fontStyle: FontStyle,
                                          fontSize: 15,
                                          color: Colors.white)),
                                  Text('Lang : ' + info.lang,
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w700,
                                          // fontStyle: FontStyle,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  Text('subtitle : ' + info.subtitle,
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w700,
                                          // fontStyle: FontStyle,
                                          fontSize: 18,
                                          color: Colors.white)),
                                  Text(
                                    'format : ' + info.format,
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        // fontStyle: FontStyle,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'size : ' + info.moviesize + "gb",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        // fontStyle: FontStyle,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'About',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              // fontStyle: FontStyle,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 20, right: 10),
                        child: Text(
                          info.info,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              // fontStyle: FontStyle,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30, left: 30),
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DownloadandstreamPage(
                                          id: info.id,
                                        )));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 8,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text('PLAY')),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30, left: 30),
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DownloadandstreamPage(
                                          id: info.id,
                                        )));
                          },
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 8,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text('DOWNLOAD')),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: Text('no data found'),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class allinfodata {
  String id,
      moviename,
      imagelink,
      lang,
      subtitle,
      moviesize,
      movieyear,
      info,
      format,
      category;
  allinfodata(
      {required this.id,
      required this.category,
      required this.format,
      required this.imagelink,
      required this.info,
      required this.lang,
      required this.moviename,
      required this.moviesize,
      required this.movieyear,
      required this.subtitle});

  factory allinfodata.fromJson(Map<String, dynamic> json) {
    return allinfodata(
      id: json['id'],
      moviename: json['moviename'],
      imagelink: json['imagelink'],
      lang: json['lang'],
      subtitle: json['subtitle'],
      moviesize: json['moviesize'],
      movieyear: json['movieyear'],
      info: json['info'],
      format: json['format'],
      category: json['category'],
    );
  }
}
