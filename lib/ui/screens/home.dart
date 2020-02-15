import 'package:flutter/material.dart';
import 'package:omni_app/ui/components/drawer_menu.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:omni_app/ui/styles/styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMenu(),
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: primaryDarkColor,
          elevation: 4,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Stack(children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 250,
                  color: Colors.transparent,
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Roboto',
                    ),
                    decoration: inputStyle(labelText: 'Tech'),
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
