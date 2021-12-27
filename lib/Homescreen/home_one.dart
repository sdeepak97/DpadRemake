import 'dart:io';


import 'package:dpaduiremake/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class Homeone extends StatefulWidget {
  const Homeone({Key? key}) : super(key: key);

  @override
  _HomeoneState createState() => _HomeoneState();
}

class _HomeoneState extends State<Homeone> {

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  
  File? image;
  // ignore: prefer_typing_uninitialized_variables
  var selectedRadio;
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

  Future pickimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporay = File(image.path);
      setState(() {
        this.image = imageTemporay;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to load image:$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(50, 75, 205, 5),
        title: const Text("DIGITAL OCR"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
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
                      "PDF  ",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 250,
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
                      "IMAGE",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Radio(
                        value: 2,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setSetselectedRadio(val);
                        }),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "OTHERS",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // minimumSize: const Size.fromHeight(50),
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {},
                  child: const Text("PDF Upload"),
                ),
                const SizedBox(
                  width: 280,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        //minimumSize: const Size.fromHeight(50),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () => pickimage(),
                    child: const Text("Image Upload"))
              ],
            ),
            image !=null ? Image.file(image!,width:160,height:160,fit:BoxFit.cover):Icon(Icons.hourglass_empty),
          ],
        ),
      ),
    );
  }
}
