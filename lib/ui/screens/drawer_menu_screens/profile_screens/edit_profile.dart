import 'package:flutter/material.dart';
import 'package:omni_app/ui/components/button.dart';
import 'package:omni_app/ui/components/input.dart';
import 'package:omni_app/ui/styles/colors.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryDarkColor,
        title: Text('Editar Perfil'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: <Color>[primaryColor, primaryDarkColor]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Input(labelName: 'Name', controller: _nameController),
            Input(labelName: 'Bio', controller: _bioController),
            Input(labelName: 'Latitude', controller: _latitudeController),
            Input(labelName: 'Longitude', controller: _longitudeController),
            Button(
              child: 'Editar',
            )
          ],
        ),
      ),
    );
  }
}
