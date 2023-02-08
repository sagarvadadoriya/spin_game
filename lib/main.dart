import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';

import 'package:spin_game/profile.dart';
import 'package:spin_game/suportteam.dart';
import 'package:spin_game/withdraw.dart';
import 'dart:math' as math;
import 'coin.dart';
import 'condition.dart';

void main() {
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

class _homeState extends State<home>  with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  StreamController<int> controller = StreamController<int>();
  int win = 0;
  StreamController _dividerController = StreamController<int>();
  final _wheelNotifier = StreamController<double>();

  @override
  void dispose() {
    // TODO: implement dispose
    _dividerController.close();
    _wheelNotifier.close();
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
               Row(mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                 IconButton(onPressed: () {
                   Navigator.pop(context);
                 }, icon: Icon(Icons.close))
               ],),
                SizedBox(height: 50,),
                InkWell(onTap: () {Navigator.pop(context);}, child: Text("GO TO GAME",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 10,),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return withdraw();
                  },));
                }, child: Text("WITHDRAW",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 10,),
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return suportteam();
                  },));
                }, child: Text("SUPPORT",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 10,),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return coin();
                  },));
                }, child: Text("MY COIN",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 10,),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return condition();
                  },));
                }, child: Text("TERMS & CONDITON",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 10,),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return profile();
                  },));
                }, child: Text("PROFILE",style: TextStyle(color: Colors.white),)),
                SizedBox(height: 10,),
                InkWell(onTap: () {
                }, child: Text("LOGOUT",style: TextStyle(color: Colors.white),)),
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
              child:Column(
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
                    onEnd: _dividerController.add,
                    secondaryImage:
                    Image.asset('image/roulette-center-300.png'),
                    secondaryImageHeight: 110,
                    secondaryImageWidth: 110,
                    shouldStartOrStop: _wheelNotifier.stream,
                  ),
                  SizedBox(height: 30),
                  StreamBuilder(
                    stream: _dividerController.stream,
                    builder: (context, snapshot) =>
                    snapshot.hasData ? RouletteScore(snapshot.data) : Container(),
                  ),
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
                        _wheelNotifier.sink.add(_generateRandomVelocity());
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
class RouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: '1000\$',
    2: '400\$',
    3: '800\$',
    4: '7000\$',
    5: '5000\$',
    6: '300\$',
    7: '2000\$',
    8: '100\$',
  };

  RouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0));
  }
}