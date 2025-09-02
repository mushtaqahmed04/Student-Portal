import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:studentportal/Authentication/adminpanel/adminLogin.dart';
import 'package:studentportal/Authentication/student_panel/loginscreen.dart';
import 'package:studentportal/UI_Helper/Button.dart';
import 'package:studentportal/UI_Helper/widget.dart';

class Panel extends StatelessWidget {
  const Panel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: custom.Images(img: "panel screen-01"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 20),
              custombutton.Add(
                text: "LOGIN AS ADMIN",
                callback:
                    () => Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.topToBottom,
                        duration: Duration(seconds: 1),
                        child: Adminpanel(),
                      ),
                    ),
              ),
              SizedBox(height: 15),
              custombutton.Add(
                text: "LOGIN AS STUDENT",
                callback:
                    () => Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.bottomToTop,
                        duration: Duration(seconds: 1),
                        child: Loginscreen(),
                      ),
                    ),
              ),
              SizedBox(height: 70),
            ],
          ),
        ],
      ),
    );
  }
}
