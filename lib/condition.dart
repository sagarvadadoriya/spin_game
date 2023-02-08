import 'package:flutter/material.dart';

class condition extends StatefulWidget {
  const condition({Key? key}) : super(key: key);

  @override
  State<condition> createState() => _conditionState();
}

class _conditionState extends State<condition> {
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
            height: 20,
          ),
          CircleAvatar(
            maxRadius: 100,
            backgroundColor: Colors.amber,
            foregroundImage: AssetImage("image/2.jpg"),
          ),
         Spacer(),
          Container(
            height: 400,
            width: 300,
            color: Colors.white30,
            child: Column(children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Terms and Condition",
                      style: TextStyle(
                        color: Colors.white,
                        decorationColor: Colors.red,
                        fontSize: 20,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(margin: EdgeInsets.all(20),
                child: Text(
                  "Terms and Conditio"
                      "nTerms and ConditionTerms and ConditionTerms and ConditionTer"
                      "ms and ConditionTerms and ConditionTerms and ConditionTerms and ConditionTer"
                      "ms and ConditionTerms and ConditionTerms and ConditionTerms and ConditionTerms an"
                      "d ConditionTerms and ConditionTerms and ConditionTerms and ConditionTerms and ConditionTe"
                      "rms and ConditionTerms and ConditionTerms and ConditionTerms and ConditionTerms and Condition"
                      "Terms and ConditionTerms and ConditionTerms and ConditionTerms and ConditionTerms and Conditio",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Spacer(),
              Container(alignment: Alignment.center,
                height: 35,
                decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
                child: Text("Agree & Play",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
              ),
            ]),
          ),
          SizedBox(height: 20,)
        ]),
      )),
    );
  }
}
