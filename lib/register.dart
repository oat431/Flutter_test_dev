import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("this is a register page")));
  }
}
