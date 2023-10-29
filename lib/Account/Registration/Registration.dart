// ignore: file_names
import 'package:ambulance_emegency_app/Account/Registration/Ambulance/Ambulance.dart';
import 'package:ambulance_emegency_app/AppBackground/Background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'User/User.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.pink,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          child: SizedBox(
                            width: 140, // Set the desired width
                            child: Center(
                              child: Text(
                                'Patient'.toUpperCase(),
                                style: GoogleFonts.poppins(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: SizedBox(
                            // Set the desired width
                            child: Center(
                              child: Text(
                                'Ambulance'.toUpperCase(),
                                style: GoogleFonts.poppins(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: TabBarView(
                          children: [
                            User(),
                            const Ambulance(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
