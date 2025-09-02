import 'package:admin/UI_Helper/Button.dart';
import 'package:admin/UI_Helper/Colors.dart';
import 'package:admin/UI_Helper/widget.dart';
import 'package:admin/adminAuth/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInpanel extends StatefulWidget {
  const SignInpanel({super.key});

  @override
  State<SignInpanel> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<SignInpanel> {
  bool error = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _signInFormKey = GlobalKey<FormState>();
  login(String email, String password) async {
    if (email == "" && password == "") {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text("Enter email and password",style: TextStyle(color: colors.pirmary,fontFamily: "popin"),)),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            elevation: 100,
            
            backgroundColor: colors.secondary,
          ),
        );}
      else if(email == ""){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Enter provided Email",style: TextStyle(color: colors.pirmary,fontFamily: "popin"),),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            elevation: 100,
            
            backgroundColor: colors.secondary,
          ),
        );
      }
      else if (password == ""){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Enter password",style: TextStyle(color: colors.pirmary,fontFamily: "popin")),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            elevation: 100,
            
            backgroundColor: colors.secondary,
          ),
        );

    } else {
      UserCredential? userCredential;
      try {
        
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            content: Text("Sign up Successful",style: TextStyle(color: colors.pirmary,fontFamily: "popin"),),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
            elevation: 100,
            
            backgroundColor: colors.secondary,)
          );
          gotohome(context);
          
      } on FirebaseAuthException catch (ex) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(ex.message ?? "Sign up Failed",style: TextStyle(color: colors.pirmary,fontFamily: "popin"),),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            elevation: 100,
            backgroundColor: colors.secondary,));
        return print(ex.code.toString());
      }
    }
  }

  gotohome(BuildContext context){
     return Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Loginscreen()),
              );
  }

  bool _obsecure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _signInFormKey,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: custom.Images(img: "loginscreen-01"),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    custom.Images(img: "email1", height: 35, width: 90),
                    custom.Field(
                      hintText: " Enter provided email",
                      obscureText: false,
                      controller: email,
                    ),
                    SizedBox(height: 25),
                    custom.Images(img: "password", height: 35, width: 135),
                    custom.Field(
                      hintText: " ************",
                      controller: password,
                      obscureText: !_obsecure,
                      icon: Icon(
                        _obsecure ? Icons.visibility : Icons.visibility_off,
                      ),
                      callback: () {
                        setState(() {
                          _obsecure = !_obsecure;
                        });
                      },
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.topToBottom,
                                duration: Duration(milliseconds: 1500),
                                child: Loginscreen()
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "Already have a account?  ",
                                style: TextStyle(fontFamily: "popinMedium"),
                              ),
                              Text("Login",style: TextStyle(color: colors.pirmary,fontFamily: "popin"),)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    custombutton.Add(
                      text: "SIGN UP",
                      width: 320,
                      callback: () {
                        login(email.text.toString(), password.text.toString());
                      },
                    ),
                    // SizedBox(
                    //   height: 60,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
