import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:omni_app/routes/route_consts.dart';
import 'package:omni_app/stores/profile_store/profile_store.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:omni_app/ui/styles/responsive_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileStore profileStore = Provider.of<ProfileStore>(context);

    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    ResponsiveWidget responsive = ResponsiveWidget(heightScreen, widthScreen);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryDarkColor,
        title: Text('Perfil'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrains) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constrains.maxHeight),
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          responsive.sizeCalc(20, SizeDimension.height)),
                      child: Image.network(
                        profileStore.userDev.avatarUrl,
                        height: responsive.sizeCalc(20, SizeDimension.height),
                        width: responsive.sizeCalc(20, SizeDimension.height),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Observer(
                      builder: (_) {
                        return Text(
                          profileStore.userDev.name,
                          style: TextStyle(color: Colors.black, fontSize: 26),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Observer(
                      builder: (_) {
                        return Text(
                          profileStore.userDev.techs.join(', '),
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Observer(
                      builder: (_) {
                        return Text(
                          profileStore.userDev.bio,
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Observer(
                      builder: (_) {
                        return Column(
                          children: <Widget>[
                            Text(
                              'Latitude: ${profileStore.userDev.location.latitude.toString()}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Longitude: ${profileStore.userDev.location.longitude.toString()}',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed(editProfile),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 50, right: 50),
                      color: secondColor,
                      child: Text('Editar',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
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
