import 'package:flutter/material.dart';

final myHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'opensans',
);

final myLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'openSans',
);

final myLabelStyle2 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'openSans',
);

final myBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF004D40),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const textInputDecoration = InputDecoration(
    fillColor: Color(0xFF009688),
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0)));
