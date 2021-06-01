import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crud_with_flutter/screen/profile.dart';
import 'package:crud_with_flutter/screen/register.dart';

class Login extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController authEmail = TextEditingController();
  TextEditingController authPassword = TextEditingController();
  void signIn() async {
    String checkEmail = authEmail.text.trim();
    String checkPassword = authPassword.text.trim();
    await _auth
        .signInWithEmailAndPassword(email: checkEmail, password: checkPassword)
        .then((user) => {print('signed in')})
        .catchError((err) => {print(err)});
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
        ModalRoute.withName('/profile'));
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: authEmail,
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: authPassword,
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          signIn();
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final dontHaveAccount = FlatButton(
      child: Text(
        "don't have account?",
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(Register.tag);
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            FlutterLogo(size: 120),
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel,
            dontHaveAccount
          ],
        ),
      ),
    );
  }
}
