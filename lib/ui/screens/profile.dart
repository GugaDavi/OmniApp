import 'package:flutter/material.dart';
import 'package:omni_app/routes/route_consts.dart';
import 'package:omni_app/ui/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryDarkColor,
        title: Text('Perfil'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(200.0),
              child: Image.network(
                'https://avatars2.githubusercontent.com/u/2254731?v=4',
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Diego Fernandes',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'React, React Native, Node',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'CTO na @Rocketseat. Apaixonado pelas melhores tecnologias de desenvolvimento web e mobile.',
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
                  'Latitude: -46.641152',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Latitude: -23.6404736',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed(editProfile),
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 50, right: 50),
              color: secondColor,
              child: Text('Editar',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}