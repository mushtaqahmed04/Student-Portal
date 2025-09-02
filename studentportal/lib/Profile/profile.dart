import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentportal/Home_Screen/home/HomeScreen.dart';
import 'package:studentportal/Navbar/Navbar.dart';
import 'package:studentportal/Profile/Editprofile.dart';
import 'package:studentportal/UI_Helper/Colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.secondary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Navbar()),
            );
          },
        ),
        title: Text(
          "                 Profile",
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
                    )
                  ],
                ),
              ),]))));

      // body: StreamBuilder(stream: FirebaseFirestore.instance.collection("User").snapshots(), builder: (context,snapshot){
      //    if (snapshot.connectionState == ConnectionState.active) {
      //     if (snapshot.hasData) {
      //       return
      //     } else if  (snapshot.hasError) {
      //       return Center(child: Text("${snapshot.hasError.toString()}"),);
      //     }
      //   }else{
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   }
      // }),
    
  }
}

