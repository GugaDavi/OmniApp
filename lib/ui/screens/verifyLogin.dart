import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:omni_app/stores/login_store/login_store.dart';
import 'package:omni_app/ui/screens/home.dart';
import 'package:omni_app/ui/screens/login.dart';
import 'package:provider/provider.dart';

class VerifyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginStore loginControlller = Provider.of<LoginStore>(context);
    return Observer(
      builder: (_) {
        if (loginControlller.authenticated) {
          return HomeScreen();
        }
        return LoginScreen();
      },
    );
  }
}
