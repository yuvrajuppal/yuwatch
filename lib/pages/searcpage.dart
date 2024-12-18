import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:yuwatch/api_connection/api_connection.dart';
import 'package:yuwatch/interpages/infoteller.dart';
// import 'package:yw_admin/displaypages/infoteller.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<List<dynamic>> searchItems(String query) async {
    final url = Uri.parse(
        API.search_data);

    try {
      final response = await http.post(url, body: {'word': query.trim()});

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load search results');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  List<dynamic> _searchResults = [];
  TextEditingController _controller = TextEditingController();

  void _performSearch(value) async {
    if (value.isNotEmpty) {
      final results = await searchItems(value);
      setState(() {
        _searchResults = results;
      });
    } else {
      setState(() {
        _searchResults = [];
      });
    }
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
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Search Movies',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    fontSize: 30,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Color(0xFF046FD2),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  onChanged: _performSearch,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(232, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final item = _searchResults[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfotellerPage(
                                      id: item['id'],
                                      web_movie: item['movieorwebs'],
                                    )));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              width: 90,
                              height: 110,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: item['imagelink'],
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
                                    item['allnames'],
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        // fontStyle: FontStyle,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    item['movieorwebs'],
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w800,
                                        // fontStyle: FontStyle,
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Category : " + item['category'],
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
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}



// ListTile(
//                       title: Text(item['allnames']),
//                       subtitle: Text(item['movieorwebs'] ?? ''),
//                     );