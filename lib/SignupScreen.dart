import 'package:edu_track/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  var name = TextEditingController();
  var emailId = TextEditingController();
  var phoneNo = TextEditingController();
  var instituteName = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10,20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              Text(
                "Welcome to EduTrack",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0D1C2E),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                keyboardType: TextInputType.text,
                controller: name,
                decoration: InputDecoration(
                  hintText: "Name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xff0D1C2E), width: 2),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.text,
                controller: instituteName,
                decoration: InputDecoration(
                  hintText: "Institute Name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xff0D1C2E), width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: phoneNo,
                decoration: InputDecoration(
                  hintText: "Phone no",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xff0D1C2E), width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailId,
                decoration: InputDecoration(
                  hintText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xff0D1C2E), width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: password,
                decoration: InputDecoration(
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xff0D1C2E), width: 2),
                  ),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 250,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async{

                    String mail = emailId.text.trim();
                    String pass = password.text.trim();

                    if(mail.isEmpty || pass.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter All The Fields")));
                    }else{
                     try{
                       await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: pass).then((value){
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered Successfully!!")));
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginSreen(),));
                       });
                     }catch(err){
                       print(err);
                     }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff0D1C2E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
