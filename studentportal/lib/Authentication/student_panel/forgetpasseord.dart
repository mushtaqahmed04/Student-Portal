import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studentportal/UI_Helper/Button.dart';
import 'package:studentportal/UI_Helper/widget.dart';

class Forgetpasseord extends StatelessWidget {
  Forgetpasseord({super.key});

  TextEditingController email = TextEditingController();

    forgetpassword(String email) async{
    if (email == ""){
      return print( "Enter a Email");
      } else {
        FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: custom.Images(img: "Forgetscreen"),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 15,),
                custom.Images(img: "email1",height: 35,width: 90),
                SizedBox(height: 6,),
                custom.Field(obscureText: false,controller: email,hintText: " Enter email"),
                SizedBox(
                  height: 30,
                ),custombutton.Add(text: "Reset Password",width: 320,callback: (){
                  forgetpassword(email.text.toString());
                }),
                SizedBox(
                  height: 90,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}