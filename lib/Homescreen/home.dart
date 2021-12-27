import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dpaduiremake/mainScreen/login.dart';
import 'package:dpaduiremake/model/user_model.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'contents.dart';
import 'dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  // ignore: must_call_super
  void initState() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(50, 75, 205, 5),
        title: const Text("DIGITAL OCR"),
        centerTitle: true,
        actions: [
          Text("${loggedInUser.email}",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20)),
          IconButton(
              onPressed: () {
                logout(context);
              },
              icon: const Icon(Icons.login_outlined)),
        ],
      ),
      body: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: const Color.fromRGBO(50, 75, 205, 5),
            height: MediaQuery.of(context).size.height,
            width: 250,
            child: const Dashboard(),
          ),
          SizedBox(
            //color: const Color.fromRGBO(50, 75, 205, 5),
            width: MediaQuery.of(context).size.width * 0.6,
            child: const Contents(),
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Login()));
  }
}
