import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:spin_game/profile.dart';
import 'package:spin_game/suportteam.dart';
import 'package:spin_game/withdraw.dart';
import 'dart:math' as math;
import 'coin.dart';
import 'condition.dart';
import 'myfile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(MaterialApp(
    home: home(),
    debugShowCheckedModeBanner: false,
  ));
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  // reword ad
  Map<int,int> labels = {
    1: 1000,
    2: 400,
    3: 800,
    4: 7000,
    5: 5000,
    6: 300,
    7: 2000,
    8: 100,
  };
  @override
  void initState() {
    // TODO: implement initState
    print("hello");
    _createRewardedAd();
    super.initState();
  }
static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );


  int maxFailedLoadAttempts = 10;
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;
   _createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-6267822657052661/7625762431'
            : 'ca-app-pub-6267822657052661/7625762431',
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ));
  }
  void _showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();

      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
        });
    _rewardedAd = null;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  StreamController<int> controller = StreamController<int>();
  int win = 0;
  int count = 0;
  StreamController _dividerController = StreamController<int>();
  final _wheelNotifier = StreamController<double>();
  List test=[];
  @override
  void dispose() {
    // TODO: implement dispose
    _rewardedAd!.dispose();
    _dividerController.close();
    _wheelNotifier.close();
    print("Tesring");
    super.dispose();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "GO TO GAME",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return withdraw();
                        },
                      ));
                    },
                    child: Text(
                      "WITHDRAW",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return suportteam();
                        },
                      ));
                    },
                    child: Text(
                      "SUPPORT",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return coin();
                        },
                      ));
                    },
                    child: Text(
                      "MY COIN",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return condition();
                        },
                      ));
                    },
                    child: Text(
                      "TERMS & CONDITON",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return profile();
                        },
                      ));
                    },
                    child: Text(
                      "PROFILE",
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {},
                    child: Text(
                      "LOGOUT",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("image/1.jpg"))),
          child: Column(children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "STC COIN",
                        style: TextStyle(
                          color: Colors.white,
                          decorationColor: Colors.red,
                          fontSize: 15,
                        ),
                      )),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("${win}"),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  SpinningWheel(
                    Image.asset('image/roulette-8-300.png'),
                    width: 310,
                    height: 310,
                    initialSpinAngle: _generateRandomAngle(),
                    spinResistance: 0.6,
                    canInteractWhileSpinning: false,
                    dividers: 8,
                    onUpdate: _dividerController.add,
                    onEnd: (value1){
                      print("SAgar:${value1}");
                      if(value1!=null) {
                        win = win + int.parse(labels[value1].toString());
                        setState(() {});
                      }
                    },
                    secondaryImage:
                        Image.asset('image/roulette-center-300.png'),
                    secondaryImageHeight: 110,
                    secondaryImageWidth: 110,
                    shouldStartOrStop: _wheelNotifier.stream,

                  ),
                  SizedBox(height: 30),
                  // StreamBuilder(
                  //   stream: _dividerController.stream,
                  //   builder: (context, snapshot) {
                  //     print(snapshot.connectionState);
                  //     if(snapshot.hasData)
                  //       {
                  //         print(snapshot.data);
                  //         print("Good Afternoon");
                  //         return RouletteScore(snapshot.data);
                  //       }else
                  //         {
                  //           print("Good MOrning");
                  //           return Container();
                  //         }
                  //   },
                  //
                  // ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (count<=2) {
                          _wheelNotifier.sink.add(_generateRandomVelocity());
                          count++;
                          setState(() {});
                        }
                        else if (count > 2) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  height: 250,
                                  width: 350,
                                  child: Column(children: [
                                    Expanded(
                                      child: Text(
                                        "Watch The Ad And It One Spin..!",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    Expanded(child: SizedBox(height: 10,)),
                                    Expanded(flex: 2,
                                      child: Row(
                                        children: [
                                          Text("You",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 40)),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 60,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.red[600],
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text("Tube",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40)),
                                          ),
                                          Text("Ads",
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                    Expanded(child: SizedBox(height: 10,)),
                                    Text("+1",
                                        style: TextStyle(
                                            color: Colors.red[900],
                                            fontSize: 50)),
                                    Expanded(flex: 2,
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(onTap: () {
                                            Navigator.pop(context);
                                          },
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: Colors.red[900],
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                              child: Text("Cancle",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20)),
                                            ),
                                          ),
                                          InkWell(onTap: () {
                                            _showRewardedAd();
                                             Navigator.pop(context);
                                             setState(() {
                                               count--;
                                             });
                                          },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: Colors.red[900],
                                                  borderRadius:
                                                  BorderRadius.circular(20)),
                                              child: Text("Get It",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: CircleAvatar(
                        foregroundImage: AssetImage("image/play.jpg"),
                        maxRadius: 50,
                      ))
                ],
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Icon(
                      Icons.dehaze_rounded,
                      size: 30,
                      color: Colors.red,
                    ))
              ],
            ))
          ]),
        ),
      ),
    );
  }

  double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

// class RouletteScore extends StatefulWidget {
//   final int selected;
//
//   RouletteScore(this.selected);
//   static int demo=0;
//
//   @override
//   State<RouletteScore> createState() => _RouletteScoreState();
// }
//
// class _RouletteScoreState extends State<RouletteScore> {
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     RouletteScore.demo=RouletteScore.demo+labels[widget.selected]!;
//   }
//
//   final Map<int,int> labels = {
//     1: 1000,
//     2: 400,
//     3: 800,
//     4: 7000,
//     5: 5000,
//     6: 300,
//     7: 2000,
//     8: 100,
//   };
//   @override
//   Widget build(BuildContext context) {
//     RouletteScore.demo=RouletteScore.demo+labels[widget.selected]!;
//     return  Text('${labels[widget.selected]}',
//         style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0,color: Colors.white));;
//   }
// }





