import 'package:flutter/material.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/stores/login_store/login_store.dart';
import 'package:omni_app/ui/components/button.dart';
import 'package:omni_app/ui/components/input.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginStore loginStore = Provider.of<LoginStore>(context);
    DevModel dev = loginStore.userDev;
    _nameController.text = dev.name;
    _bioController.text = dev.bio;
    _latitudeController.text = dev.location.latitude.toString();
    _longitudeController.text = dev.location.longitude.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryDarkColor,
        title: Text('Editar Perfil'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[primaryColor, primaryDarkColor]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Input(labelName: 'Name', controller: _nameController),
                    Input(labelName: 'Bio', controller: _bioController),
                    Input(
                        labelName: 'Latitude', controller: _latitudeController),
                    Input(
                        labelName: 'Longitude',
                        controller: _longitudeController),
                    Button(
                      child: 'Editar',
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
