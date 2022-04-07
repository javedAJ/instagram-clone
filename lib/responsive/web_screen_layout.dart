import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  String username = '';

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  //for getting the data from firestore
  void getUserName() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      username = (snapshot.data() as Map<String, dynamic>)['username'];
    });
    print(snapshot.data());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(username)),
    );
  }
}
