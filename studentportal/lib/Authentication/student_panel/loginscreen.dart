import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:studentportal/Authentication/student_panel/forgetpasseord.dart';
import 'package:studentportal/Navbar/Navbar.dart';
import 'package:studentportal/UI_Helper/Button.dart';
import 'package:studentportal/UI_Helper/Colors.dart';
import 'package:studentportal/UI_Helper/widget.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
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
            .signInWithEmailAndPassword(email: email, password: password);
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            content: Text("Login Successful",style: TextStyle(color: colors.pirmary,fontFamily: "popin"),),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            elevation: 100,
            
            backgroundColor: colors.secondary,)
          );
          gotohome(context);
          
      } on FirebaseAuthException catch (ex) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(ex.message ?? "Login Fail",style: TextStyle(color: colors.pirmary,fontFamily: "popin"),),
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
                MaterialPageRoute(builder: (context) => Navbar()),
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
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                duration: Duration(seconds: 1),
                                child: Forgetpasseord(),
                              ),
                            );
                          },
                          child: Text(
                            "Forget password",
                            style: TextStyle(fontFamily: "popinMedium",color: colors.pirmary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    custombutton.Add(
                      text: "LOG IN",
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
