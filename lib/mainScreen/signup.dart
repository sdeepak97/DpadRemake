import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dpaduiremake/Homescreen/home.dart';
import 'package:dpaduiremake/model/user_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;

  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final mobileEditingController = TextEditingController();
  final _smsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var selectedRadio;

  String? errorMessage;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSetselectedRadio(var val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xFF8A2387),
                Color(0xFFE94057),
                Color(0XFFF21211)
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              // ignore: prefer_const_constructors
              Text(
                "DIGITAL OCR",
                style: const TextStyle(
                    fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              Container(
                height: 550,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Signup",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 45,
                                    width: 150,
                                    child: TextFormField(
                                      autofocus: false,
                                      controller: firstNameEditingController,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'First Name',
                                          suffixIcon:
                                              Icon(Icons.people, size: 17)),
                                      validator: (value) {
                                        RegExp regex = RegExp(r'^.{3,}$');
                                        if (value!.isEmpty) {
                                          return ("First Name cannot be Empty");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("Enter Valid name(Min. 3 Character)");
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        firstNameEditingController.text =
                                            value!;
                                      },
                                      textInputAction: TextInputAction.next,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: 45,
                                    width: 140,
                                    child: TextFormField(
                                      autofocus: false,
                                      controller: lastNameEditingController,
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ("lastName cannot be Empty");
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        lastNameEditingController.text = value!;
                                      },
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                        hintText: "only",
                                          border: OutlineInputBorder(),
                                          labelText: 'Last Name',
                                          suffixIcon:
                                              Icon(Icons.people, size: 17)),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                height:50,
                                width: 300,
                                child: TextFormField(
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Please enter mobile number");
                                    }
                                  },
                                  controller: mobileEditingController,
                                  autofocus: false,
                                  onSaved: (value) {
                                    mobileEditingController.text = value!;
                                  },
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Mobile No',
                                      suffixIcon: Icon(Icons.mobile_friendly,
                                          size: 17)),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                width: 300,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: emailEditingController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Please Enter Your Email");
                                    }
                                    // reg expression for email validation
                                    if (!RegExp(
                                            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                        .hasMatch(value)) {
                                      return ("Please Enter a valid email");
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    emailEditingController.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Mail (Optional)',
                                      suffixIcon: Icon(Icons.people, size: 17)),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                width: 300,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: passwordEditingController,
                                  obscureText: true,
                                  validator: (value) {
                                    RegExp regex = RegExp(r'^.{6,}$');
                                    if (value!.isEmpty) {
                                      return ("Password is required for login");
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return ("Enter Valid Password(Min. 6 Character)");
                                    }
                                  },
                                  onSaved: (value) {
                                    passwordEditingController.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                      suffixIcon: Icon(
                                          Icons.remove_red_eye_sharp,
                                          size: 17)),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                height: 45,
                                width: 300,
                                child: TextFormField(
                                  autofocus: false,
                                  controller: confirmPasswordEditingController,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("enter confrim passsword");
                                    }
                                    if (confirmPasswordEditingController.text !=
                                        passwordEditingController.text) {
                                      return "Password don't match";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    confirmPasswordEditingController.text =
                                        value!;
                                  },
                                  textInputAction: TextInputAction.done,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Re-password',
                                      suffixIcon: Icon(
                                          Icons.remove_red_eye_sharp,
                                          size: 17)),
                                )),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: 320,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Radio(
                                value: 0,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSetselectedRadio(val);
                                }),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Mail  ",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Radio(
                                value: 1,
                                groupValue: selectedRadio,
                                onChanged: (val) {
                                  setSetselectedRadio(val);
                                }),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Mobile ",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 300,
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 180,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'OTP',
                                // suffixIcon:
                                //     Icon(Icons.mobile_friendly, size: 17)
                              ),
                            ),
                          ),
                          const SizedBox(width: 55),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.pinkAccent),
                                onPressed: () {
                                  
                                },
                                child: const Text("verify")),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        signUp(emailEditingController.text,
                            passwordEditingController.text);
                        print("button spammed");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF8A2387),
                                  Color(0xFFE94057),
                                  Color(0XFFF21211)
                                ])),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  Future postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.lastName = lastNameEditingController.text;
    userModel.mobile = mobileEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.push(
      (context),
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }
}
