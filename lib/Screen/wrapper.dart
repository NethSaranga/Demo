import 'package:flutter/material.dart';
import 'package:my_app/Models/user.dart';
import 'package:my_app/Screen/Authenticate/authenticate.dart';
import 'package:my_app/Screen/Authenticate/sign_in.dart';
import 'package:provider/provider.dart';
import 'Home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
