import 'package:crud_with_flutter/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  static String tag = 'profile-page';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _profileName;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("user")
        .where('uid', isEqualTo: _auth.currentUser.uid ?? '')
        .get()
        .then((value) {
      setState(() {
        value.docs.forEach((doc) {
          _profileName = doc['fullname'];
        });
      });
    });
  }

  void signout() {
    _auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login()),
        ModalRoute.withName('/login'));
  }

  Widget build(BuildContext context) {
    final header = AppBar(
      automaticallyImplyLeading: false,
      title: Text(_profileName ?? ''),
      leading: Image.asset('assets/icon/Search_1.png'),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 2.5),
          child: GestureDetector(
            onTap: () {},
            child: Image.asset('assets/icon/Send_1.png'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 2.5),
          child: GestureDetector(
            onTap: () {
              signout();
            },
            child: Image.asset('assets/icon/Notification_1.png'),
          ),
        )
      ],
      backgroundColor: Colors.white,
    );

    final profileContent = Stack(
      children: [
        Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/TestPic.jpg'),
                  fit: BoxFit.cover),
              shape: BoxShape.rectangle),
        ),
        Row(
          children: [
            Container(
              height: 500,
              width: 180,
            ),
            Container(
              alignment: Alignment(-0.8, -0.8),
              height: 500,
              width: 230,
              color: Colors.white70,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 48.0,
                  ),
                  Text("38k\nfollwer",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(" 38k\n follwing",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(
                    height: 96.0,
                  ),
                  Text("\t\t\tNear\n\t\t\tNo address",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(
                    height: 120.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Image.asset('assets/icon/Setting_0.png'),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );

    final dealData = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            RotatedBox(
              quarterTurns: -1,
              child: Text('Deal Done',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Text('7',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 115))
          ],
        ),
        Column(
          children: <Widget>[
            Text('240',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 115)),
            Text('THB\nSAVE/MOUNTH',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
          ],
        )
      ],
    );
    return Scaffold(
      appBar: header,
      body: Column(children: <Widget>[profileContent, dealData]),
    );
  }
}
