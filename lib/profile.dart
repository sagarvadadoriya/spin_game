import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("image/1.jpg"))),
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.amber,
                  foregroundImage: AssetImage("image/4.png"),
                ),
              ],
            ),
            Container(margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              height: 30,
              width: 300,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: Text("Sunny Gajera",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 300,
              decoration:
              BoxDecoration(border: Border.all(color: Colors.white)),
              child: Text("20 Years",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 300,
              decoration:
              BoxDecoration(border: Border.all(color: Colors.white)),
              child: Text("+91 90185-25284",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 300,
              decoration:
              BoxDecoration(border: Border.all(color: Colors.white)),
              child: Text("sunnygajera2003@gmail.com",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 300,
              decoration:
              BoxDecoration(border: Border.all(color: Colors.white)),
              child: Text("7272-7222-722",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 300,
              decoration:
              BoxDecoration(border: Border.all(color: Colors.white)),
              child: Text("History",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 300,
              decoration:
              BoxDecoration(border: Border.all(color: Colors.white)),
              child: Text("My STC Coin",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 300,
              decoration:
              BoxDecoration(border: Border.all(color: Colors.white)),
              child: Text("Log out",style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 10,),
            CircleAvatar(
              maxRadius: 100,
              backgroundColor: Colors.amber,
              foregroundImage: AssetImage("image/2.jpg"),
            )
          ]),
        ),
      ),
    );
  }
}
