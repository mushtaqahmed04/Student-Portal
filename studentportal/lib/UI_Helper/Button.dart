import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentportal/UI_Helper/Colors.dart';

class custombutton {
  static Add({
    double? height,
    double? width,
    VoidCallback? callback,
    double? radius,
    Color? color,
    double? fontSize,
    Color? textcolor,
    String? fontstyle,
    required String text,
  }) {
    return Center(
      child: Container(
        height: height ?? 45,
        width: width ?? 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          color: color ?? colors.pirmary,
        ),
        child: TextButton(
          onPressed: callback,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize ?? 16,
                color: colors.secondary,
                fontFamily: "popin",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
