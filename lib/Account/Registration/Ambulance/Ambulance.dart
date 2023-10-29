import 'dart:io';
import 'package:ambulance_emegency_app/Account/Login/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ambulance extends StatelessWidget {
  const Ambulance({super.key});

  @override
  Widget build(BuildContext context) {
    const ADD_USER_URL =
        "https://www.mindsinaction.com.na/api/national-archives-app/addUser.php";
    final _formKey = GlobalKey<FormState>();

    // Defining text field input controllers
    final TextEditingController _merchantNameController =
        TextEditingController();
    final TextEditingController _merchantAddressController =
        TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _cellphoneController = TextEditingController();
    final TextEditingController _townCityController = TextEditingController();
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();



    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/Logo.png',
              height: 100,
            ),
            Text(
              "Ambulance Registration".toUpperCase(),
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                TextField(
                  controller: _merchantNameController,
                  decoration: InputDecoration(
                    labelText: 'Merchant name',
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
                  controller: _merchantAddressController,
                  decoration: InputDecoration(
                    labelText: 'Merchant address',
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
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      elevation: MaterialStateProperty.all<double>(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                const SizedBox(height: 10)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
