import 'package:flutter/material.dart';
import 'package:omni_app/routes/route_consts.dart';
import 'package:omni_app/ui/screens/drawer_menu_screens/devs_list/devs_list.dart';
import 'package:omni_app/ui/screens/drawer_menu_screens/profile_screens/edit_profile.dart';
import 'package:omni_app/ui/screens/drawer_menu_screens/profile_screens/profile.dart';
import 'package:omni_app/ui/screens/home.dart';
import 'package:omni_app/ui/screens/login.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute<HomeScreen>(
          builder: (_) => HomeScreen(),
          settings: RouteSettings(name: home),
        );
      case profile:
        return MaterialPageRoute<ProfileScreen>(
          builder: (_) => ProfileScreen(),
          settings: RouteSettings(name: profile),
        );
      case login:
        return MaterialPageRoute<LoginScreen>(
          builder: (_) => LoginScreen(),
          settings: RouteSettings(name: login),
        );
      case editProfile:
        return MaterialPageRoute<EditProfile>(
          builder: (_) => EditProfile(),
          settings: RouteSettings(name: editProfile),
        );
      case devsList:
        return MaterialPageRoute<DevList>(
          builder: (_) => DevList(),
          settings: RouteSettings(name: devsList),
        );
      default:
        return MaterialPageRoute<Container>(
          builder: (_) => Container(),
          settings: RouteSettings(name: '404'),
        );
    }
  }
}
