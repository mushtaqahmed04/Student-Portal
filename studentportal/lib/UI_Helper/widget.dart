import 'package:flutter/material.dart';
import 'package:studentportal/Authentication/student_panel/loginscreen.dart';
import 'package:studentportal/UI_Helper/Colors.dart';

class custom {
  static Images({required String img, double? height, double? width}) {
    return Image.asset(
      "assets/images/$img.png",
      fit: BoxFit.fill,
      height: height,
      width: width,
    );
  }

  static Fields (){
    return TextField(
    );
  }

  static Field({
    TextEditingController? controller,
    String? hintText,
    Widget? icon,
    required bool obscureText,
    VoidCallback? callback,
    String? error

  }) {
    return Center(
      child: Container(
        height: 45,
        width: 320,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ),
        child: Form(
          child: TextFormField(
            validator: (value){
              callback;
            },
            controller: controller,
            obscureText: obscureText,
            cursorColor: colors.pirmary,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: GestureDetector(
              onTap: callback,
              child: icon ?? Text("") ),
              focusColor: colors.pirmary,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.secondary),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.pirmary),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
