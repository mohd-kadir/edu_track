import 'package:edu_track/HomeScreen.dart';
import 'package:edu_track/SignupScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginSreen extends StatefulWidget {
  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  var userName = TextEditingController();
  var password = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + kToolbarHeight)
          ),
          child: IntrinsicHeight(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo.png",height: 250, width: 250,fit: BoxFit.cover,),
                    SizedBox(height: 40),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: userName,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Username",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Color(0xff0D1C2E), width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      keyboardType: TextInputType.text,
                      obscureText: _obscureText,
                      controller: password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        }, icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,)),
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

                          String mail = userName.text.trim();
                          String pass = password.text.trim();

                          if(mail.isEmpty || pass.isEmpty){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter All the Fields")));
                          }else{
                            try{
                              await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail, password: pass).then((value){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfully!!")));
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                              });
                            }on FirebaseAuthException catch(err){
                              String errorMessage;
                              if (err.code == 'wrong-password') {
                                errorMessage = "Invalid Password";
                              } else if (err.code == 'user-not-found') {
                                errorMessage = "No user found with this email";
                              } else if (err.code == 'invalid-email') {
                                errorMessage = "Invalid Email";
                              } else {
                                errorMessage = "Login Failed. ${err.message}";
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(errorMessage))
                              );
                            }catch (e) {
                              // Any other errors
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Something went wrong"))
                              );
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
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('OR'),
                        ),
                        Expanded(child: Divider(thickness: 1,))
                      ],
                    ),
                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        InkWell(onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                        } ,child: Text("Sign Up",style: TextStyle(color: Color(0xffE3A01F),fontWeight: FontWeight.bold),))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
