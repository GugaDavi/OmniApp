import 'package:flutter/material.dart';
import 'package:omni_app/api/api.dart';
import 'package:omni_app/routes/route_generator.dart';
import 'package:omni_app/stores/login_store/login_store.dart';
import 'package:omni_app/ui/screens/verifyLogin.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
