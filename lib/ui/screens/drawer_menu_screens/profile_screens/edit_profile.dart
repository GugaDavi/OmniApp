import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:omni_app/stores/profile_store/profile_store.dart';
import 'package:omni_app/ui/components/button.dart';
import 'package:omni_app/ui/components/input.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileStore profileStore = Provider.of<ProfileStore>(context);
    profileStore.editProfile.setProps(profileStore.userDev);
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
                    Input(
                      labelName: 'Name',
                      initValue: profileStore.editProfile.name,
                      onChanged: profileStore.editProfile.setName,
                    ),
                    Input(
                      labelName: 'Bio',
                      initValue: profileStore.editProfile.bio,
                      onChanged: profileStore.editProfile.setBio,
                    ),
                    Input(
                      labelName: 'Techs',
                      initValue: profileStore.editProfile.techs,
                      onChanged: profileStore.editProfile.setTechs,
                    ),
                    Input(
                      labelName: 'Latitude',
                      initValue: profileStore.editProfile.latitude,
                      onChanged: profileStore.editProfile.setLatitude,
                    ),
                    Input(
                      labelName: 'Longitude',
                      initValue: profileStore.editProfile.longitude,
                      onChanged: profileStore.editProfile.setLongitude,
                    ),
                    Observer(
                      builder: (_) {
                        return Button(
                          child: 'Editar',
                          onPressed: profileStore.editProfile.validate
                              ? () {
                                  profileStore.updateProfile();
                                  Navigator.pop(context);
                                }
                              : null,
                        );
                      },
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
