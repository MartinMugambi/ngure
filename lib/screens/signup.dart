import 'package:book_app/screens/login.dart';
import 'package:book_app/services/auth_services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SignUpScreen extends StatefulWidget {
  static final String id = "signup_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  bool _obSecureText = false;
  String _name, _email, _password;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  _toggle() {
    setState(() {
      _obSecureText = !_obSecureText;
    });
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      AuthService.signUpUser(context, _name, _email, _password);
    }
  }

  void _onLoading() {
    _scaffoldkey.currentState.showSnackBar(
      new SnackBar(
        duration: new Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: new Row(
          children: <Widget>[
            new CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
            new Text(
              ' Signing-In...',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: -math.pi / 18,
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'BookWise',
                style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  color: Theme.of(context).primaryColor,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter Name',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                        validator: (name) =>
                            name.trim().isEmpty ? 'Enter valid name' : null,
                        onSaved: (name) => _name = name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) => EmailValidator.validate(email)
                            ? null
                            : 'Email is invalid',
                        onSaved: (email) => _email = email,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            color: Colors.black,
                            icon: _obSecureText
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: _toggle,
                          ),
                          labelText: 'Password',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                        obscureText: _obSecureText,
                        validator: (password) => password.length < 6
                            ? "Must be atleast six characters"
                            : null,
                        onSaved: (password) => _password = password,
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      width: 340.0,
                      height: 45.0,
                      child: FlatButton(
                          onPressed: () {
                            _submit();
                            _onLoading();
                          },
                          color: Theme.of(context).primaryColor,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins-Regular',
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, LoginScreen.id);
                      },
                      child: Text(
                        'I areadly have an account',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: 'Poppins-Regular',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
