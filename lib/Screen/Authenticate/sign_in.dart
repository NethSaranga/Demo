import 'package:flutter/material.dart';
import 'package:my_app/Services/auth.dart';
import 'package:my_app/Shared/constants.dart';
import 'package:my_app/Shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authservice _auth = Authservice();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';
  bool _passwordVisible;

  void initState() {
    _passwordVisible = false;
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

  Widget _buildSignInBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            // dynamic result =
            //     await _auth.signInWithEmailAndPassword(email, password);
            setState(() => loading = true);
            dynamic result =
                await _auth.signInWithEmailAndPassword(email, password);
            if (result == null) {
              setState(() {
                error = '"\Could not sign in with those credentials\"';
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
          'SIGN IN',
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

  Widget _buildSignUpBtn() {
    return GestureDetector(
      onTap: () {
        widget.toggleView();
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Register',
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
                            'Sign In',
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
                          // password widget
                          SizedBox(height: 30.0),
                          _buildPasswordTF(),
                          // signin button widget
                          _buildSignInBtn(),
                          // wrrong email and password error
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                          // signup button
                          SizedBox(height: 30.0),
                          _buildSignUpBtn()
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
    // return Scaffold(
    //   backgroundColor: Colors.blue[100],
    //   appBar: AppBar(
    //     backgroundColor: Colors.blue,
    //     elevation: 0.0,
    //     title: Text('My Demo App'),
    //   ),
    //   body: Container(
    //     padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
    //     child: RaisedButton(
    //       child: Text('Sign in anon'),
    //       onPressed: () async {
    //         dynamic result = await _auth.signInAnon();
    //         if (result == null) {
    //           print('error signing in');
    //         } else {
    //           print('signed in');
    //           print(result.uid);
    //         }
    //       },
    //     ),
    //   ),
    // );
  }
}
