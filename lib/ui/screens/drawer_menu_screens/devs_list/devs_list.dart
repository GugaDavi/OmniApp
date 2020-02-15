import 'package:flutter/material.dart';
import 'package:omni_app/ui/styles/colors.dart';

class DevList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthScreenSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryDarkColor,
        title: Text('Lista de Devs'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 21, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[_devCard(widthScreenSize)],
          ),
        ),
      ),
    );
  }

  Stack _devCard(double widthScreenSize) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: primaryLightColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    offset: Offset.fromDirection(10, -3),
                    blurRadius: 7)
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(75.0),
                    child: Image.network(
                      'https://avatars2.githubusercontent.com/u/2254731?v=4',
                      height: 75,
                      width: 75,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: widthScreenSize * 60 / 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Diego Fernandes',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'React, React Native, Node',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'CTO na @Rocketseat. Apaixonado pelas melhores tecnologias de desenvolvimento web e mobile.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: InkWell(
            onTap: () {},
            child: Icon(
              Icons.open_in_new,
              size: 28,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
