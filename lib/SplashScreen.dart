import 'dart:async';

import 'package:edu_track/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double mOpacity = 0.0;
  double mProgressValue = 0.0;

  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(milliseconds: 10),(){
      setState(() {
        mOpacity = 1;
      });
    });

    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginSreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: AnimatedOpacity(
          opacity: mOpacity,
          duration: Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(height: 50,),
              Text("Learn, Progress & Succeed.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 100,),
              SizedBox(
                width: 300,
                child: LinearProgressIndicator(
                  minHeight: 4,
                  color: Color(0xff0D1C2E),
                  backgroundColor: Colors.grey.shade300,
                ),
              )
            ]
          ),
        ),
      )
    );
  }
}