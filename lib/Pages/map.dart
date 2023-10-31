import 'package:ambulance_emegency_app/Account/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  Location location = Location();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.85),
        width: MediaQuery.of(context).size.width * 0.60,
        child: ListView(
          children: [
             Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/default-profile.png',
                      height: 75,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Elifas Andreas",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "eandreas@gmail.com",
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Divider(),
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const Icon(
                Icons.home,
              ),
              title: Text(
                'Home',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Navigate to the home page
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Divider(),
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const FaIcon(
                FontAwesomeIcons.gear,
                size: 20,
              ),
              title: Text(
                'Settings',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Navigate to the settings page
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Divider(),
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const FaIcon(
                FontAwesomeIcons.history,
                size: 20,
              ),
              title: Text(
                'History',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Navigate to the settings page
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Divider(),
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const FaIcon(
                FontAwesomeIcons.user,
                size: 20,
              ),
              title: Text(
                'Account',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Navigate to the settings page
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Divider(),
            ),
            ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              leading: const FaIcon(
                FontAwesomeIcons.signOut,
                size: 20,
              ),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      // ignore: prefer_const_constructors
                      builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [
                // Color.fromARGB(232, 65, 24, 222),
                Color.fromRGBO(244, 54, 209, 1),
                Colors.red
              ],
            ),
          ),
        ),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        myLocationEnabled: true,
        initialCameraPosition: const CameraPosition(
          target: LatLng(
              0.0, 0.0), // Initial map position (e.g., center of the world)
          zoom: 15.0, // Initial zoom level
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Item 1'),
                value: 'item_1',
              ),
              const PopupMenuItem(
                child: Text('Item 2'),
                value: 'item_2',
              ),
              const PopupMenuItem(
                child: Text('Item 3'),
                value: 'item_3',
              ),
            ],
          );
        },
        backgroundColor: Colors.red[700],
        label: Text(
          "Request Ambulance",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: const FaIcon(
          FontAwesomeIcons.ambulance,
          size: 20,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Request permission to access the device's location
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        // Listen for location changes
        location.onLocationChanged.listen((LocationData locationData) {
          if (mapController != null) {
            mapController?.animateCamera(
              CameraUpdate.newLatLng(
                LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
              ),
            );
          }
        });
      }
    });
  }
}
