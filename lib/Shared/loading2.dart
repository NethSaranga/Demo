import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: SpinKitCircle(
          color: Color(0xFF004D40),
          size: 50.0,
        ),
      ),
    );
  }
}
