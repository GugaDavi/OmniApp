import 'package:flutter/material.dart';
import 'package:omni_app/routes/route_consts.dart';
import 'package:omni_app/ui/components/button.dart';
import 'package:omni_app/ui/styles/colors.dart';
import 'package:omni_app/ui/styles/responsive_widget.dart';
import 'package:omni_app/ui/styles/styles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isVisibleKeyboard = MediaQuery.of(context).viewInsets.bottom > 0;
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    ResponsiveWidget responsive = ResponsiveWidget(heightScreen, widthScreen);

    return Material(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrainsts) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constrainsts.maxHeight),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [primaryDarkColor, primaryColor]),
                ),
                padding:
                    EdgeInsets.all(responsive.sizeCalc(5, SizeDimension.width)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(
                      Icons.person_pin_circle,
                      size: responsive.sizeCalc(15, SizeDimension.height),
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
                    Button(
                      child: 'Entrar',
                      onPressed: () => Navigator.of(context).pushNamed(home),
                    ),
                    SizedBox(
                      height: isVisibleKeyboard
                          ? responsive.sizeCalc(25, SizeDimension.height)
                          : 0,
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
