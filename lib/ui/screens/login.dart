import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/stores/login_store/controllers/login_controller.dart';
import 'package:omni_app/stores/login_store/login_store.dart';
import 'package:omni_app/stores/profile_store/profile_store.dart';
import 'package:omni_app/ui/components/button.dart';
import 'package:omni_app/ui/components/map_animation.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:omni_app/ui/styles/responsive_widget.dart';
import 'package:omni_app/ui/styles/styles.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginControlller loginControlller;
  LoginStore loginStore;
  ProfileStore profileStore;
  bool builded = false;
  FocusNode _focus = FocusNode();
  LocationData locationData;
  Location location = Location();

  TextEditingController _githubController = TextEditingController();
  TextEditingController _techsController = TextEditingController();
  TextEditingController _latitudeController = TextEditingController();
  TextEditingController _longitudeController = TextEditingController();

  Future<void> initStates() async {
    if (!builded) {
      loginControlller = LoginControlller();
      loginStore = Provider.of<LoginStore>(context);
      profileStore = Provider.of<ProfileStore>(context);
      await _getLocation();
      loginStore.addInput(
        _inputs('GitHub Username', loginControlller.setGithubUserName,
            Icons.person_add,
            controller: _githubController, focus: _focus),
      );
    }
    builded = true;
  }

  Future<void> _getLocation() async {
    try {
      locationData = await location.getLocation();
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission Denied');
      }
      locationData = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    initStates();
    List<Widget> createInputs = [
      _inputs('Techs', loginStore.newDev.form.setTechs, Icons.list,
          controller: _techsController),
      _inputs('Latitude', loginStore.newDev.form.setLatitude, Icons.location_on,
          controller: _latitudeController),
      _inputs(
          'Longitude', loginStore.newDev.form.setLongitude, Icons.location_on,
          controller: _longitudeController)
    ];
    bool isVisibleKeyboard = MediaQuery.of(context).viewInsets.bottom > 0;
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    ResponsiveWidget responsive = ResponsiveWidget(heightScreen, widthScreen);

    void _login() async {
      DevModel dev = await loginStore.login(loginControlller.githubUserName,
          list: createInputs);
      profileStore.setDev(dev);
    }

    void _newDev() async {
      DevModel dev = await loginStore.addDev(loginControlller.githubUserName);
      print(dev);
      profileStore.setDev(dev);
    }

    return Material(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrainsts) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constrainsts.maxHeight),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [primaryDarkColor, primaryColor]),
                ),
                padding:
                    EdgeInsets.all(responsive.sizeCalc(5, SizeDimension.width)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    MapAnimation(),
                    _buildInputs(),
                    SizedBox(
                      height: 10,
                    ),
                    Observer(
                      builder: (_) {
                        return Button(
                          child: loginStore.newUser ? 'Cadastrar' : 'Entrar',
                          onPressed: loginStore.newUser
                              ? () {
                                  _focus.unfocus();
                                  _newDev();
                                }
                              : () {
                                  _focus.unfocus();
                                  _login();
                                },
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Observer _buildInputs() {
    return Observer(
      builder: (_) {
        if (loginStore.newUser) {
          loginStore.newDev.form.setLatitude(locationData.latitude.toString());
          loginStore.newDev.form
              .setLongitude(locationData.longitude.toString());
          _latitudeController.text = locationData.latitude.toString();
          _longitudeController.text = locationData.longitude.toString();
        }
        return Column(
          children: loginStore.inputs,
        );
      },
    );
  }

  static Widget _inputs(String label, onChanged, IconData icon,
      {FocusNode focus, String initValue, TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
          focusNode: focus,
          onChanged: onChanged,
          controller: controller,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
          decoration: inputStyle(
              labelText: label,
              suffix: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  )))),
    );
  }
}
