import 'package:flutter/material.dart';

final logoText = TextStyle(fontSize: 61);

Padding text(String title, Color? textColor, bool bold, double? height,double? lrp) {
  lrp=lrp?? 0.035;
  return Padding(
    padding: EdgeInsets.only(
      left: bold ? height! * (lrp/2) : height! * lrp,
      right: bold ? height * (lrp/2) : height * lrp,
    ),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: bold ? (height * 0.03) : (height * 0.0165),
        color: textColor ?? Colors.black,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}

Padding buttons(
  double _screenHeight,
  Color bgColor,
  Color txColor,
  double _screenWidth,
  String text,
  VoidCallback pressed, [
  Image? icons,
]) {
  return Padding(
    padding: EdgeInsets.only(top: _screenHeight * .02),
    child: Center(
      child: SizedBox(
        height: _screenHeight / 16,
        width: _screenWidth * .92,
        child: ElevatedButton(
          onPressed: () {
            pressed();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Color(0xffd7d7d7), width: 1),
            ),
          ),
          child: icons == null
              ? Text(text, style: TextStyle(color: txColor, fontSize: 21))
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _screenHeight*0.04,
                      width: _screenHeight*0.07,
                      child: icons,
                    ),
                    Text(text, style: TextStyle(color: txColor, fontSize: 21)),
                  ],
                ),
        ),
      ),
    ),
  );
}

OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1,color: Color(0xffd7d7d7))
            );
  }