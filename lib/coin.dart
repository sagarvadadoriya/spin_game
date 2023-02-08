import 'package:flutter/material.dart';

class coin extends StatefulWidget {
  const coin({Key? key}) : super(key: key);

  @override
  State<coin> createState() => _coinState();
}

class _coinState extends State<coin> {
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
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("My",
                    style: TextStyle(
                      color: Colors.white,
                      decorationColor: Colors.red,
                      fontSize: 30,
                    )),
                SizedBox(
                  width: 5,
                ),
                Text("STC",
                    style: TextStyle(
                      color: Colors.red,
                      decorationColor: Colors.red,
                      fontSize: 30,
                    )),
                SizedBox(
                  width: 5,
                ),
                Text("Coin",
                    style: TextStyle(
                      color: Colors.white,
                      decorationColor: Colors.red,
                      fontSize: 30,
                    )),
              ],
            ),
            SizedBox(height: 200,),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text("500",style:TextStyle(
                color: Colors.white,
                decorationColor: Colors.red,
                fontSize: 35,
              )),
            ),
            SizedBox(height: 10,),
            Icon(Icons.pause,color: Colors.white,),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              height: 45,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text("50/-INR",style:TextStyle(
                color: Colors.white,
                decorationColor: Colors.red,
                fontSize: 25,
              )),
            ),
            Spacer(),
            Text("Go To Game",style: TextStyle(
              color: Colors.white30,
              decorationColor: Colors.red,
              fontSize: 25,
            )),
            SizedBox(height: 10,),
            Text("Get Withdrawl",style: TextStyle(
              color: Colors.white30,
              decorationColor: Colors.red,
              fontSize: 28,
            )),
            SizedBox(height: 10,),
          ],
        ),
      )),
    );
  }
}
