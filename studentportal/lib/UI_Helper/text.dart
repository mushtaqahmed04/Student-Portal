import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentportal/Profile/Editprofile.dart';
import 'package:studentportal/UI_Helper/Colors.dart';


class textFormField{
 static add ({required String Hint, Widget? icon, String? hintText}){
  return  TextFormField(
    style: TextStyle(color: Colors.white,fontFamily: "popin"),
    autofocus: true,
          cursorColor: colors.pirmary,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: hintText,
                  disabledBorder: OutlineInputBorder(
                     borderRadius:BorderRadius.circular(25) ,
                    borderSide: BorderSide(color: colors.pirmary)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(25) ,
                    borderSide: BorderSide(color: colors.pirmary)
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: colors.pirmary),
                    borderRadius:BorderRadius.circular(25) 
                  ),
                  prefixIcon: icon,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: Text(Hint,style: TextStyle(color: colors.pirmary,fontFamily: "popin"),),
                ),
              );
 }

}