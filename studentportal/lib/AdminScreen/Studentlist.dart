import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:studentportal/AdminScreen/Userscreen.dart';
import 'package:studentportal/Authentication/panel.dart';
import 'package:studentportal/Home_Screen/Clear/clear.dart';
import 'package:studentportal/Home_Screen/Course/Course.dart';
import 'package:studentportal/Home_Screen/GPA/cgpa.dart';
import 'package:studentportal/Home_Screen/Pending/pending.dart';
import 'package:studentportal/Home_Screen/home/HomeScreen.dart';
import 'package:studentportal/Home_Screen/scr/screen.dart';
import 'package:studentportal/Home_Screen/scr/screen1.dart';
import 'package:studentportal/Home_Screen/scr/screen2.dart';
import 'package:studentportal/UI_Helper/Button.dart';
import 'package:studentportal/UI_Helper/Colors.dart';
import 'package:studentportal/UI_Helper/text.dart';
import 'package:studentportal/UI_Helper/widget.dart';

class Adminstudentlist extends StatefulWidget {
  Adminstudentlist({super.key});

  @override
  State<Adminstudentlist> createState() => _AdminstudentlistState();
}

class _AdminstudentlistState extends State<Adminstudentlist> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController seatno = TextEditingController(); 

  String creator = "";

  Future <void> uploaddetail(String name , String seatno) async{
    try {
      await FirebaseFirestore.instance.collection("Section A").doc(name).set({
        "Name" : name,
        "Seat No" : seatno,
        "creator" : "yFEgztdYo4Uk5D3d6N12S1oKPC03"
      });
    } catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text("Enter email and password and other details",style: TextStyle(color: Colors.black,fontFamily: "popin"),)),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            elevation: 100,
            
            backgroundColor: Colors.white,
          ),
        );
    }
  }

    login(String email, String password,String? name,String? seatno) async {
    if (email == "" && password == "" && name == "" && seatno == "") {
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text("Enter email and password and other details",style: TextStyle(color: Colors.black,fontFamily: "popin"),)),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            elevation: 100,
            
            backgroundColor: Colors.white,
          ),
        );}
      else if(email == ""){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Enter provided Email",style: TextStyle(color: Colors.black,fontFamily: "popin"),),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            elevation: 100,
            
            backgroundColor: Colors.white,
          ),
        );
      }
      else if (password == ""){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Enter password",style: TextStyle(color: Colors.black,fontFamily: "popin")),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            elevation: 100,
            
            backgroundColor: Colors.white,
          ),
        );

        

    } 
    else if (name == ""){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Enter Name",style: TextStyle(color: Colors.black,fontFamily: "popin")),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            elevation: 100,
            
            backgroundColor: Colors.white,
          ),
        );
        
        

    }else if (seatno == ""){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Enter Seat No",style: TextStyle(color: Colors.black,fontFamily: "popin")),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
            elevation: 100,
            
            backgroundColor: Colors.white,
          ),
        );
        
        

    }else {
      UserCredential? userCredential;
      try {
        
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            content: Text(" Registration Successful",style: TextStyle(color: Colors.black,fontFamily: "popin"),),
            width: 310,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
            elevation: 100,
            
            backgroundColor: Colors.white,)
          );

          gotohome(context);
          
      } on FirebaseAuthException catch (ex) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(ex.message ?? "Registration Failed",style: TextStyle(color: colors.pirmary,fontFamily: "popin"),),
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
                MaterialPageRoute(builder: (context) => Studentlist()),
              );
  }

  void showDialogBox (BuildContext context){
    showDialog(
      context : context,
      builder : (context){
        return Container(
          height: 500,
          child: AlertDialog(
            actions: [
              custombutton.Add(text: "Register",width: 300,callback: (){
                  uploaddetail(name.text.trim(), seatno.text.trim());

                  login(email.text.toString(), password.text.toString(),name.text.toString(),seatno.text.toString());
              }),
              SizedBox(height: 10,),
              custombutton.Add(text: "Cancel",width: 300,callback: (){
                Navigator.pop(context);
                email.clear();
                name.clear();
                seatno.clear();
                password.clear();
              }),
            ],
            title: Column(
              children: [
                Text("Enter Student Detail",style: TextStyle(color: colors.pirmary,fontFamily: "popin"),),
                SizedBox(height: 30,),
                custom.Field(obscureText: false,hintText: "Enter Student email",controller: email),
                SizedBox(height: 30,),
                custom.Field(obscureText: true,hintText: "****************",controller: password),
                SizedBox(height: 30,),
                custom.Field(obscureText: false,hintText: "Enter Student Name",controller: name),
                SizedBox(height: 30,),
                custom.Field(obscureText: false,hintText: "Enter Seat No ",controller: seatno),
                SizedBox(height: 30,),

              ],
            )
          ),
        );
      }
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.pirmary,
        onPressed: () {
          showDialogBox(context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: colors.secondary,
        title: Center(
          child: Text("STUDENT  LIST", style: TextStyle(fontFamily: "popin_medium",color: Colors.white)),
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
      body: Studentlist(),
      
      );
  }
}

class Studentlist extends StatelessWidget {
  Studentlist({super.key});

  // List Student = ["","","","","",""];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("Section A").snapshots(),

      // where("creator", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      builder: (context, snapshot) {
        if (snapshot.connectionState==ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: colors.pirmary,
            ),
          );
        }
        else if (!snapshot.hasData){
          return Text ("No data");
        } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length , 
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Userscreen()));
                  },
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    tileColor: colors.grey,
                    leading: Text("${index+1}",style: TextStyle(fontSize: 15,fontFamily: "popin"),),
                    subtitle: Text(snapshot.data!.docs[index].data()["Seat No"],style: TextStyle(fontFamily: "popin"),),
                    title: Text(snapshot.data!.docs[index].data()["Name"],style: TextStyle(fontFamily: "popin")),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            }
          ),
        );
      }
      }
    );
  }
}

