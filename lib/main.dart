import 'package:flutter/material.dart';
import 'package:omni_app/routes/route_generator.dart';
import 'package:omni_app/ui/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouterGenerator.generateRoute,
      title: 'Omni App',
      home: HomeScreen(),
    );
  }
}
