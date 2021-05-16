import 'package:my_app/Models/user.dart';
import 'package:my_app/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Shared/constants.dart';
import 'package:my_app/Shared/loading2.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  //form values
  String _currentName;
  String _currentnic;
  String _currentPhoneNumber;
  String _currentAge;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Upgrade your profile settings',
                        style: TextStyle(fontSize: 18.0),
                      ),

                      SizedBox(height: 25.0),
                      //user name
                      Text(
                        'Enter UserName',
                        style: myLabelStyle2,
                      ),
                      TextFormField(
                        initialValue: userData.userName,
                        decoration: textInputDecoration,
                        validator: (val) =>
                            val.isEmpty ? 'Please enter a name' : null,
                        onChanged: (val) => setState(() => _currentName = val),
                      ),
                      SizedBox(height: 25.0),
                      //NIC
                      Text(
                        'Enter NIC number',
                        style: myLabelStyle2,
                      ),
                      TextFormField(
                        initialValue: userData.nic,
                        decoration: textInputDecoration,
                        validator: (val) =>
                            val.isEmpty ? 'Please enter NIC' : null,
                        onChanged: (val) => setState(() => _currentnic = val),
                      ),
                      SizedBox(height: 25.0),
                      //phoneNumber
                      Text(
                        'Enter your phone number',
                        style: myLabelStyle2,
                      ),
                      TextFormField(
                        initialValue: userData.phoneNumber,
                        decoration: textInputDecoration,
                        validator: (val) =>
                            val.isEmpty ? 'Please enter phonenumber' : null,
                        onChanged: (val) =>
                            setState(() => _currentPhoneNumber = val),
                      ),
                      SizedBox(height: 25.0),
                      //age
                      Text(
                        'Enter your age',
                        style: myLabelStyle2,
                      ),
                      TextFormField(
                        initialValue: userData.age,
                        decoration: textInputDecoration,
                        validator: (val) =>
                            val.isEmpty ? 'Please enter age' : null,
                        onChanged: (val) => setState(() => _currentAge = val),
                      ),
                      Divider(),

                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: Colors.white,
                        child: Text(
                          'Upgrade',
                          style: TextStyle(
                            color: Color(0xFF004D40),
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'openSans',
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: user.uid).updateUserData(
                                _currentName ?? userData.userName,
                                _currentnic ?? userData.nic,
                                _currentPhoneNumber ?? userData.phoneNumber,
                                _currentAge ?? userData.age);
                            Navigator.pop(context);
                          }
                        },
                      )
                    ],
                  ),
                ));
          } else {
            return Loading2();
          }
        });
  }
}
