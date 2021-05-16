import 'package:flutter/material.dart';
import 'package:my_app/Models/user.dart';
import 'package:my_app/Screen/Authenticate/authenticate.dart';
import 'package:my_app/Screen/Authenticate/sign_in.dart';
import 'package:my_app/Screen/wrapper.dart';
import 'package:my_app/Services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
