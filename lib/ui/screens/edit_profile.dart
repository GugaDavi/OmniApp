import 'package:flutter/material.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:omni_app/ui/styles/styles.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondColor,
      appBar: AppBar(
        backgroundColor: primaryDarkColor,
        title: Text('Editar Perfil'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: inputStyle(labelText: 'Nome'),
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: inputStyle(labelText: 'Bio'),
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: inputStyle(labelText: 'Latitude'),
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: inputStyle(labelText: 'Longitude'),
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 50, right: 50),
              color: primaryColor,
              child: Text('Editar',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
