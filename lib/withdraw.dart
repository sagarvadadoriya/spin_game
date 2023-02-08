import 'package:flutter/material.dart';

class withdraw extends StatefulWidget {
  const withdraw({Key? key}) : super(key: key);

  @override
  State<withdraw> createState() => _withdrawState();
}

class _withdrawState extends State<withdraw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("image/1.jpg"))),
          child: Column(
            children: [
              TextField(
                decoration:InputDecoration(hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  hintText: 'Enter your name',
                ),
              ),
              TextField(
                decoration:InputDecoration(hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  hintText: 'Adharcard Num',
                ),
              ),
              TextField(
                decoration:InputDecoration(hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  hintText: 'Bank Name',
                ),
              ),
              TextField(
                decoration:InputDecoration(hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  hintText: 'IFC Code',
                ),
              ),
              TextField(
                decoration:InputDecoration(hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  hintText: 'AC Num.',
                ),
              ),
              SizedBox(height: 20,),
              Row(children: [
                Text(" STC Coin",style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                )),
                Spacer(),
                Text("Currency ",style: TextStyle(
                  color: Colors.white,
                  decorationColor: Colors.red,
                  fontSize: 15,
                ))
              ],),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
                    child: Text("1000",style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                  ),
                  Text("=",style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  )),
                  Container(alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
                    child: Text("1000",style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                    child: Text("Convert",style: TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                    )),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
                    child: Text("100",style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                  ),
                  Container(alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
                    child: Text("200",style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
                    child: Text("400",style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                  ),
                  Container(alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
                    child: Text("500",style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(alignment: Alignment.center,
                    margin: EdgeInsets.all(20),
                    height: 30,
                    width: 220,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                    child: Text("Transfer Currency",style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    )),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
