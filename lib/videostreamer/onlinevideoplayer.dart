import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Onlinevideoplayer extends StatefulWidget {
  const Onlinevideoplayer({super.key});

  @override
  State<Onlinevideoplayer> createState() => _OnlinevideoplayerState();
}

class _OnlinevideoplayerState extends State<Onlinevideoplayer> {
  late VideoPlayerController _videoPlayerController;
  final List<String> _videoUrls = [
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886180716347403/video.mp4?ex=673f92bf&is=673e413f&hm=ae845687d306dda7d83a3ecf26ea29a1c5e0a47e8a7c0fab2d33147ff6327881&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886197996617780/video.mp4?ex=673f92c3&is=673e4143&hm=e22fc9d7f4cb6a5911a4590d774c784bfa433ed1961100c5c2a30a0bf3638542&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886215570882611/video.mp4?ex=673f92c7&is=673e4147&hm=a8830f3bcca7e65ac177d038b7d66c7e5926c442e03c3c351b2768176be968e2&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886234063442000/video.mp4?ex=673f92cc&is=673e414c&hm=cb7fe83f42e1f854115ad8428ca02dda0a8442b93f86918d702171983167baba&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886255110455377/video.mp4?ex=673f92d1&is=673e4151&hm=9b3b8f982a9ea680d300265bf0169bd5d709d745d247e99458368bf9b32f2f30&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886271115919360/video.mp4?ex=673f92d4&is=673e4154&hm=3dd93bfa11458b6371171eee69863dc6528ef46c3eede7b619b21d240ac4f131&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886288912355399/video.mp4?ex=673f92d9&is=673e4159&hm=350f0cd24eec411a3e87a4c8938d1d87c49cb4863f792271a3a84fb404a69bb1&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886305970585631/video.mp4?ex=673f92dd&is=673e415d&hm=d33d76d5f82b4e9086abdb4f8a62db1e6062f503cd4a385d1c6f1d91232f78a8&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886322802589828/video.mp4?ex=673f92e1&is=673e4161&hm=86d49aaf0b963dbcc3433b693eb3fb12d1e85db8b6436a7be5e2c44a1feeaf66&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886340888432731/video.mp4?ex=673f92e5&is=673e4165&hm=a81e36033cfc8c0c844ff258f53e5b2041675a1148d9cb5a111b9f2ee6e6e2d0&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886355656310935/video.mp4?ex=673f92e9&is=673e4169&hm=a8401a5d9d4813ff5fd186c161c31c45bea0beb93bb75ce766d2f850174afe2e&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886375545835660/video.mp4?ex=673f92ed&is=673e416d&hm=0ccb64b66a2eed7f9fc41caf7fc0ca94c0402355f65a55e6e5d4cfd3289d2873&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886387361320990/video.mp4?ex=673f92f0&is=673e4170&hm=62ed7c4f7f03ea54b99dc3c5f0ff28b0d192bf6344296149486931c7cebea959&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886405287514185/video.mp4?ex=673f92f4&is=673e4174&hm=50ed718768c0e017818a39f2bc56bcffc56548bdc68c101ae9586bd9e8a697eb&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886421939163176/video.mp4?ex=673f92f8&is=673e4178&hm=7ed041fcdefe9cc7c7e9d3a638651abe3b56598831f3f2d2101dd09d638e5313&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886440209551400/video.mp4?ex=673f92fd&is=673e417d&hm=1596093df9969fb3ac3039f87cfbb63a421f41d81862ad44c6b78a7469fc095b&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886459016810626/video.mp4?ex=673f9301&is=673e4181&hm=99a682ac51c6645f99be68a3a76de10489397f49d37673f5b6867b0c9937be5e&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886476125110302/video.mp4?ex=673f9305&is=673e4185&hm=a5e711feaabc53041bbe08e7fa6e122f26ce89ceb0d55dd1ceedc7cca70b1f9a&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886489727369236/video.mp4?ex=673f9309&is=673e4189&hm=1a8ebcb0447074bdfa9075a33dcad416d83ff24f16b960e34edea585aed9703c&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886509092343889/video.mp4?ex=673f930d&is=673e418d&hm=eef6521bd50f8367a57556c2b01879a7d08a1b2064818bda4f2ad858ff2570c5&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886525861298278/video.mp4?ex=673f9311&is=673e4191&hm=38769e59bd0c12c840a76d986c0f2cf81f9186130e29767307a9b249a4df4a75&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886543913455760/video.mp4?ex=673f9316&is=673e4196&hm=bcaa93310286c76f381b010cb6abac97d0cc51b73b49bb9888a01276b48f170d&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886562062340156/video.mp4?ex=673f931a&is=673e419a&hm=accdca89568be55365c8c8bed78528e77511abdbec162b32188147c1e0a84e8b&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886580618067998/video.mp4?ex=673f931e&is=673e419e&hm=ce5bbcde52d266e220e58a42cfb1e424451caa799431b45bb869f7ee50f74a1e&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886598787797123/video.mp4?ex=673f9323&is=673e41a3&hm=7333218081ad8e55179d2b1ec57502630658fbd5381ac9363b455afb0aeb9346&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886617079152680/video.mp4?ex=673f9327&is=673e41a7&hm=3f28f8b08963480e59a7a7c8733758bd6507083ab3fceaebdccc40247570207f&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886632694288425/video.mp4?ex=673f932b&is=673e41ab&hm=77c1c2781f12a3794ba3305a33fb25e1bde43a2136387c8764cd55e3425ddce8&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886650486657239/video.mp4?ex=673f932f&is=673e41af&hm=5cff498b9500b0e66c364e9db39a9ef403788e7c699b0b99870824fcbfaa87be&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886670959181966/video.mp4?ex=673f9334&is=673e41b4&hm=b4d9867967b1fc86df47313f501f632f4d010bfaa081d13578f3bd4581732d2c&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886689774829689/video.mp4?ex=673f9338&is=673e41b8&hm=09d5c4e4ec432d7371a8faaa4e1ac037a7c1cd3d0964ecb113161203cb428b3f&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886704286990356/video.mp4?ex=673f933c&is=673e41bc&hm=8a5be384d45de52f816f4a369cceb2e25768d7fd3a6edc0f02b5cdc7796eb79d&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886722725023784/video.mp4?ex=673f9340&is=673e41c0&hm=4d9ed338d7975315df78a5666dfc40f66a41cd1514366e3166657d9079496260&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886740139900978/video.mp4?ex=673f9344&is=673e41c4&hm=83d8ed5f0d893c1d276aeb660dcace9a29fad5ca523825a2462410f3ea7b89ff&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886757189750864/video.mp4?ex=673f9348&is=673e41c8&hm=0e21dddf9e0d3c210649681dfbf9fe5399299b07134b36bed2559a5d0c85a893&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886775107944568/video.mp4?ex=673f934d&is=673e41cd&hm=7865d59161486c7588340070c2faf9d1cf67b0d6e54958c69e98c4279e0fa695&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886796263882884/video.mp4?ex=673f9352&is=673e41d2&hm=467f3ff1ef67a53bbf779814da609b4f0ba33d102ed024dd34eb663d740e339f&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886812940435518/video.mp4?ex=673f9356&is=673e41d6&hm=a13627825d8c1d8a2659a6df28b6699822df4c9373c5d6f47dbbb918cdeec16c&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886828710887516/video.mp4?ex=673f9359&is=673e41d9&hm=d73c73185f3f01584633566b9de0d4f34872e4ef57ada88d4868f3f24f59db14&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886844875870309/video.mp4?ex=673f935d&is=673e41dd&hm=6e22c59fb9615624b79db3afe24ef6f3d44c344172010d563f0669b189c1e8c5&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886860432408606/video.mp4?ex=673f9361&is=673e41e1&hm=d3ff74e904ea9b6928c7601868ab85ddf804703beee9dce2c35ada0871d6b8ec&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886878514315347/video.mp4?ex=673f9365&is=673e41e5&hm=5c393b784b54b0f77af08144ce9f972c15d42e2453e8deb5f71f8e18ad41f3b7&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886896646295604/video.mp4?ex=673f936a&is=673e41ea&hm=b03dc938648cb45d651365d958b0e7e99f5afb390c716e37e9a15fdb8938573a&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886915637973152/video.mp4?ex=673f936e&is=673e41ee&hm=0f37a37237ccedaff617991bc6d66717212ff6ff4598ee3a914a14265fce85e7&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886932566184040/video.mp4?ex=673f9372&is=673e41f2&hm=6b4db3d61321fa47db9970851f77207cabadf221cd792611646ae77efe5fd932&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886949074964713/video.mp4?ex=673f9376&is=673e41f6&hm=3c4a377f75160ff1d6e992e20e786c3dae88a25b1c67ba4030e7c25eccad4293&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886968821747742/video.mp4?ex=673f937b&is=673e41fb&hm=5311fb35a0873fb3a38e20340644430f5a2264e9513136fa94233e3838ac317e&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308886986177773569/video.mp4?ex=673f937f&is=673e41ff&hm=14a4bab3a240fcc5c08686c720a3a3a96eec804cd82fe05e1b1ee225336c8928&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887004917792788/video.mp4?ex=673f9383&is=673e4203&hm=855e145adc3f233cad7067a8885550e9d287a114641cb2d4c3357678e83dab5c&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887022974271528/video.mp4?ex=673f9388&is=673e4208&hm=8e2a339503d0832b8544e6150ae499dbe324dfe6e06460f9384c6b3529c5b322&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887044478730351/video.mp4?ex=673f938d&is=673e420d&hm=60bd1b80b3325b9f39c2403e7e4b27eae728a5627082ea78dcb91c9008a39bc9&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887061909995602/video.mp4?ex=673f9391&is=673e4211&hm=51a818e1e9373327cb723c33f89eca14388a7092ec7a7bef76dade96cc1f79b2&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887074719535164/video.mp4?ex=673f9394&is=673e4214&hm=ea63e938da752cc49c303f882e416ee9fee64eb1b30a2c344f44cfb3fe569a84&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887091479838840/video.mp4?ex=673f9398&is=673e4218&hm=79efb543abec4e66b13ccb60dc4b36e31428732a4c9ea6461acdf139031443bd&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887109192650834/video.mp4?ex=673f939c&is=673e421c&hm=220e13dde68b89c652701229025a1df44c1c56549d98538d88fdd69f3fb594f5&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887126598877286/video.mp4?ex=673f93a0&is=673e4220&hm=dc76d15cb461ce8cc1ce61f014d3e4366f17c461a5fc312aa22f2d67fff89858&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887137919307826/video.mp4?ex=673f93a3&is=673e4223&hm=418e84e1a730e8dd070577a8fad5596f13c2264f0a2ee0dd8c495c805e4fe7ac&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887148165988496/video.mp4?ex=673f93a6&is=673e4226&hm=05e8fd7abf450d0522d0390f7d12852432d499479dd5f57b8544bbed19d0b1e8&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887159876354078/video.mp4?ex=673f93a8&is=673e4228&hm=610f3a1a8e69ca8de099864d80c0bee51df68a6ba50d2a996f25808112c317d1&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887171960147988/video.mp4?ex=673f93ab&is=673e422b&hm=b693b906d36877361ba87d986844501ebecdf30e8dbbb48cd014bf13734a7462&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887183666577429/video.mp4?ex=673f93ae&is=673e422e&hm=cdfc9d127f8f2e0d15a2cdce6457455dd8ae5cb246fe5a4fd5dfb148af83b708&',
    'https://cdn.discordapp.com/attachments/1308591075803398238/1308887191090364488/video.mp4?ex=673f93b0&is=673e4230&hm=b8d892f4334048c70e3101269ca5d0bf7e18fcd99ce363a2c960c87d25ad73ca&'
  ];
  int _currentVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeVideo(_videoUrls[_currentVideoIndex]);
  }

  void _initializeVideo(String url) {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url))
      ..initialize().then((_) {
        _videoPlayerController.play();
        setState(() {});
      });

    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        _playNextVideo();
      }
    });
  }

  void _playNextVideo() {
    if (_currentVideoIndex < _videoUrls.length - 1) {
      _currentVideoIndex++;
      _videoPlayerController.dispose();
      _initializeVideo(_videoUrls[_currentVideoIndex]);
    } else {
      setState(() {
        // Handle when all videos are completed
        _currentVideoIndex = 0;
        _videoPlayerController.dispose();
        _initializeVideo(_videoUrls[0]);
      });
    }
  }

  void _playprevioisVideo() {
    if (_currentVideoIndex > 0) {
      _currentVideoIndex--;
      _videoPlayerController.dispose();
      _initializeVideo(_videoUrls[_currentVideoIndex]);
    } else {
      setState(() {
        // Handle when all videos are completed
        _currentVideoIndex = 0;
        _videoPlayerController.dispose();
        _initializeVideo(_videoUrls[0]);
      });
    }
  }

   void _playfromstartVideo() {
   
      _currentVideoIndex=0;
      _videoPlayerController.dispose();
      _initializeVideo(_videoUrls[_currentVideoIndex]);
   
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  IconData playpauseicon = Icons.pause_circle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF02396C), Color(0xFF046FD2)], // Gradient colors
                begin: Alignment.topCenter, // Start position
                end: Alignment.bottomCenter, // End position
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
              child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new))
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(color: Colors.black),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 1.5,
                child: _videoPlayerController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: 16 / 9,
                        child: VideoPlayer(_videoPlayerController),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      _playprevioisVideo();
                    },
                    child: Container(
                        child: Icon(
                      Icons.replay_30,
                      size: 40,
                      color: Colors.white.withOpacity(0.8),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (playpauseicon == Icons.pause_circle) {
                        _videoPlayerController.pause();
                      } else {
                        _videoPlayerController.play();
                      }
      
                      setState(() {
                        if (playpauseicon == Icons.pause_circle) {
                          playpauseicon = Icons.play_circle;
                        } else {
                          playpauseicon = Icons.pause_circle;
                        }
                      });
                    },
                    child: Container(
                      child: Icon(
                        playpauseicon,
                        size: 40,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _playNextVideo();
                      setState(() {
                        playpauseicon = Icons.pause_circle;
                      });
                    },
                    child: Container(
                        child: Icon(
                      Icons.forward_30,
                      size: 40,
                      color: Colors.white.withOpacity(0.8),
                    )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onDoubleTap: (){
      
                    },
                    onTap: () {
                     _playfromstartVideo();
                    },
                    child: Container(
                        child: Icon(
                      Icons.stop_circle,
                      size: 40,
                      color: Colors.white.withOpacity(0.8),
                    )),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Playing  ${(_currentVideoIndex + 1)/2}min of ${(_videoUrls.length)/2}min',
                ),
              ),
            ],
          )),
        ]),
      ),
    );
  }
}
