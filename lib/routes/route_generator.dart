import 'package:flutter/material.dart';
import 'package:omni_app/routes/route_consts.dart';
import 'package:omni_app/ui/screens/edit_profile.dart';
import 'package:omni_app/ui/screens/home.dart';
import 'package:omni_app/ui/screens/login.dart';
import 'package:omni_app/ui/screens/profile.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute<HomeScreen>(builder: (_) => HomeScreen());
      case profile:
        return MaterialPageRoute<ProfileScreen>(
            builder: (_) => ProfileScreen());
      case login:
        return MaterialPageRoute<LoginScreen>(builder: (_) => LoginScreen());
      case editProfile:
        return MaterialPageRoute<EditProfile>(builder: (_) => EditProfile());
      default:
        return MaterialPageRoute<Container>(builder: (_) => Container());
    }
  }
}
