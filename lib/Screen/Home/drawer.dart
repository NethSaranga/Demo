import 'package:my_app/Models/user.dart';
import 'package:my_app/Screen/Home/settings_form.dart';
import 'package:my_app/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Services/auth.dart';
import 'package:my_app/Models/appUsers.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatelessWidget {
  final Authservice _auth = Authservice();
  AppUsers appUsers;

  Widget build(BuildContext context) {
    void _showProfileSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              //height: 200,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFF004D40),
                  ),
                  accountName: Text('Name: \t' + userData.userName),
                  accountEmail: Text('Phone Number: \t' + userData.phoneNumber),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
                InkWell(
                  child: ListTile(
                    title: Text("Profile"),
                    leading: Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                  ),
                  onTap: () async {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Profile Info'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Name: \t' +
                                    userData.userName +
                                    '\nNIC: \t' +
                                    userData.nic +
                                    '\nPhone Number: \t' +
                                    userData.phoneNumber +
                                    '\nage: \t' +
                                    userData.age),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Dismiss'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),

                // profile settings
                InkWell(
                  child: ListTile(
                    title: Text("Profile settings"),
                    leading: Icon(
                      Icons.settings,
                      color: Colors.black54,
                    ),
                  ),
                  onTap: () async {
                    _showProfileSettingsPanel();
                    // type hear page wich we can edit profile info
                  },
                ),
                // log out
                InkWell(
                  child: ListTile(
                    title: Text("Version"),
                    leading: Icon(
                      Icons.info,
                      color: Colors.black54,
                    ),
                  ),
                  onTap: () async {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Version'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Version: \t1.0.0'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Dismiss'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),

                InkWell(
                  child: ListTile(
                    title: Text("Log Out"),
                    leading: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  ),
                  onTap: () async {
                    await _auth.signOut();
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('1.0.0'),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }
}
