import 'package:flutter/material.dart';
import 'package:my_app/Services/auth.dart';
import 'package:my_app/Shared/constants.dart';
import 'package:my_app/Shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Authservice _auth = Authservice();
  final _passwordControler = TextEditingController();
  final _confirmPasswordControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String confirmPassword = '';
  String userName = '';
  String nic = '';
  String phoneNumber = '';
  String age = '';
  String error = '';
  bool _passwordVisible;
  bool _confirmPasswordVisible;

  void initState() {
    _passwordVisible = false;
    _confirmPasswordVisible = false;
    super.initState();
  }

  Widget _buldEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: myLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: myBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'opemSans'),
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.yellow[300], fontSize: 15.0),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter an Email',
              hintStyle: myHintTextStyle,
            ),
            validator: (val) => val.isEmpty ? '  Enter an Emain' : null,
            onChanged: (val) {
              setState(() => email = val);
            },
          ),
        ),
      ],
    );
  }

  Widget _buldUserNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'User Name',
          style: myLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: myBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white, fontFamily: 'opemSans'),
              decoration: InputDecoration(
                errorStyle:
                    TextStyle(color: Colors.yellow[300], fontSize: 15.0),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.face,
                  color: Colors.white,
                ),
                hintText: 'Enter user name',
                hintStyle: myHintTextStyle,
              ),
              validator: (val) => val.isEmpty ? '  Enter a user name' : null,
              onChanged: (val) {
                setState(() => userName = val);
              }),
        ),
      ],
    );
  }

  Widget _buldNICTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'NIC',
          style: myLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: myBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.white, fontFamily: 'opemSans'),
              decoration: InputDecoration(
                errorStyle:
                    TextStyle(color: Colors.yellow[300], fontSize: 15.0),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.indeterminate_check_box,
                  color: Colors.white,
                ),
                hintText: 'Enter NIC number',
                hintStyle: myHintTextStyle,
              ),
              validator: (val) => val.isEmpty ? '  Enter a NIC number' : null,
              onChanged: (val) {
                setState(() => nic = val);
              }),
        ),
      ],
    );
  }

  Widget _buldAgeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Age',
          style: myLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: myBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.white, fontFamily: 'opemSans'),
              decoration: InputDecoration(
                errorStyle:
                    TextStyle(color: Colors.yellow[300], fontSize: 15.0),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.access_time_rounded,
                  color: Colors.white,
                ),
                hintText: 'Enter your age',
                hintStyle: myHintTextStyle,
              ),
              validator: (val) => val.isEmpty ? '  Enter yor age' : null,
              onChanged: (val) {
                setState(() => age = val);
              }),
        ),
      ],
    );
  }

  Widget _buldPhoneNumberTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone number',
          style: myLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: myBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.white, fontFamily: 'opemSans'),
              decoration: InputDecoration(
                errorStyle:
                    TextStyle(color: Colors.yellow[300], fontSize: 15.0),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                hintText: 'Enter your phone number',
                hintStyle: myHintTextStyle,
              ),
              validator: (val) =>
                  val.isEmpty ? '  Enter your mobile number' : null,
              onChanged: (val) {
                setState(() => phoneNumber = val);
              }),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: myLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: myBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            obscureText: !_passwordVisible,
            validator: (val) =>
                val.length < 6 ? '  Enter a password 6+ characters long' : null,
            onChanged: (val) {
              setState(() => password = val);
            },
            style: TextStyle(color: Colors.white, fontFamily: 'opemSans'),
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.yellow[300], fontSize: 15.0),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: myHintTextStyle,
              suffixIcon: GestureDetector(
                onLongPress: () {
                  setState(() {
                    _passwordVisible = true;
                  });
                },
                onLongPressUp: () {
                  setState(() {
                    _passwordVisible = false;
                  });
                },
                child: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: myLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: myBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _confirmPasswordControler,
            obscureText: !_confirmPasswordVisible,
            validator: (String val) {
              if (val == password) {
                return null;
              } else {
                return ' Passwords do not match!';
              }
            },
            style: TextStyle(color: Colors.white, fontFamily: 'opemSans'),
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.yellow[300], fontSize: 15.0),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your password again',
              hintStyle: myHintTextStyle,
              suffixIcon: GestureDetector(
                onLongPress: () {
                  setState(() {
                    _confirmPasswordVisible = true;
                  });
                },
                onLongPressUp: () {
                  setState(() {
                    _confirmPasswordVisible = false;
                  });
                },
                child: Icon(_confirmPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() => loading = true);
            _auth.updateDatabase(userName, nic, phoneNumber, age);
            dynamic result =
                await _auth.registerWithEmailAndPassword(email, password);
            if (result == null) {
              setState(() {
                error = '"\please supply a valid email\"';
                loading = false;
              });
            }
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'REGISTER',
          style: TextStyle(
            color: Color(0xFF004D40),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'openSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInBtn() {
    return GestureDetector(
      onTap: () {
        widget.toggleView();
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
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
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                    //padding:EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'openSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // email widget
                          SizedBox(height: 30.0),
                          _buldEmailTF(),
                          // user name widget
                          SizedBox(height: 30.0),
                          _buldUserNameTF(),
                          // nic widget
                          SizedBox(height: 30.0),
                          _buldNICTF(),
                          // phone number widget
                          SizedBox(height: 30.0),
                          _buldPhoneNumberTF(),
                          // age widget
                          SizedBox(height: 30.0),
                          _buldAgeTF(),
                          // password widget
                          SizedBox(height: 30.0),
                          _buildPasswordTF(),
                          // conform password widget
                          SizedBox(height: 30.0),
                          _buildConfirmPasswordTF(),
                          // register button widget
                          _buildRegisterBtn(),
                          // wrrong email and password error
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                          // signin button
                          SizedBox(height: 30.0),
                          _buildSignInBtn()
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
