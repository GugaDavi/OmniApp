import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/stores/home_store/home_store.dart';
import 'package:omni_app/stores/profile_store/profile_store.dart';
import 'package:omni_app/ui/components/drawer_menu.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileStore profileStore;
  Completer<GoogleMapController> _controller;
  HomeStore homeStore;
  DevModel refDev;
  bool builded = false;

  @override
  void didChangeDependencies() {
    profileStore = Provider.of<ProfileStore>(context);
    refDev = profileStore.userDev;
    homeStore = HomeStore();
    homeStore.setCoordinates(profileStore.userDev.location);
    homeStore.listerDevs(refDev.techs.first);
    _controller = Completer();
    print(homeStore.loadedMrks);
    super.didChangeDependencies();
  }

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
          Observer(
            builder: (_) {
              if (homeStore.loadedMrks) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: GoogleMap(
                    markers: homeStore.mrks,
                    myLocationButtonEnabled: false,
                    initialCameraPosition: CameraPosition(
                        zoom: 12,
                        target: LatLng(profileStore.userDev.location.latitude,
                            profileStore.userDev.location.longitude)),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                );
              }
              return Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: primaryColor.withOpacity(0.1),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(45)),
                  child: TextFormField(
                    initialValue: refDev.techs.first,
                    onChanged: homeStore.findDev.setTechs,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                    decoration: _styleInput(),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Observer(
                  builder: (_) {
                    return FloatingActionButton(
                      disabledElevation: 0,
                      backgroundColor: homeStore.findDev.techsIsNotEmpty
                          ? primaryColor
                          : Colors.grey,
                      child: Icon(Icons.search,
                          color: Colors.white, semanticLabel: 'Search'),
                      onPressed: homeStore.findDev.techsIsNotEmpty
                          ? () => homeStore.listerDevs(homeStore.findDev.techs)
                          : null,
                    );
                  },
                ),
              ],
            ),
          )
        ]));
  }

  InputDecoration _styleInput() {
    return InputDecoration(
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
          fontSize: 20, color: secondColor, fontWeight: FontWeight.bold),
      contentPadding: EdgeInsets.only(top: 20, right: 10, bottom: 20, left: 40),
    );
  }
}
