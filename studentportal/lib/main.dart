import 'package:flutter/material.dart';
import 'package:studentportal/AdminScreen/AdminCourse.dart';
import 'package:studentportal/AdminScreen/HomeScreen.dart';
import 'package:studentportal/AdminScreen/Studentlist.dart';
import 'package:studentportal/AdminScreen/Userscreen.dart';
import 'package:studentportal/Authentication/adminpanel/Adminsignup.dart';
import 'package:studentportal/Authentication/adminpanel/adminLogin.dart';
import 'package:studentportal/Authentication/panel.dart';
import 'package:studentportal/Home_Screen/Course/Course.dart';
import 'package:studentportal/Home_Screen/Main/main.dart';
import 'package:studentportal/Home_Screen/home/HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studentportal/Home_Screen/scr/screen1.dart';
import 'package:studentportal/Home_Screen/scr/screen2.dart';
import 'package:studentportal/Navbar/Navbar.dart';
import 'package:studentportal/Onboarding_Screen/pageview.dart';
import 'package:studentportal/Profile/Editprofile.dart';
import 'package:studentportal/Profile/profile.dart';
import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Adminpanel()
    );
  }
}
