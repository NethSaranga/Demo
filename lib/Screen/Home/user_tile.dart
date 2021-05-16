import 'package:flutter/material.dart';
import 'package:my_app/Models/appUsers.dart';

class UserTile extends StatelessWidget {
  final AppUsers appUsers;
  UserTile({this.appUsers});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.red],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box, size: 35),
            title: Text(
              appUsers.userName,
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'openSans',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '\nNIC: ' +
                  appUsers.nic +
                  '\nPhone Number: ' +
                  appUsers.phoneNumber +
                  '\nAge: ' +
                  appUsers.age,
              style: TextStyle(
                color: Colors.black45,
                fontFamily: 'openSans',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
        ],
      ),
    ));
  }
}
