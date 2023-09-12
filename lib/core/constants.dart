import 'package:flutter/material.dart';

Color white = Colors.white;
Color black = Colors.black;
Color purple = Color(0xFF7f30fe);

SizedBox height10 = SizedBox(height: 10.0);
SizedBox height20 = SizedBox(height: 20.0);

TextStyle commontext =
    TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle normaltext = TextStyle(color: black, fontSize: 18);
TextStyle smalltext =
    TextStyle(color: black, fontSize: 12, fontWeight: FontWeight.w500);
TextStyle textbuttonstyle =
    TextStyle(color: white, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle purpletext =
    TextStyle(color: purple, fontSize: 18, fontWeight: FontWeight.bold);

BoxDecoration textfielddecor = BoxDecoration(
  border: Border.all(width: 1.0, color: black.withOpacity(0.3)),
  borderRadius: BorderRadius.circular(10.0),
);
