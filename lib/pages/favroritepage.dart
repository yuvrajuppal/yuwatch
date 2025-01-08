import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:yuwatch/api_connection/api_connection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yuwatch/interpages/infoteller.dart';
import 'package:provider/provider.dart';
import 'package:yuwatch/pages/nointernetpage.dart';
import 'package:yuwatch/providers/fulldataprovider.dart';

class Favroritepage extends StatefulWidget {
  const Favroritepage({super.key});

  @override
  State<Favroritepage> createState() => _FavroritepageState();
}

class _FavroritepageState extends State<Favroritepage> {
  List<String>? favlist;
 

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    valgetter();
  }

void valgetter()async{
  final providerobj = Provider.of<fulldataprovider>(context, listen: false);
  // favlist = await shareprefhelper().getfavlist();
  favlist = providerobj.favid;
}


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
        Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                'Fav List',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    color: Colors.white),
              ),
            ),
            
            Expanded(
              child: ListView.builder(
                  itemCount: favlist!.length,
                  itemBuilder: (context, index) {
                    final data = favlist![index];
                    return FutureBuilder<favdata>(future: fetchfavdata(data), builder: (context, snapshot){
                               if(snapshot.connectionState==ConnectionState.waiting){
                                    return Center(child: CircularProgressIndicator());

                               }    
                               else if(snapshot.hasError){
                                return Text('data  error ${snapshot.error}');
                               }         
                               else if(snapshot.hasData){
                                    final movie =  snapshot.data;
                                    return GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>InfotellerPage(id: movie.id!, web_movie: movie.movieorwebs!,)));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10, right: 10,bottom: 10),
                                        padding: EdgeInsets.only(top: 5, bottom: 5),
                                        decoration: BoxDecoration(color: const Color.fromARGB(255, 25, 113, 185), 
                                        
                                        
                                        borderRadius: BorderRadius.circular(20)),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 20),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(20)),
                                              width: 90,
                                              height: 110,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20),
                                                child: CachedNetworkImage(
                                                  imageUrl: '${movie!.imagelink}'.trim(),
                                                  placeholder: (context, url) => Center(
                                                      child: CircularProgressIndicator()),
                                                  errorWidget: (context, url, error) =>
                                                      Icon(Icons.error),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${movie.allnames}',
                                                    style: GoogleFonts.inter(
                                                        fontWeight: FontWeight.w700,
                                                        // fontStyle: FontStyle,
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    '${movie.movieorwebs}',
                                                    style: GoogleFonts.inter(
                                                        fontWeight: FontWeight.w800,
                                                        // fontStyle: FontStyle,
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    "Category : " + '${movie.category}',
                                                    style: GoogleFonts.inter(
                                                        fontWeight: FontWeight.w800,
                                                        // fontStyle: FontStyle,
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                               }else{
                                return Text('nodata found');
                               }
                    });
                  }),
            )
          ],
        ),
      ],
    ));
  }
void nointernetpage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Nointernetpage()));
  }
  Future<favdata> fetchfavdata(String id) async {
    
    try {
      var respose = await http.post(Uri.parse(API.favdatafinder), body: {
        'id': id.trim(),
      });
      if (respose.statusCode == 200) {
        final List<dynamic> data = jsonDecode(respose.body);
        if (data.isNotEmpty) {
          return favdata.fromJson(data.first);
        } else {
          nointernetpage();
          throw Exception('server error');
        }
      } else {
        nointernetpage();
        throw Exception('server error');
      }
    } catch (e) {
      nointernetpage();
      throw Exception('internet error');
    }
  }
}


class favdata {
  String? sno, id, allnames, movieorwebs, imagelink, category;
  favdata({
    required this.allnames,
    required this.category,
    required this.id,
    required this.imagelink,
    required this.movieorwebs,
    required this.sno,
  });

  factory favdata.fromJson(Map<String, dynamic> json) {
    return favdata(
        allnames: json['allnames'],
        category: json['category'],
        id: json['id'],
        imagelink: json['imagelink'],
        movieorwebs: json['movieorwebs'],
        sno: json['sno']);
  }
}
