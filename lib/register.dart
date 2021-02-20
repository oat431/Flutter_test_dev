import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:test_dev/login.dart';

class Register extends StatefulWidget {
  static String tag = "register-page";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  DateTime dateTime;
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
    );

    final fullName = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'your fullname',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final confirmPassword = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    String _formatTime(date) {
      return date.toString() == 'null'
          ? 'please select your birthdate'
          : date.toString().split(' ')[0];
    }

    final datePicker = FlatButton(
      child: Text(
        _formatTime(dateTime),
        style: TextStyle(
          fontSize: 26,
          color: Colors.black54,
        ),
      ),
      onPressed: () {
        DatePicker.showDatePicker(context,
            showTitleActions: true,
            minTime: DateTime(1980, 1, 1),
            maxTime: DateTime.now(), onChanged: (date) {
          setState(() {
            dateTime = date;
          });
        }, onConfirm: (date) {
          setState(() {
            dateTime = date;
          });
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
    );

    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(Login.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Sign Up', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Text("Register",
                  style: TextStyle(fontSize: 40, color: Colors.grey)),
              SizedBox(height: 48.0),
              email,
              SizedBox(height: 12.0),
              fullName,
              SizedBox(height: 12.0),
              password,
              SizedBox(height: 12.0),
              confirmPassword,
              SizedBox(height: 12.0),
              datePicker,
              SizedBox(height: 24.0),
              registerButton
            ],
          ),
        ));
  }
}
