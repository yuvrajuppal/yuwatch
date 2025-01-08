import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:yuwatch/api_connection/api_connection.dart';
import 'package:yuwatch/authpages/loginandsignmainpage.dart';
import 'package:yuwatch/interpages/infoteller.dart';
import 'package:yuwatch/providers/fulldataprovider.dart';
import 'package:yuwatch/providers/sharedPreference.dart';
import 'package:http/http.dart' as http;

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  List<String>? recentid;

  Widget listbuild(List<String> id) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: id.length,
      itemBuilder: (context, index) {
        return FutureBuilder(
          future: fetchfavdata(id[index]),
          builder: (context, snapshot) {
            final movie = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('data  error ${snapshot.error}');
            } else if (snapshot.hasData) {
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
                child: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>InfotellerPage(id: movie.id!, web_movie: movie.movieorwebs!)));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: '${movie!.imagelink}'.trim(),
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                ),
              );
            } else {
              return Text('nodata found');
            }
          },
        );
      },
    );
  }
  void deleteacount()async{
    String? email,password;
    email = await shareprefhelper().getuseremail();
    password = await shareprefhelper().getuserpass();
    print(email!+" "+password!);
    try{
      var res = await http.post(Uri.parse(API.deleteusers), body: {
        'user_email': email.trim(),
        'user_password':password.trim(),
      });
      if(res.statusCode==200){
        logout();
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Internet or Server error')));

      }
    }catch(e){

    }
  }
  
  void logout() {
    shareprefhelper().saveLoginState(false);
    shareprefhelper().savefavlist([]);
    shareprefhelper().saveRecentmovie([]);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => mainloginsignupPage()));
  }

  String? email, display_username;

  void getshareprefinfo() {
    final providerobj = Provider.of<fulldataprovider>(context, listen: false);
    email = providerobj.useremail;
    display_username = email!.split('@')[0];
    recentid = providerobj.recentopenid.toSet().toList();
    recentid = recentid!.reversed.toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getshareprefinfo();
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
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isDismissible:
                                true, // Allows dismissing by tapping outside
                            enableDrag: true, // Allows swiping down to dismiss
                            backgroundColor: Color.fromARGB(201, 0, 0, 0),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                    // color: const Color.fromARGB(168, 0, 0, 0),
                                    ),
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 50,
                                                child: Icon(
                                                  Icons.manage_accounts,
                                                  size: 40,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  showModalBottomSheet(
                                                      isDismissible:
                                                          true, // Allows dismissing by tapping outside
                                                      enableDrag:
                                                          true, // Allows swiping down to dismiss
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              201, 0, 0, 0),
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          height: 250,
                                                          child: Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 20,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .delete_forever,
                                                                        color: Colors
                                                                            .red,
                                                                        size:
                                                                            50,
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return CupertinoAlertDialog(
                                                                                title: Text('Delete Account'),
                                                                                content: Text('Are you sure you want to delete your account?'),
                                                                                actions: [
                                                                                  TextButton(onPressed: () {
                                                                                    deleteacount();
                                                                                  }, child: Text('Yes')),
                                                                                  TextButton(onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  }, child: Text('No'))
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Delete Account',
                                                                          style: GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w800,
                                                                              fontSize: 28,
                                                                              color: Colors.red),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      size: 40,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        );
                                                      });
                                                },
                                                child: Text(
                                                  'Manage Account',
                                                  style: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 28,
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              size: 40,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            //  decoration: BoxDecoration(color: Colors.red),
                                            width: 50,
                                            child: Center(
                                              child: Icon(
                                                Icons.help_sharp,
                                                size: 40,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Help',
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 28,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 50,
                                            child: Center(
                                              child: Icon(
                                                Icons.logout,
                                                size: 40,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              logout();
                                            },
                                            child: Text(
                                              'Logout',
                                              style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 28,
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Icon(
                        Icons.settings,
                        size: 35,
                        color: const Color.fromARGB(240, 255, 255, 255),
                      ),
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
                  child: Center(
                    child: Text(
                      '$display_username',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          // fontStyle: FontStyle,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Recent Open',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          // fontStyle: FontStyle,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 200, child: listbuild(recentid!)),
                GestureDetector(
                  onTap: () {
                    final providerobj =
                        Provider.of<fulldataprovider>(context, listen: false);

                    print(providerobj.recentopenid.toSet().toList());
                  },
                  child: Container(
                    child: Text('click me'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
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
          throw Exception('no data found');
        }
      } else {
        throw Exception('fail to load data');
      }
    } catch (e) {
      throw Exception('error fetching');
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
