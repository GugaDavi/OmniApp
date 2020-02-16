import 'package:flutter/material.dart';
import 'package:omni_app/models/dev_model.dart';
import 'package:omni_app/routes/route_consts.dart';
import 'package:omni_app/stores/login_store/login_store.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:omni_app/ui/styles/responsive_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginStore loginStore = Provider.of<LoginStore>(context);
    DevModel dev = loginStore.userDev;

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
                        dev.avatarUrl,
                        height: responsive.sizeCalc(20, SizeDimension.height),
                        width: responsive.sizeCalc(20, SizeDimension.height),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      dev.name,
                      style: TextStyle(color: Colors.black, fontSize: 26),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      dev.techs.join(', '),
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      dev.bio,
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          dev.location.latitude.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          dev.location.longitude.toString(),
                          style: TextStyle(fontSize: 16),
                        )
                      ],
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
