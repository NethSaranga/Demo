import 'package:flutter/material.dart';
import 'package:my_app/Models/appUsers.dart';
import 'package:my_app/Screen/Home/user_tile.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final userList = Provider.of<List<AppUsers>>(context) ?? [];
    return ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        return UserTile(appUsers: userList[index]);
      },
    );
  }
}
