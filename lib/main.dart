import 'package:flutter/material.dart';
import 'package:crud_with_flutter/screen/register.dart';
import 'package:crud_with_flutter/screen/login.dart';
import 'package:crud_with_flutter/screen/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        home: FirebaseAuth.instance.currentUser != null ? Profile() : Login(),
        routes: routes);
  }
}
