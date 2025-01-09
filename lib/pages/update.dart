import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdatePage extends StatefulWidget {
  String download_url;
   UpdatePage({required this.download_url});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String?download_url;

  getdownloadlink(){
    download_url = widget.download_url;
  }
  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
    getdownloadlink();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF046FD2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Update your Application',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  // fontStyle: FontStyle,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          Text(
            '(Download and Reinstall',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                // fontStyle: FontStyle,
                fontSize: 18,
                color: Colors.white),
          ),
          Text(
            ' the app to get the latest version.)',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                // fontStyle: FontStyle,
                fontSize: 18,
                color: Colors.white),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              launchUrl(Uri.parse('$download_url'));
            },
            child: Material(
              elevation: 8.0,
               borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                width: 300,
                height: 50,
                child: Center(
                  child: Text(
                    'Download',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        // fontStyle: FontStyle,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Future<void> openLink(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication, // Ensures it opens in an external browser
  )) {
    throw Exception('Could not launch $url');
  }
}
}
