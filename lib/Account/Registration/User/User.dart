import 'dart:convert';
import 'dart:io';
import 'package:ambulance_emegency_app/Account/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class User extends StatefulWidget {
  UserState createState() => UserState();
}

class UserState extends State<User> {
  //Add user api link
  static const ADD_USER_URL = "http://192.168.0.200/emegency_app/add_user.php";
  final _formKey = GlobalKey<FormState>();

  // Defining text field input controllers
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _patientAddressController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cellphoneController = TextEditingController();
  final TextEditingController _townCityController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool checkStatus = false;
  File imageFile = File("");
  String imageData = "";
  bool _isHidden = true;

  choiceImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });

      imageData = base64Encode(imageFile.readAsBytesSync());

      return imageData;
    } else {
      return null;
    }
  }

  // Add user function
  Future addUser() async {
    var data = {
      "patient_name": _patientNameController.text,
      "patient_address": _patientAddressController.text,
      "cellphone": _cellphoneController.text,
      "Email": _emailController.text,
      "town_city": _townCityController.text,
      "username": _usernameController.text,
      "profile": imageData,
    };

    var response = await http.post(Uri.parse(ADD_USER_URL), body: data);
    if (response.statusCode == 200) {
      print(response.body);
      print("success");
      Navigator.pop(context as BuildContext);
    } else {
      print(response.statusCode);
      print("failure");
    }
  }

  showImage(String image) {
    Image img = Image.memory(base64Decode(image));
    return CircleAvatar(
        radius: 70.0,
        backgroundImage: img.image,
        backgroundColor: Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(100.0)),
                    border: Border.all(color: Colors.black54, width: 2.5),
                    color: Colors.white,
                  ),
                  height: 120,
                  width: 120,
                  child: Stack(
                    children: <Widget>[
                      // ignore: unnecessary_null_comparison
                      imageData != null
                          ? showImage(imageData)
                          : const CircleAvatar(
                              radius: 70.0,
                              backgroundImage:
                                  AssetImage("assets/default-profile.png"),
                              backgroundColor: Colors.white,
                            ),
                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: IconButton(
                          iconSize: 30,
                          icon: const Icon(Icons.add_a_photo,
                              color: Colors.black38),
                          onPressed: () {
                            choiceImage();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextField(
                          controller: _patientNameController,
                          decoration: InputDecoration(
                            labelText: 'Patient name',
                            filled: true,
                            fillColor: Colors.white,
                            labelStyle: GoogleFonts.poppins(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TextField(
                          controller: _patientAddressController,
                          decoration: InputDecoration(
                            labelText: 'Patient address',
                            labelStyle: GoogleFonts.poppins(fontSize: 16),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TextField(
                          controller: _cellphoneController,
                          decoration: InputDecoration(
                            labelText: 'Cellphone',
                            labelStyle: GoogleFonts.poppins(fontSize: 16),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email address',
                            labelStyle: GoogleFonts.poppins(fontSize: 16),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TextField(
                          controller: _townCityController,
                          decoration: InputDecoration(
                            labelText: 'Town/City',
                            labelStyle: GoogleFonts.poppins(fontSize: 16),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: GoogleFonts.poppins(fontSize: 16),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: GoogleFonts.poppins(fontSize: 16),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TextField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Confirm password',
                            labelStyle: GoogleFonts.poppins(fontSize: 16),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                // Color.fromARGB(232, 65, 24, 222),
                                Color.fromRGBO(244, 54, 209, 1),
                                Colors.red
                              ])),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              elevation: MaterialStateProperty.all<double>(0),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            child: Text(
                              'Register',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "Already registered? Click here to login",
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  // ignore: prefer_const_constructors
                                  builder: (context) => LoginPage()),
                            )
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
