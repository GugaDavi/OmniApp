import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/stores/home_store/home_store.dart';
import 'package:omni_app/stores/profile_store/profile_store.dart';
import 'package:omni_app/ui/components/drawer_menu.dart';
import 'package:omni_app/ui/components/map_card_dev_animation.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  SequenceAnimation sequenceAnimation;
  ProfileStore profileStore;
  Completer<GoogleMapController> _controller;
  FocusNode _inputFocus = FocusNode();
  HomeStore homeStore;
  DevModel refDev;
  bool builded = false;
  Set<Marker> mrks = <Marker>{};

  void startState() {
    if (!builded) {
      profileStore = Provider.of<ProfileStore>(context);
      refDev = profileStore.userDev;
      homeStore = HomeStore();
      homeStore.setCoordinates(profileStore.userDev.location);
      homeStore.listerDevs(profileStore.userDev.techs.first);
      _controller = Completer();
      _animationController = AnimationController(vsync: this);
      sequenceAnimation =
          AnimationMapCardDev.animation().animate(_animationController);
    }
    builded = true;
  }

  Future<void> _playIn() async {
    try {
      await _animationController.forward().orCancel;
    } on TickerCanceled {}
  }

  Future<void> _playOut() async {
    await _animationController.reverse().orCancel;
    print('Passou aqui');
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startState();
    print(sequenceAnimation['opacity'].value);
    double widthScreenSize = MediaQuery.of(context).size.width;
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
              if (homeStore.loadedDevs) {
                homeStore.devs.devs.forEach((DevModel dev) {
                  mrks.add(Marker(
                    markerId: MarkerId(dev.id),
                    position:
                        LatLng(dev.location.latitude, dev.location.longitude),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen),
                    onTap: () {
                      homeStore.setTapedDev(dev);
                      _playIn();
                    },
                  ));
                });
              }
              return Container(
                height: double.infinity,
                width: double.infinity,
                child: GoogleMap(
                  markers: mrks,
                  onTap: (LatLng ltLg) async {
                    await _playOut();
                    homeStore.setTapedDev(null);
                  },
                  myLocationButtonEnabled: false,
                  initialCameraPosition: CameraPosition(
                      zoom: 13,
                      target: LatLng(profileStore.userDev.location.latitude,
                          profileStore.userDev.location.longitude)),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
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
                    focusNode: _inputFocus,
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
                          ? () {
                              mrks.clear();
                              homeStore.listerDevs(homeStore.findDev.techs);
                              _inputFocus.unfocus();
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, _) {
              return Positioned(
                bottom: sequenceAnimation['cardUp'].value,
                right: sequenceAnimation['width'].value,
                left: sequenceAnimation['width'].value,
                child: Observer(
                  builder: (_) {
                    if (homeStore.tapedDev != null) {
                      return Opacity(
                        opacity: sequenceAnimation['opacity'].value,
                        child: GestureDetector(
                          onTap: () =>
                              goToGihub(homeStore.tapedDev.githubUsername),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            height: sequenceAnimation['height'].value,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.7),
                                      offset: Offset.fromDirection(10, -3),
                                      blurRadius: 7)
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            child: _animationController.isAnimating
                                ? Container()
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(75.0),
                                            child: Image.network(
                                              homeStore.tapedDev.avatarUrl,
                                              height: 75,
                                              width: 75,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Container(
                                            width: widthScreenSize * 60 / 100,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  homeStore.tapedDev.name,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  homeStore.tapedDev.techs
                                                      .join(', '),
                                                  style: TextStyle(
                                                      color: primaryDarkColor,
                                                      fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              );
            },
          ),
        ]));
  }

  void goToGihub(String githubUser) async {
    String baseURL = 'https://github.com/$githubUser';
    if (await canLaunch(baseURL)) {
      await launch(baseURL);
    } else {
      throw 'Could not launch $baseURL';
    }
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
