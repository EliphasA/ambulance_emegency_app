import 'dart:convert';

import 'package:ambulance_emegency_app/Account/Registration/Registration.dart';
import 'package:ambulance_emegency_app/AppBackground/Background.dart';
import 'package:ambulance_emegency_app/Pages/map.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  static bool isLoggedIn = false;
  static bool isAdmin = false;
  static String username = "";
  static String image = "";
  static String email = "";
  static String id = "";
  static String userType = "";
  static String dateCreated = "";
  String password = "";
  static String name = "";
  static String number = "";
  String errormsg = "";
  String successmsg = "";
  bool error = false, showprogress = false, success = false, isMessage = false;
  String message = "";

  Future login() async {
    var url = "http://192.168.0.200/emegency_app/auth.php";
    var response = await http.post(Uri.parse(url), body: {
      'username': _usernameController.text,
      'password': _passwordController.text,
    });

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (data["error"] != null) {
        setState(() {
          error = true;
          success = false;
          isMessage = true;
          message = data["message"];
          //print(message);
        });
      } else {
        if (data["success"]) {
          setState(() {
            error = false;
            success = true;
            isMessage = true;
            message = data["message"];
            print(message);
          });

          if (data['user_type'] == "user") {
            setState(() {
              isAdmin = true;
            });

            id = data["user_id"];
            username = data["username"];
            // image = data["user_profile"];
            name = data["merchant_name"];
            number = data["cellphone"];
            userType = data["user_type"];
            dateCreated = data["date_created"];

            print("It's comming here boss");
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MapScreen()),
            );
          } else if (data['user_type'] != "user") {
            setState(() {
              isAdmin = false;
            });
            id = data["user_id"];
            username = data["username"];
            image = data["user_profile"];
            name = data["merchant_name"];
            number = data["cellphone"];
            dateCreated = data["date_created"];
            // ignore: use_build_context_synchronously
            Navigator.pop(context, true);
          }
        }
      }
    }
  }

  @override
  void initState() {
    username = "";
    password = "";
    errormsg = "";
    successmsg = "";
    isMessage = false;
    error = false;
    success = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundImage(),
      Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/Logo.png',
                  height: 100,
                ),
                const SizedBox(height: 15),
                Text(
                  "Login to Our Access Services".toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  //display a success message, or error message or an empty container if no input has been added
                  padding: const EdgeInsets.all(10),
                  child: isMessage ? displayMessage(message) : Container(),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required';
                          }
                          return null;
                        },
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: GoogleFonts.poppins(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        obscureText: true,
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
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              // Color.fromARGB(232, 65, 24, 222),
                              Color.fromRGBO(244, 54, 209, 1),
                              Colors.red
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login();

                              if (success) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MapScreen()),
                                );
                              }
                            }
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
                            'Login',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        child: Text(
                          "Not registered? Click here to register",
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                // ignore: prefer_const_constructors
                                builder: (context) => Registration()),
                          )
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      )
    ]);
  }

  //will display the results from the login attempt
  Widget displayMessage(String text) {
    // if the login was successfully display success message
    return success
        // ? Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => LoginAccount()))
        ? Container(
            padding: EdgeInsets.all(10.00),
            margin: EdgeInsets.only(bottom: 3.00),
            decoration: BoxDecoration(color: Colors.green[300]),
            child: Row(children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 6.00),
                child: Icon(Icons.info, color: Colors.white),
              ),
              Text(text ?? "Successfully loged in",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ]),
          )
        : Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            margin: EdgeInsets.only(
              bottom: 3.00,
              right: 38,
              left: 38,
            ),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 6.00),
                    child: Icon(Icons.info, color: Colors.white),
                  ), // icon for error message

                  Text(text ?? "Invalid username or password",
                      style: GoogleFonts.raleway(
                          color: Colors.white, fontSize: 15)),
                  //show error message text
                ]),
          );
  }
}
