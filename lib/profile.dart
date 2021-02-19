import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static String tag = 'profile-page';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile page')),
    );
  }
}
