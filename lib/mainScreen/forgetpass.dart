
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  var email = "";
  var password = "";
  var repassword = "";
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final repasswordcontroller = TextEditingController();
  var newPassword = "";
  // ignore: prefer_typing_uninitialized_variables

  var selectedRadio;

  get confirmPasswordController => null;
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
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailcontroller.dispose();
    passwordcontroller.dispose();
    repasswordcontroller.dispose();
    super.dispose();
  }

  forgetpass() async {
    // final currentUser =
    //     FirebaseAuth.instance.fetchSignInMethodsForEmail("sdeepak1325@gmail.com");
    // print("printing in forgetpass" + newPassword);
    // var stringList = await currentUser;
    // print(stringList);
    // try {
    //   await currentUser!.updatePassword(newPassword);
    //   FirebaseAuth.instance.signOut();
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => Login()),
    //   );
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       backgroundColor: Colors.orangeAccent,
    //       content: Text(
    //         'Your Password has been Changed. Login again !',
    //         style: TextStyle(fontSize: 18.0),
    //       ),
    //     ),
    //   );
    // } catch (e) {
    //   print("exception at forget pass");
    // }
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
          child: Form(
            key: _formKey,
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
                  height: 500,
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
                        "Forget Password",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 40,
                        width: 320,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                "Mobile  ",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                "Mail",
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 50, 10),
                        child: Container(
                          height: 60,
                          width: 250,
                          child: TextFormField(
                            controller: emailcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              } else if (!value.contains('@')) {
                                return 'Please Enter Valid Email';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter mail id',
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 300,
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         height: 50,
                      //         width: 180,
                      //         child: TextFormField(
                      //           maxLength: 6,
                      //           decoration: const InputDecoration(
                      //             border: OutlineInputBorder(),
                      //             labelText: 'OTP',
                      //             // suffixIcon:
                      //             //     Icon(Icons.mobile_friendly, size: 17)
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(width: 55),
                      //       Padding(
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 3, vertical: 2),
                      //         child: ElevatedButton(
                      //             style: ElevatedButton.styleFrom(
                      //                 primary: Colors.pinkAccent),
                      //             onPressed: () {},
                      //             child: const Text("OK")),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 300,
                          child: TextFormField(
                            controller: passwordcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                suffixIcon:
                                    Icon(Icons.remove_red_eye_sharp, size: 17)),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 300,
                          child: TextFormField(
                            controller: repasswordcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Re-password',
                                suffixIcon:
                                    Icon(Icons.remove_red_eye_sharp, size: 17)),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              newPassword = passwordcontroller.text;
                            });
                            print("printing on key press" + newPassword);
                            forgetpass();
                          }
                          print("lolman");
                        },
                        child: Container(
                          alignment: Alignment.center,
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
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 310,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                              // ignore: avoid_print
                              print("button pressed");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 80,
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
                                  "Sign In",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 40,
                          // ),
                          // const Text("Developed by: 720")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
