import 'package:edu_track/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSreen extends StatefulWidget {
  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  @override
  Widget build(BuildContext context) {
    var userName = TextEditingController();
    var password = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                child: Image.asset("assets/images/logo.png"),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: userName,
                decoration: InputDecoration(
                  hintText: "Username",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: BorderSide(
                      color: Colors.blue.shade900,
                      width: 2
                    )
                  )
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.text,
                controller: password,
                decoration:  InputDecoration(
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(
                            color: Colors.blue.shade900,
                          width: 2
                        )
                    )
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              }, child: Text("LOGIN"))
            ],
          ),
        ),
      ),
    );
  }
}