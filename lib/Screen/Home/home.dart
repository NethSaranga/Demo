import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Models/appUsers.dart';
import 'package:my_app/Screen/Home/drawer.dart';
import 'package:my_app/Screen/Home/user_list.dart';
import 'package:my_app/Services/auth.dart';
import 'package:my_app/Services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<AppUsers>>.value(
      value: DatabaseService().users,
      child: Scaffold(
        backgroundColor: Color(0xFF00897B),
        appBar: AppBar(
          title: Text('My demo app'),
          backgroundColor: Colors.black54,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: Text(''),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: UserList(),
        drawer: SideDrawer(),
      ),
    );
  }
}
