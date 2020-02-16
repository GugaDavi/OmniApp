import 'dart:async';

import 'package:flutter/material.dart';
import 'package:omni_app/ui/components/drawer_menu.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-23.6363776, -46.6419712),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-23.6363776, -46.6419712),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMenu(),
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: primaryDarkColor,
          elevation: 10,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(45)),
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Tech',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide(color: secondColor, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(45),
                          borderSide: BorderSide(color: secondColor, width: 2)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: secondColor,
                          fontWeight: FontWeight.bold),
                      contentPadding: EdgeInsets.only(
                          top: 20, right: 10, bottom: 20, left: 40),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  backgroundColor: primaryColor,
                  child: Icon(Icons.search,
                      color: Colors.white, semanticLabel: 'ADICIONAR CONTA'),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ]));
  }
}
