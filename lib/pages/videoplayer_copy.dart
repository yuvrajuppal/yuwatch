import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewExample22 extends StatefulWidget {
  
  const WebViewExample22({super.key});
  @override
  State<WebViewExample22> createState() => _WebViewExample22State();
}

class _WebViewExample22State extends State<WebViewExample22> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    var vidiveoUrl  = 'sd';
    String teraboxcode = vidiveoUrl.replaceFirst('https://1024terabox.com/s/1', '');
    // Initialize WebViewController
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.1024terabox.com/sharing/embed?surl=$teraboxcode&resolution=1080&autoplay=true&mute=false&uk=4400105884193&fid=91483455887823&slid=#tgWebAppData=query_id%3DAAEiGBxRAAAAACIYHFG9RV2r%26user%3D%257B%2522id%2522%253A1360795682%252C%2522first_name%2522%253A%2522GettingCrazyYT%2522%252C%2522last_name%2522%253A%2522%2522%252C%2522language_code%2522%253A%2522en%2522%252C%2522allows_write_to_pm%2522%253Atrue%252C%2522photo_url%2522%253A%2522https%253A%255C%252F%255C%252Ft.me%255C%252Fi%255C%252Fuserpic%255C%252F320%255C%252FBR1yQ_aDgZrJySXwBGSK4Wr2E22bv4KZUB9Z4eFhkSI.svg%2522%257D%26auth_date%3D1733910125%26signature%3Dj6Rrl2Xj6-1Lx_tJjA8nwiQxp85Yrd7G-ryBWOUUu4pKigh4BHdgFMvziO3tfZW4fUKD2kTVP3WBs16Gl-srBQ%26hash%3D3e2a29d71c9a61e6179287d3b52eb67de2c02d8841b93a87ca87f3332f399012&tgWebAppVersion=8.0&tgWebAppPlatform=weba&tgWebAppThemeParams=%7B%22bg_color%22%3A%22%23212121%22%2C%22text_color%22%3A%22%23ffffff%22%2C%22hint_color%22%3A%22%23aaaaaa%22%2C%22link_color%22%3A%22%238774e1%22%2C%22button_color%22%3A%22%238774e1%22%2C%22button_text_color%22%3A%22%23ffffff%22%2C%22secondary_bg_color%22%3A%22%230f0f0f%22%2C%22header_bg_color%22%3A%22%23212121%22%2C%22accent_text_color%22%3A%22%238774e1%22%2C%22section_bg_color%22%3A%22%23212121%22%2C%22section_header_text_color%22%3A%22%23aaaaaa%22%2C%22subtitle_text_color%22%3A%22%23aaaaaa%22%2C%22destructive_text_color%22%3A%22%23e53935%22%7D'));
    
    print('https://www.1024terabox.com/sharing/embed?surl=$teraboxcode&resolution=1080&autoplay=true&mute=false&uk=4400105884193&fid=91483455887823&slid=#tgWebAppData=query_id%3DAAEiGBxRAAAAACIYHFG9RV2r%26user%3D%257B%2522id%2522%253A1360795682%252C%2522first_name%2522%253A%2522GettingCrazyYT%2522%252C%2522last_name%2522%253A%2522%2522%252C%2522language_code%2522%253A%2522en%2522%252C%2522allows_write_to_pm%2522%253Atrue%252C%2522photo_url%2522%253A%2522https%253A%255C%252F%255C%252Ft.me%255C%252Fi%255C%252Fuserpic%255C%252F320%255C%252FBR1yQ_aDgZrJySXwBGSK4Wr2E22bv4KZUB9Z4eFhkSI.svg%2522%257D%26auth_date%3D1733910125%26signature%3Dj6Rrl2Xj6-1Lx_tJjA8nwiQxp85Yrd7G-ryBWOUUu4pKigh4BHdgFMvziO3tfZW4fUKD2kTVP3WBs16Gl-srBQ%26hash%3D3e2a29d71c9a61e6179287d3b52eb67de2c02d8841b93a87ca87f3332f399012&tgWebAppVersion=8.0&tgWebAppPlatform=weba&tgWebAppThemeParams=%7B%22bg_color%22%3A%22%23212121%22%2C%22text_color%22%3A%22%23ffffff%22%2C%22hint_color%22%3A%22%23aaaaaa%22%2C%22link_color%22%3A%22%238774e1%22%2C%22button_color%22%3A%22%238774e1%22%2C%22button_text_color%22%3A%22%23ffffff%22%2C%22secondary_bg_color%22%3A%22%230f0f0f%22%2C%22header_bg_color%22%3A%22%23212121%22%2C%22accent_text_color%22%3A%22%238774e1%22%2C%22section_bg_color%22%3A%22%23212121%22%2C%22section_header_text_color%22%3A%22%23aaaaaa%22%2C%22subtitle_text_color%22%3A%22%23aaaaaa%22%2C%22destructive_text_color%22%3A%22%23e53935%22%7D');
  
  
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
       
        body: Stack(
          children: [
            
            Positioned(
              top: 10,
              left: 10,
              child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 35,)),

            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: WebViewWidget(controller: _webViewController))
          ],
        ),
      ),
    );
  }
}
