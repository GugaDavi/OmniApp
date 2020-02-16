import 'package:flutter/material.dart';
import 'package:omni_app/api/api.dart';
import 'package:omni_app/routes/route_generator.dart';
import 'package:omni_app/stores/dev_list_store/dev_list_store.dart';
import 'package:omni_app/stores/login_store/login_store.dart';
import 'package:omni_app/stores/profile_store/profile_store.dart';
import 'package:omni_app/ui/screens/verifyLogin.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProfileStore>(
          create: (_) => ProfileStore(),
        ),
        Provider<DevListStore>(
          create: (_) => DevListStore(),
        ),
        Provider<LoginStore>(
          create: (_) => LoginStore(Api()),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: RouterGenerator.generateRoute,
        title: 'Omni App',
        home: VerifyLogin(),
      ),
    );
  }
}
