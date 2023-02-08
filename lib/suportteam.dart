import 'package:flutter/material.dart';

class suportteam extends StatefulWidget {
  const suportteam({Key? key}) : super(key: key);

  @override
  State<suportteam> createState() => _suportteamState();
}

class _suportteamState extends State<suportteam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("image/1.jpg"))),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 5,),
              Text("Wel Come To",style: TextStyle(
        color: Colors.white,
          decorationColor: Colors.red,
          fontSize: 20,
        )),
              SizedBox(width: 5,),
              Text("STC",style: TextStyle(
                color: Colors.red,
                decorationColor: Colors.red,
                fontSize: 20,
              )),
                SizedBox(width: 5,),
              Text("Suport Team",style: TextStyle(
                color: Colors.white,
                decorationColor: Colors.red,
                fontSize: 20,
              )),
            ],),
            SizedBox(height: 20,),
            Row(
              children: [
              Container(alignment: Alignment.center,
                height: 100,
                width: 200,
                decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
                child: Text("recive mess......",style: TextStyle(
                  color: Colors.white,
                  decorationColor: Colors.red,
                  fontSize: 20,
                )),


              )
            ],

            ),
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Container(alignment: Alignment.center,
                height: 100,
                width: 200,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                child: Text("Sent mess......",style: TextStyle(
                  color: Colors.red,
                  decorationColor: Colors.red,
                  fontSize: 20,
                )),


              )
            ],

            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(alignment: Alignment.center,
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
                  child: Text("recive mess......",style: TextStyle(
                    color: Colors.white,
                    decorationColor: Colors.red,
                    fontSize: 20,
                  )),


                )
              ],

            ),
          ],
        ),
      )),
    );
  }
}
