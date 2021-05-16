import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF26A69A),
            Color(0xFF009688),
            Color(0xFF00897B),
            Color(0xFF00695C),
          ],
          stops: [0.1, 0.4, 0.7, 0.9],
        ),
      ),
      child: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
