import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:studentportal/Authentication/panel.dart';
import 'package:studentportal/Home_Screen/Clear/clear.dart';
import 'package:studentportal/Home_Screen/Course/Course.dart';
import 'package:studentportal/Home_Screen/GPA/cgpa.dart';
import 'package:studentportal/Home_Screen/Pending/pending.dart';
import 'package:studentportal/Home_Screen/home/HomeScreen.dart';
import 'package:studentportal/Home_Screen/scr/screen.dart';
import 'package:studentportal/Home_Screen/scr/screen1.dart';
import 'package:studentportal/Home_Screen/scr/screen2.dart';
import 'package:studentportal/UI_Helper/Colors.dart';
import 'package:studentportal/UI_Helper/widget.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;

  static final List<Widget> screens = [
    Homescreen(),
    Course(),
    Clear(),
    cgpa(),
    Pending(),
    Screen(),
    Screen1(),
    Screen2(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  signout() {
    FirebaseAuth.instance.signOut();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Logout Successful",
          style: TextStyle(color: colors.pirmary, fontFamily: "popin"),
        ),
        width: 310,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        elevation: 100,

        backgroundColor: colors.secondary,
      ),
    );
    gotohome(context);
  }

  gotohome(BuildContext) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Panel()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(backgroundColor: colors.grey, child: Scaffold()),

      // Container(
      //   child: NavigationDrawer(
      //     backgroundColor: colors.grey,
      //     children: [
      //       // buildNavdrawerItem("test", "  semester", 5),
      //       // buildNavdrawerItem("test", "  semester", 6),
      //       // buildNavdrawerItem("test", "  semester", 7),
      //       // // buildNavdrawerItem("test", "  semester", 8),
      //       // // buildNavdrawerItem("test", "  semester", 9),
      //       boxs(icon: "test", label: "home", callback: Screen1()),
      //     ],
      //   ),
      // ),
      backgroundColor: colors.grey,
      body: screens[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.pirmary,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: colors.grey,
        title: Center(
          child: Text("CGPA", style: TextStyle(fontFamily: "popin_medium")),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // height: 50,
              // width: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5,color: 
                                Color.fromRGBO(245, 120, 3, 1),
                 ),
                shape: BoxShape.circle
              ),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage("assets/images/180746319.jpeg"),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
        child: BottomAppBar(
          elevation: 50,
          shadowColor: Colors.black,
          // BoxShadow(color: Colors.black12, blurRadius: 10),
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          ),
          color: Colors.white,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavbarItem("home-button", "Home", 0),
              buildNavbarItem("test", "Course", 1),
              SizedBox(width: 30),
              buildNavbarItem("time-management", "pending", 3),
              buildNavbarItem("user", "Profile", 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavbarItem(String icon, String label, int index) {
    return InkWell(
      onTap: () => onItemTapped(index),
      child: Column(
        children: [
          custom.Images(
            img: icon,
            height: 26,
            color: selectedIndex == index ? colors.pirmary : Colors.black,
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: "popin",
              fontSize: 14,
              color: selectedIndex == index ? colors.pirmary : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget boxs({
    required String icon,
    required String label,
    int? index,
    required Widget callback,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => callback),
        );
        Navigator.pop(context);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: selectedIndex == index ? colors.pirmary : null,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              custom.Images(
                img: icon,
                height: 35,
                color: selectedIndex == index ? Colors.white : Colors.black,
              ),
              Text(
                label,
                style: TextStyle(
                  fontFamily: "popin",
                  fontSize: 22,
                  color: selectedIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavdrawerItem(String icon, String label, int index) {
    return InkWell(
      onTap: () => onItemTapped(index),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 40,
          top: 10,
          bottom: 10,
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: selectedIndex == index ? colors.pirmary : null,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                custom.Images(
                  img: icon,
                  height: 35,
                  color: selectedIndex == index ? Colors.white : Colors.black,
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: "popin",
                    fontSize: 22,
                    color: selectedIndex == index ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
