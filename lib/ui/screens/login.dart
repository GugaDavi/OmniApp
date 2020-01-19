import 'package:flutter/material.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:omni_app/ui/styles/styles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [primaryColor, primaryDarkColor.withOpacity(0.3)]),
        ),
        padding: EdgeInsets.only(top: 20, right: 20, bottom: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_pin_circle,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Roboto',
                ),
                decoration: inputStyle(
                    labelText: 'GitHub User',
                    suffix: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.person_add,
                          color: Colors.white,
                        )))),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {},
              padding: EdgeInsets.only(top: 15, bottom: 15),
              color: secondColor,
              child: Text('ENTRAR',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
