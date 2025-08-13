import 'package:flutter/material.dart';
import 'package:studentportal/Authentication/adminpanel/adminpanel.dart';
import 'package:studentportal/Authentication/adminpanel/sign_UP_panel.dart';
import 'package:studentportal/Authentication/panel.dart';
import 'package:studentportal/Authentication/student_panel/forgetpasseord.dart';
import 'package:studentportal/Authentication/student_panel/loginscreen.dart';
import 'package:studentportal/Onboarding_Screen/pageview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...


void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignInpanel()
    );
  }
}