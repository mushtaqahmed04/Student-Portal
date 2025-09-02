
import 'package:admin/AdminScreen/AdminCourse.dart';
import 'package:admin/AdminScreen/HomeScreen.dart';
import 'package:admin/AdminScreen/Pending/pending.dart';
import 'package:admin/AdminScreen/cgpa.dart';
import 'package:admin/AdminScreen/clear.dart';
import 'package:admin/UI_Helper/Button.dart';
import 'package:admin/UI_Helper/Colors.dart';
import 'package:admin/UI_Helper/widget.dart';
import 'package:admin/adminAuth/loginscreen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class Userscreen extends StatefulWidget {
  const Userscreen({super.key});

  @override
  State<Userscreen> createState() => _UserscreenState();
}

class _UserscreenState extends State<Userscreen> {
  int selectedIndex = 0;
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController seatno = TextEditingController();

  String creator = "";

  String? selectedValue;

  String? selectedHour;



  List<String> itemsHour = ["2 + 0","2 + 1","3 + 0","3 + 1"];

final List items = ["","",""];
// final List<DropdownMenuItem<String>> items = firebasedata.map<DropdownMenuItem<String>>((item) {
//   // Ensure the item is a String before using it
//   final String itemString = item as String;
//   return DropdownMenuItem<String>(
//     value: itemString,
//     child: Text(itemString),
//   );
// }).toList();

   @override
  // void initState() {
  //   super.initState();
  //   fetchCourseslist();
  // }

  // Future <void> fetchCourseslist() async {
  //     final doc = FirebaseFirestore.instance.collection("Courses").doc("Courses detail");
  //     final docsnapshot = await doc.get();

  //     if (docsnapshot.exists){
  //       setState(() {
  //         firebasedata = docsnapshot.data()?["course"];
  //       });
  //     }else{
  //       print("object");
  //     }
  // }



  static final List<Widget> screens = [
    AdminHomescreen(),
    AdminCourse(),
    Pending(),
    Clear(),
    cgpa()

   
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen()));
  }

  void showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Container(
          height: 500,
          child: AlertDialog(
            actions: [
              SizedBox(height: 10),
              custombutton.Add(
                text: "Cancel",
                width: 300,
                callback: () {
                  Navigator.pop(context);
                  email.clear();
                  name.clear();
                  seatno.clear();
                  password.clear();
                },
              ),
            ],
            title: Column(
              children: [
                Text(
                  "Enter Course Detail",
                  style: TextStyle(color: colors.pirmary, fontFamily: "popin"),
                ),
                SizedBox(height: 30),
                Center(
                  child: Column(
      children: [

                SizedBox(height: 30),
                Center(
                  child: Column(
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: const Row(
              children: [
                // Icon(Icons.,size: 20,),
                Text(
                  "Select Credit Hour",
                  style: TextStyle(fontFamily: "popin"),
                ),
              ],
            ),
            buttonStyleData: ButtonStyleData(
              height: 50,
              // width: 260,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(),
              ),
              elevation: 5,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 250,
              // width: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              offset: const Offset(0, -4),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                // thickness: MaterialStateProperty.all(6),
                // thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
            items: itemsHour.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text((item),style: TextStyle(fontFamily: "popin"),),
                  )],
                ),
              );
            }).toList(),
            value: selectedHour,
            onChanged: ( String? value) {
              // 3. Call setState() to update the selectedValue and rebuild the widget.
              setState(() {
                selectedHour = value;
              });
            },
          ),
        ),
      ],
    )
                ),
                SizedBox(height: 30),
                custom.Field(
                  obscureText:   false,
                  hintText: "     Course Id",
                  controller: seatno,
                ),
                SizedBox(height: 30),
                 custom.Field(
                  height: 50,
                  obscureText: false,
                  hintText: "     Marks",
                  controller: password,
                ),
              ],
            ),
          ),]
        )));
        
      },
    );
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
      backgroundColor: colors.secondary,
      body: screens[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.pirmary,
        onPressed: () {
          if (selectedIndex == 1) {
            return showDialogBox(context);
          } else {}
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: colors.secondary,
        title: Center(
          child: Text(
            "CGPA",
            style: TextStyle(fontFamily: "popin_medium", color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // height: 50,
              // width: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Color.fromRGBO(245, 120, 3, 1),
                ),
                shape: BoxShape.circle,
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
