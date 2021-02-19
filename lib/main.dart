import 'package:flutter/material.dart';
import 'package:test_dev/register.dart';
import 'package:test_dev/login.dart';
import 'package:test_dev/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Login.tag: (context) => Login(),
    Register.tag: (context) => Register(),
    Profile.tag: (context) => Profile()
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Test dev Flutter [intersect]',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily: 'SFProText-Regular',
        ),
        home: Login(),
        routes: routes);
  }
}
