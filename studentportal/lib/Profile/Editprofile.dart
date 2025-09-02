import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentportal/Profile/Editprofile.dart';
import 'package:studentportal/Profile/profile.dart';
import 'package:studentportal/UI_Helper/Button.dart';
import 'package:studentportal/UI_Helper/Colors.dart';
import 'package:studentportal/UI_Helper/text.dart';
import 'package:studentportal/UI_Helper/widget.dart';


class Editprofile extends StatelessWidget {
  Editprofile({super.key});

  String name = "Mushtaq Ahmed";
  String fathername = "Ishtiaq Ahmed";
  String phone = "+923067699966";
  String seat = "EB24210106087";
  String email = "mushtaqjugnu04@gamil.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.secondary,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: Text(
          "             Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: colors.secondary,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 50,
          right: 50,
          top: 35,
          bottom: 30,
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: colors.secondary,
          child: Column(
            children: [
              SizedBox(height: 0),
              Container(
                width: 100,
                height: 100,
                // color: colors.pirmary,
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: colors.pirmary,
                      radius: 70,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/fonts/clear.png"),
                        radius: 48,
                        // backgroundColor: colors.secondary,
                        // child: Icon(
                        //   Icons.person,
                        //   size: 80,
                        //   color: colors.pirmary,
                        //   weight: 1,
                        // ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: colors.pirmary,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit, size: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              textFormField.add(Hint: "Student Name",hintText: name,icon: Icon(Icons.person_2_outlined,color: colors.pirmary,)),
              SizedBox(height: 18),
              textFormField.add(Hint: "Father Name",hintText: fathername,icon: Icon(Icons.person_2_outlined,color: colors.pirmary,)),
              SizedBox(height: 18),
              textFormField.add(Hint: "Phone Number",hintText: phone,icon: Icon(Icons.phone_outlined,color: colors.pirmary,)),
              SizedBox(height: 18),
              textFormField.add(Hint: "Seat No",hintText: seat,icon: Icon(Icons.person_2_outlined,color: colors.pirmary,)),
              SizedBox(height: 18),
              textFormField.add(Hint: "Email Address",hintText: email,icon: Icon(Icons.email_outlined,color: colors.pirmary,)),
              SizedBox(height: 50),
              custombutton.Add(text: "Save profile",radius: 25)
                  ],
                ),
              )
          ),
        );
  }
}